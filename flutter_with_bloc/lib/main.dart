import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_with_bloc/constants/app_constants.dart' as AppConstants;
import 'package:flutter_with_bloc/view/screens/home_screen.dart';
import 'package:flutter_with_bloc/view_model/bloc/country_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CountryBloc(),
      child: MaterialApp(
        title: AppConstants.APP_TITLE,
        theme: AppConstants.APP_THEME,
        home: const HomeScreen(),
      ),
    );
  }
}
