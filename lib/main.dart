import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipsy_assignment/blocs/bloc/movie_detail_bloc.dart';

import 'package:shipsy_assignment/screens/home_screen/home_screen.dart';
import 'package:shipsy_assignment/services/client_api_service.dart';
import 'package:shipsy_assignment/services/injection_container.dart';

void main() {
  setup();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MovieDetailBloc(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.redAccent,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.redAccent,
            centerTitle: true,
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
