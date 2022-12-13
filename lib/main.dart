// ignore_for_file: always_use_package_imports, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/widgets/main_wrapper.dart';
import 'package:weather_app/features/feature_weather/presentation/bloc/bloc/home_bloc.dart';

import 'package:weather_app/locator.dart';

import 'features/feature_bookmark/presentation/bloc/bookmark_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //init getIt Locator
  await setup();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => locator<HomeBloc>(),
          ),
          BlocProvider(create: (_) => locator<BookmarkBloc>()),
        ],
        child: MainWrapper(),
      ),
    );
  }
}
