import 'package:get_it/get_it.dart';
import 'package:gorcery_app/features/groceries/data/data_sources/local/grocery_data_source.dart';
import 'package:gorcery_app/features/groceries/presentation/blocs/grocery_bloc.dart';

final sl = GetIt.instance;

class ServiceLocator {
  static void init() {
    // DataSource
    sl.registerLazySingleton<GroceryDataSource>(() => GroceryDataSource());

    sl.registerFactory(() => GroceryBloc(sl()));
  }
}
