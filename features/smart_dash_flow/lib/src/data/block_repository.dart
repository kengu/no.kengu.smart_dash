import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_common/smart_dash_common.dart';
import 'package:smart_dash_datasource/smart_dash_datasource.dart';
import 'package:smart_dash_flow/smart_dash_flow.dart';

part 'block_repository.g.dart';

class BlockRepository extends HiveRepository<String, BlockModel> {
  BlockRepository(List<JsonObject> defaults)
      : _defaults = defaults,
        super(
          key: 'blocks',
          box: 'registered',
          adapter: BlockAdapter(),
        );

  final List<JsonObject> _defaults;

  @override
  String toKey(String id) => id;

  @override
  String toId(BlockModel item) => item.id;

  Future<List<String>> getIds() => getKeys();

  @override
  Future<List<BlockModel>> seed() async {
    // Initialize default flows
    return _defaults.map(BlockModel.fromJson).toList();
  }
}

@Riverpod(keepAlive: true)
BlockRepository blockRepository(BlockRepositoryRef ref) {
  return BlockRepository(_defaults);
}

// TODO: Read from file system
List<JsonObject> get _defaults {
  final json = jsonDecode(
    '''
[
  {
    "id": "d:1",
    "enabled": true,
    "type": "DeviceBlockFlow",
    "label": "Power Limit Notification",
    "description": "Notify when power exceeds limit",
    "state": {
      "repeated": 0,
      "value": false,
      "tags": []
    },
    "trigger": {
      "any": true,
      "onTypes": [
        "device"
      ],
      "onTags": [
        "measure_power:sikom:device:541905"
      ],
      "repeatCount": 3,
      "repeatAfter": 300,
      "debounceCount": 0,
      "debounceAfter": 300
    },
    "parameters": [
      {
        "tag": "limit",
        "name": "limit",
        "value": 8000,
        "type": "int",
        "unit": "power",
        "label": "Limit",
        "description": "Limit"
      }
    ],
    "conditions": [
      {
        "label": "Limit",
        "description": "Power limit",
        "expression": "power > limit",
        "variables": [
          {
            "tag": "power",
            "name": "measure_power:sikom:device:541905",
            "type": "int",
            "unit": "power",
            "label": "Effektstyring",
            "description": "Effektstyring"
          }
        ]
      }
    ],
    "whenTrue": [
      {
        "type": "notification",
        "label": "Power Limit Notification",
        "description": "Power exceeded \${limit}"
      }
    ],
    "whenFalse": []
  },
  {
    "id": "d:2",
    "enabled": true,
    "type": "DeviceBlockFlow",
    "label": "Snow Weight Limit Notification",
    "description": "Notify when snow weight exceeds limit",
    "state": {
      "value": false,
      "repeated": 257,
      "tags": [
        {
          "tag": "snowDepth",
          "name": "snowDepth",
          "value": 132,
          "type": "int",
          "unit": "snowDepth"
        },
        {
          "tag": "snowWeight",
          "name": "snowWeight",
          "value": 398,
          "type": "int",
          "unit": "snowWeight"
        }
      ],
      "lastChanged": "2024-04-04T18:09:37.692912"
    },
    "trigger": {
      "any": false,
      "repeatCount": 3,
      "repeatAfter": 300,
      "debounceCount": 0,
      "debounceAfter": 0,
      "onTags": [
        "measure_snow_weight:nysny:device:skirvedalen"
      ],
      "onTypes": [
        "device"
      ]
    },
    "whenTrue": [
      {
        "label": "Snow Weight Limit Notification",
        "description": "Snow Weight exceeded \${limit}",
        "type": "notification"
      }
    ],
    "whenFalse": [],
    "parameters": [
      {
        "tag": "limit",
        "name": "limit",
        "value": 600,
        "type": "int",
        "unit": "snowWeight"
      }
    ],
    "conditions": [
      {
        "label": "Limit",
        "expression": "snowWeight > limit",
        "description": "Snow Weight limit",
        "variables": [
          {
            "tag": "snowWeight",
            "name": "measure_snow_weight:nysny:device:skirvedalen",
            "label": "Snøtyngde",
            "type": "int",
            "unit": "snowWeight",
            "description": "Snøtyngde"
          }
        ]
      }
    ]
  }
]
''',
  );
  final list = List.from(json as List).cast<JsonObject>();
  for (final it in list) {
    print(it);
  }
  return list;
}

class BlockAdapter extends TypedAdapter<BlockModel> {
  BlockAdapter() : super(HiveTypeId.block);

  static final instance = BlockAdapter();

  @override
  BlockModel read(BinaryReader reader) {
    final data = reader.read();
    return BlockModel.fromJson(jsonDecode(
      data,
    ));
  }

  @override
  void write(BinaryWriter writer, BlockModel obj) {
    writer.write(jsonEncode(
      obj.toJson(),
    ));
  }
}
