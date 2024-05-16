import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shoesly/core/di/di_config.config.dart';

final getIt = GetIt.instance;
@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
Future<void> configureDependencies() async {
  getIt.init();
}
