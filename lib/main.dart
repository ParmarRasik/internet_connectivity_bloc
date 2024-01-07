import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connectivity_bloc/blocs/internet_bloc.dart';
import 'package:internet_connectivity_bloc/cubits/intenet_cubit.dart';
import 'package:internet_connectivity_bloc/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>InternetBloc()),
        BlocProvider(create: (context)=>InternetCubit())
      ],
      child: MaterialApp(
          title: 'Internet Connectivity',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const HomeScreen(),
        )
    );
  }
}