import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connectivity_bloc/blocs/internet_bloc.dart';
import 'package:internet_connectivity_bloc/blocs/internet_state.dart';
import 'package:internet_connectivity_bloc/cubits/intenet_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          //Bloc with Cubit
          child: BlocConsumer<InternetCubit, InternetStateEnum>(
            listener: (context, state) {
              if (state == InternetStateEnum.gain) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Connected!"),
                  backgroundColor: Colors.green,
                ));
              } else if (state == InternetStateEnum.lost) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Not connected!"), backgroundColor: Colors.redAccent),
                );
              }
            },
            builder: (context, state) {
              if (state == InternetStateEnum.gain) {
                return const Text("Connected!");
              } else if (state == InternetStateEnum.lost) {
                return const Text("Not connected!");
              }
              return const Text("Loading...");
            },
          ),
          //Simple Bloc

          /*child: BlocBuilder<InternetBloc,InternetState>(
            builder: (context, state) {
              if(state is InternetGainedState){
                return const Text("Connected!");
              }else if(state is InternetLostState){
                return const Text("Not connected!");
              }
              return const Text("Loading...");
            }
          ),*/
        ),
      ),
    );
  }
}
