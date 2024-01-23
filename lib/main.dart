import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_api_project/features/home/prezentation/pages/home_screen.dart';
import 'package:new_api_project/features/home/prezentation/bloc/weather_bloc.dart';

void main() async {
  runApp(AppPage());
}

class AppPage extends StatelessWidget {
  const AppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => WeatherBloc(),
        child: HomeScreen(),
      ),
    );
  }
}
