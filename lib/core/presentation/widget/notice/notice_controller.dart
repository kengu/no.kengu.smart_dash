import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash/feature/setting/data/setting_repository.dart';
import 'package:smart_dash/feature/setting/domain/setting.dart';
import 'package:smart_dash/core/presentation/widget/responsive_widget.dart';

part 'notice_controller.g.dart';

@riverpod
class NoticeController extends _$NoticeController {
  @override
  void build() {}

  static void showSnackBarByRef(
    BuildContext context,
    WidgetRef ref,
    String message, {
    String? location,
  }) {
    final shouldShow = ref
        .read(settingRepositoryProvider.notifier)
        .getOrDefault(SettingType.showSnackBar, false);
    if (shouldShow) {
      ref.read(noticeControllerProvider.notifier).showSnackBar(
            context,
            message,
            location: location,
          );
    } else {
      if (location != null) {
        context.go(location);
      }
    }
  }

  void showSnackBar(
    BuildContext context,
    String message, {
    String? location,
  }) {
    final content = SizedBox(
      height: 24,
      child: Center(child: Text(message)),
    );
    ScaffoldMessenger.of(context).showSnackBar(
      ResponsiveWidget.isAnyMobile(context)
          ? SnackBar(
              content: SafeArea(child: content),
              showCloseIcon: true,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              duration: const Duration(milliseconds: 1000),
              margin: ResponsiveWidget.toHeaderMargin(context),
            )
          : SnackBar(
              content: SafeArea(child: content),
              showCloseIcon: true,
              duration: const Duration(milliseconds: 1000),
            ),
    );
    if (location != null) {
      context.go(location);
    }
  }

  void showMaterialBanner(
    BuildContext context,
    String message, {
    String? location,
  }) {
    SchedulerBinding.instance.addPostFrameCallback((d) {
      final content = SizedBox(height: 24, child: Center(child: Text(message)));
      ScaffoldMessenger.of(context).showMaterialBanner(
        MaterialBanner(
          content: content,
          actions: [
            TextButton(
              onPressed: () =>
                  ScaffoldMessenger.of(context).clearMaterialBanners(),
              child: const Text('DISMISS'),
            ),
          ],
        ),
      );
      if (location != null) {
        context.go(location);
      }
    });
  }
}
