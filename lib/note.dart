import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/movies/presentation/controller/movies_event.dart';
import '../../../core/services/services_locator.dart';
import 'movies/presentation/controller/movies_bloc.dart';
import 'movies/presentation/controller/movies_state.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MoviesBloc>()..add(GetNowPlayingMoviesEvent()),
      lazy: false,
      child: BlocBuilder<MoviesBloc, MoviesState>(
        builder: (context, state) {
          return const Scaffold();
        },
      ),
    );
  }
}


Future<void> showMyDialog(context,String msg) async {
  return showDialog(
    context: context,
    barrierDismissible: false, // user must tap button! اذا هي فولس يجب على المستخدم الضغط على الزر
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('خطاء في جلب البيانات',textAlign: TextAlign.center,),
        content:  SingleChildScrollView(
          child: ListBody(
            children: [
              const Icon(Icons.error_outline,color: Colors.red,size: 50,),
              Text(msg,textAlign: TextAlign.center),
            ],
          ),
        ),
        actions:[
          TextButton(
            child: const Text('شكراً'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}