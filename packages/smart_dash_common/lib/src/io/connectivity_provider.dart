import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'connectivity.dart';

part 'connectivity_provider.g.dart';

@Riverpod(keepAlive: true)
Connectivity connectivity(ConnectivityRef _) => Connectivity.offline;
