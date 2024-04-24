import 'package:nanoid/nanoid.dart';
import 'package:optional/optional.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash/core/presentation/widget/form/async_form_controller.dart';
import 'package:smart_dash/core/presentation/widget/load/async_load_controller.dart';
import 'package:smart_dash/feature/flow/application/flow_manager.dart';
import 'package:smart_dash/feature/flow/data/block_repository.dart';
import 'package:smart_dash/feature/flow/domain/block.dart';
import 'package:smart_dash/util/data/json.dart';

part 'block_flow_form_controller.g.dart';

class BlockFlowFormQuery {
  BlockFlowFormQuery({
    required this.id,
    this.copy = false,
  });

  final bool copy;
  final String? id;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BlockFlowFormQuery &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          copy == other.copy;

  @override
  int get hashCode => id.hashCode ^ copy.hashCode;
}

@riverpod
class BlockFlowFormController extends _$BlockFlowFormController
    with
        AsyncLoadController<BlockFlowFormQuery, BlockModel>,
        AsyncFormController<BlockFlowFormQuery, BlockModel> {
  @override
  FutureOr<Optional<BlockModel>> build(BlockFlowFormQuery query) =>
      super.build(query);

  @override
  FormGroup buildForm(Optional<BlockModel> data) {
    final model = data.orElseNull;
    return fb.group(<String, Object>{
      // Hidden fields
      BlockFields.id: FormControl<String>(
        value: model?.id,
      ),
      BlockFields.state: FormControl<JsonObject>(
        value: model?.state.toJson(),
      ),
      // Rendered fields
      BlockFields.label: FormControl<String>(
        value: model?.label,
        validators: [Validators.required],
      ),
      BlockFields.description: FormControl<String>(
        value: model?.description,
        validators: [Validators.required],
      ),
      BlockFields.enabled: FormControl<bool>(
        value: model?.enabled,
        validators: [Validators.required],
      ),
      BlockFields.trigger: fb.group(<String, Object>{
        BlockTriggerFields.any: FormControl<bool>(
          value: model?.trigger.any,
          validators: [Validators.required],
        ),
        BlockTriggerFields.debounceCount: FormControl<int>(
          value: model?.trigger.debounceCount,
          validators: [Validators.required, Validators.number],
        ),
        BlockTriggerFields.debounceAfter: FormControl<int>(
          value: model?.trigger.debounceAfter,
          validators: [Validators.required, Validators.number],
        ),
        BlockTriggerFields.repeatCount: FormControl<int>(
          value: model?.trigger.repeatCount,
          validators: [Validators.required, Validators.number],
        ),
        BlockTriggerFields.repeatAfter: FormControl<int>(
          value: model?.trigger.repeatAfter,
          validators: [Validators.required, Validators.number],
        ),
        BlockTriggerFields.onTags: FormControl<List<String>>(
          value: model?.trigger.onTags,
          validators: [Validators.required],
        ),
        BlockTriggerFields.onTypes: FormControl<List<String>>(
          value: model?.trigger.onTypes.map((e) => e.name).toList(),
          validators: [Validators.required],
        ),
      }),
      BlockFields.parameters: FormArray<JsonObject>([
        ...(model?.parameters ?? []).map(buildParameterFormGroup),
      ]),
      BlockFields.conditions: FormArray<JsonObject>([
        ...(model?.conditions ?? []).map(buildConditionFormGroup),
      ]),
      BlockFields.whenTrue: FormArray<JsonObject>([
        ...(model?.whenTrue ?? []).map(buildActionFormGroup),
      ]),
      BlockFields.whenFalse: FormArray<JsonObject>([
        ...(model?.whenFalse ?? []).map(buildActionFormGroup),
      ]),
    });
  }

  static FormGroup buildParameterFormGroup(BlockParameter data) {
    return fb.group(<String, Object>{
      BlockParameterFields.tag: FormControl<String>(
        value: data.tag,
        validators: [Validators.required],
      ),
      BlockParameterFields.name: FormControl<String>(
        value: data.name,
        validators: [Validators.required],
      ),
      BlockParameterFields.value: FormControl<Object>(
        value: data.value,
      ),
      BlockParameterFields.type: FormControl<String>(
        value: data.type.name,
      ),
      BlockParameterFields.unit: FormControl<String>(
        value: data.unit.name,
      ),
    });
  }

  static FormGroup buildConditionFormGroup(BlockCondition data) {
    return fb.group(<String, Object>{
      BlockConditionFields.label: FormControl<String>(
        value: data.label,
        validators: [Validators.required],
      ),
      BlockConditionFields.description: FormControl<Object>(
        value: data.description,
      ),
      BlockConditionFields.expression: FormControl<String>(
        value: data.expression,
        validators: [Validators.required],
      ),
      BlockConditionFields.variables: FormArray<JsonObject>([
        ...data.variables.map(buildVariableFormGroup),
      ]),
    });
  }

  static FormGroup buildVariableFormGroup(BlockVariable data) {
    return fb.group(<String, Object>{
      BlockVariableFields.tag: FormControl<String>(
        value: data.tag,
        validators: [Validators.required],
      ),
      BlockVariableFields.name: FormControl<String>(
        value: data.name,
        validators: [Validators.required],
      ),
      BlockVariableFields.label: FormControl<String>(
        value: data.label,
        validators: [Validators.required],
      ),
      BlockVariableFields.description: FormControl<String>(
        value: data.description,
        validators: [Validators.required],
      ),
      BlockVariableFields.type: FormControl<String>(
        value: data.type.name,
      ),
      BlockVariableFields.unit: FormControl<String>(
        value: data.unit.name,
      ),
    });
  }

  static FormGroup buildActionFormGroup(BlockAction data) {
    return fb.group(<String, Object>{
      BlockActionFields.label: FormControl<String>(
        value: data.label,
        validators: [Validators.required],
      ),
      BlockActionFields.description: FormControl<String>(
        value: data.description,
        validators: [Validators.required],
      ),
      BlockActionFields.type: FormControl<String>(
        value: data.type.name,
      ),
    });
  }

  @override
  BlockModel buildData(Map<String, Object?> value) {
    return BlockModel.fromJson(value);
  }

  @override
  Future<Optional<BlockModel>> load(BlockFlowFormQuery query) async {
    if (query.id == null) {
      return Optional.of(BlockModel.empty(
        nanoid(),
        'New Flow',
      ));
    }
    final model = await ref.read(blockRepositoryProvider).get(query.id!);
    if (model.isPresent && query.copy) {
      final current = model.value;
      return Optional.of(model.value.copyWith(
        id: nanoid(),
        state: BlockState.empty(),
        label: '${current.label} Copy',
      ));
    }
    return model;
  }

  @override
  Future<bool> save(BlockModel data) async {
    return ref.read(flowManagerProvider).addOrUpdate(data);
  }
}
