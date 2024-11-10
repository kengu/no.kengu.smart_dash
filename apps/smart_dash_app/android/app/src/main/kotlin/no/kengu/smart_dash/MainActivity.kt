/*
package no.kengu.smart_dash

import io.flutter.embedding.android.FlutterActivity

class MainActivity : FlutterActivity() {
}
*/

// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
package no.kengu.smart_dash


import android.app.ActivityManager
import android.content.BroadcastReceiver
import android.content.Context
import android.content.ContextWrapper
import android.content.Intent
import android.content.IntentFilter
import android.os.BatteryManager
import android.os.Build
import android.os.Process
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.EventChannel.EventSink
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import kotlinx.coroutines.CoroutineScope
import java.io.RandomAccessFile
import kotlin.time.Duration
import kotlin.time.DurationUnit
import kotlin.time.toDuration
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.cancel
import kotlinx.coroutines.withContext
import kotlinx.coroutines.delay
import kotlinx.coroutines.launch


class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        EventChannel(
            flutterEngine.dartExecutor,
            CHARGING_CHANNEL
        ).setStreamHandler(
            object : EventChannel.StreamHandler {
                private var chargingStateChangeReceiver: BroadcastReceiver? = null
                override fun onListen(arguments: Any?, events: EventSink) {
                    chargingStateChangeReceiver = createChargingStateChangeReceiver(events)
                    registerReceiver(
                        chargingStateChangeReceiver, IntentFilter(Intent.ACTION_BATTERY_CHANGED)
                    )
                }

                override fun onCancel(arguments: Any?) {
                    unregisterReceiver(chargingStateChangeReceiver)
                    chargingStateChangeReceiver = null
                }
            }
        )
        MethodChannel(
            flutterEngine.dartExecutor,
            BATTERY_CHANNEL
        ).setMethodCallHandler { call, result ->
            if (call.method == "getBatteryLevel") {
                val batteryLevel: Int = batteryLevel
                if (batteryLevel != -1) {
                    result.success(batteryLevel)
                } else {
                    result.error("UNAVAILABLE", "Battery level not available.", null)
                }
            } else {
                result.notImplemented()
            }
        }
        MethodChannel(
            flutterEngine.dartExecutor,
            LOAD_CHANNEL
        ).setMethodCallHandler { call: MethodCall, result: MethodChannel.Result ->
            when (call.method) {
                "getCpuUsage" -> {
                    fetchCpuUsage(result)
                }

                "getMemoryUsage" -> {
                    result.success(getMemoryInfo())
                }

                else -> {
                    result.notImplemented()
                }
            }
        }
    }

    private fun createChargingStateChangeReceiver(events: EventSink): BroadcastReceiver {
        return object : BroadcastReceiver() {
            override fun onReceive(context: Context, intent: Intent) {
                val status = intent.getIntExtra(BatteryManager.EXTRA_STATUS, -1)
                if (status == BatteryManager.BATTERY_STATUS_UNKNOWN) {
                    events.error("UNAVAILABLE", "Charging status unavailable", null)
                } else {
                    val isCharging = status == BatteryManager.BATTERY_STATUS_CHARGING ||
                            status == BatteryManager.BATTERY_STATUS_FULL
                    events.success(if (isCharging) "charging" else "discharging")
                }
            }
        }
    }

    private val batteryLevel: Int
        get() = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            val batteryManager = getSystemService(BATTERY_SERVICE) as BatteryManager
            batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)
        } else {
            val intent = ContextWrapper(applicationContext).registerReceiver(
                null,
                IntentFilter(Intent.ACTION_BATTERY_CHANGED)
            )
            intent!!.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100 /
                    intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1)
        }

    private val coroutineScope = CoroutineScope(Dispatchers.Main)

    private fun fetchCpuUsage(result: MethodChannel.Result) {
        coroutineScope.launch {
            val usage = getProcessCpuUsage(360.toDuration(DurationUnit.MILLISECONDS))
            val cpu: MutableMap<String, Any> = HashMap()
            cpu["app"] = usage
            cpu["total"] = usage
            result.success(cpu);
        }
    }

    override fun onDestroy() {
        super.onDestroy()
        coroutineScope.cancel() // Cancel the scope to avoid memory leaks
    }


    private fun getMemoryInfo(): Map<String, Any> {

        val pid = Process.myPid()
        val manager = context.getSystemService(Context.ACTIVITY_SERVICE) as ActivityManager
        val systemInfo = ActivityManager.MemoryInfo()
        manager.getMemoryInfo(systemInfo)
        val processInfo = manager.getProcessMemoryInfo(intArrayOf(pid))
        val app = (processInfo[0].totalPss * 1024)

        val mem: MutableMap<String, Any> = HashMap()
        mem["app"] = app
        mem["free"] = systemInfo.availMem
        mem["total"] = systemInfo.totalMem
        mem["threshold"] = systemInfo.threshold
        mem["lowMemory"] = systemInfo.lowMemory
        return mem
    }

    private suspend fun getProcessCpuUsage(duration: Duration): Float = withContext(Dispatchers.IO) {
        val pid = Process.myPid()
        val maxFreq = getMaxCpuFreq() // in kHz
        val cpuTime1 = getProcessCpuTime(pid)
        val numberOfCores = Runtime.getRuntime().availableProcessors()

        delay(duration.inWholeMilliseconds) // Sleep for given ms

        val cpuTime2 = getProcessCpuTime(pid)

        val ticksPerSecond = 100  // Common value for USER_HZ on unmodified Linux systems for Android
        val msPerTick = 1000 / ticksPerSecond
        val processCpuTime1 = cpuTime1.sum() * msPerTick
        val processCpuTime2 = cpuTime2.sum() * msPerTick

        // Total CPU time for all cores in the same period
        val totalCpuTimeAvailable = numberOfCores * maxFreq * duration.inWholeMilliseconds // in kHz

        val processCpuTimeUsed = processCpuTime2 - processCpuTime1
        if (totalCpuTimeAvailable > 0) {
            (maxFreq * processCpuTimeUsed.toFloat() / totalCpuTimeAvailable) * 100.0f
        } else {
            0f
        }
    }

    private suspend fun getMaxCpuFreq(): Long = withContext(Dispatchers.IO) {
        var maxFreq = 0L
        val numberOfCores = Runtime.getRuntime().availableProcessors()
        for (i in 0 until numberOfCores) {
            try {
                RandomAccessFile(
                    "/sys/devices/system/cpu/cpu$i/cpufreq/cpuinfo_max_freq",
                    "r"
                ).use { reader ->
                    val line = reader.readLine()
                    val freq = line.toLong()
                    if (freq > maxFreq) {
                        maxFreq = freq
                    }
                }
            } catch (e: Exception) {
                e.printStackTrace()
            }
        }
        maxFreq // Frequency in kHz
    }

    private suspend fun getProcessCpuTime(pid: Int): LongArray = withContext(Dispatchers.IO) {
        try {
            RandomAccessFile("/proc/$pid/stat", "r").use { reader ->
                val toks = reader.readLine().split(" ")
                val utime = toks[13].toLong()
                val stime = toks[14].toLong()
                longArrayOf(utime, stime)
            }
        } catch (e: Exception) {
            e.printStackTrace()
            longArrayOf(0, 0)
        }
    }

    companion object {
        private const val LOAD_CHANNEL = "no.kengu.smart_dash/load"
        private const val BATTERY_CHANNEL = "no.kengu.smart_dash/battery"
        private const val CHARGING_CHANNEL = "no.kengu.smart_dash/charging"
    }

}
