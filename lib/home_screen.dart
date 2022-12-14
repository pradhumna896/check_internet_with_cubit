import 'package:cubitinternet/cubit/internet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocConsumer<InternetCubit,InternetState>(
          builder: ((context, state) {
            if(state == InternetState.Gained){
              return const Text("Connected!");
            }else if(state == InternetState.Lost){
              return const Text("Not Connected!");
            }else{
              return const Text("Loading...");
            }
            
          }), 
          listener: ((context, state) {
              if(state == InternetState.Gained){
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                backgroundColor: Colors.green,
                content: Text("Connected!")));
            }else if(state == InternetState.Lost){
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                backgroundColor: Colors.red,
                content: Text("Not Connected!")));
            }
          }), ),
      ),
    );
  }
}