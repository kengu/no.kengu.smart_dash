import 'package:riverpod/riverpod.dart';
import 'package:smart_dash_integration/smart_dash_integration.dart';

/// [Integration] service endpoint.
abstract class IntegrationService<D> {
  IntegrationService(this.ref, this.type);

  /// Get [Ref] of [Provider] owning this service
  final Ref ref;

  /// Get [IntegrationType] implemented by this [IntegrationService]
  final IntegrationType type;

  /// Get list of registered [Integration]s of this [IntegrationService.type]
  List<Integration> get integrations;
}
