import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'get_it.config.dart';

final getIt = GetIt.instance;

extension HardcodedGetIt on GetIt {
  GetIt get hardcoded => this;
}

@InjectableInit(
  initializerName: 'initialize',
)
Future<void> configureDependencies() => getIt.initialize();