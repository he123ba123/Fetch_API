import 'package:fetch_api/feature/presentation/cubit/post_cubit.dart';
import 'package:fetch_api/feature/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => PostCubit()..fetchDataCubit(),
        child: const HomeScreen(),
      ),
    );
  }
}
