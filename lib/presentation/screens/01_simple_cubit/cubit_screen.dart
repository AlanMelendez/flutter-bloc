import 'package:blocs_app/config/config.dart';
import 'package:blocs_app/presentation/blocs/01-simple_cubit/username_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CubitScreen extends StatelessWidget {
  const CubitScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final userNameCubit = context.watch<UsernameCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubit'),
      ),
      body: Center(
        // child: Text(userNameCubit.state),
        child: BlocBuilder<UsernameCubit, String>(
          builder: (context, state) {
            return Text(state);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          userNameCubit.setUserName(RandomGenerator.getRandomName());
        },
        child: const Icon(Icons.edit),
      ),
    );
  }
}