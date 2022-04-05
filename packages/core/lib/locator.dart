import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

import 'logger.dart';
import 'services/api.service.dart';
import 'services/messenger.service.dart';
import 'services/navigator.service.dart';

GetIt dependency = GetIt.instance;

class DependencyInjector {
  static final Logger _log = getLogger('StoreInjector');

  static Future<void> setupInjector() async {
    _log.d('Iniciando o serviço de navegação');
    dependency.registerLazySingleton(() => NavigatorService());
    _log.d('Iniciando o serviço de messenger');
    dependency.registerLazySingleton(() => MessengerService());
    _log.d('Iniciando o serviço de api');
    dependency.registerLazySingleton(() => ApiService());
  }
}
