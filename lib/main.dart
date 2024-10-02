import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/service_locator.dart';
import 'features/groceries/data/data_sources/local/grocery_data_source.dart';
import 'features/groceries/presentation/blocs/grocery_bloc.dart';
import 'features/groceries/presentation/pages/grocery_list_screen.dart';

Future<void> main() async {
  await GroceryDataSource.initializeDB();
  ServiceLocator.init();
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (BuildContext context) => sl<GroceryBloc>(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grocery App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const GroceryListScreen(),
    );
  }
}
