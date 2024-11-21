import 'package:smart_dash_integration/smart_dash_integration.dart';

export 'domain/metno_forecast_device.dart';

class MetNo {
  static const key = 'metno';

  static final Integration definition = Integration(
    key: key,
    type: IntegrationType.weather,
    name: "MET Location Forecast API",
    image: "met.png",
    category: "Weather Services",
    description: "Enables weather forecasts",
    fields: [],
    dependsOn: [],
    instances: 1,
    system: false,
    enabled: true,
  );
}
