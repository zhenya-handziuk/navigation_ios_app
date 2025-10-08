import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/init_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InitBloc, InitState>(
      listener: (content, state) {
        print('Listener state: $state');
        if (state is InitLoaded) {
          // Navigator.of(context).pushReplacement(
          //   MaterialPageRoute(builder: (_) => HomePage()),
          // );
        } else if (state is InitError) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          });
        }
      },
      builder: (context, state) {
        print('Builder state: $state');
        if (state is InitLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        return const Scaffold(
          body: Center(child: Text('Welcome to the App!')),
        );
      },
    );
  }
}