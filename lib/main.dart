import 'package:flutter/material.dart';
import 'package:movies/core/services/services_locator.dart';
import 'package:movies/movies/data/datasource/movies_remote_data_source.dart';
import 'package:movies/movies/data/repository/movies_repository.dart';
import 'package:movies/movies/domain/entities/movie.dart';
import 'package:movies/movies/domain/repository/base_repository.dart';
import 'package:movies/movies/presentation/controller/movies_event.dart';
import 'package:movies/movies/presentation/screens/movies_screen.dart';

import 'core/utils/app_string.dart';
import 'movies/domain/usecase/get_now_playing.dart';

void main() {
  ServicesLocator().initial();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppString.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
          scaffoldBackgroundColor: Colors.black,
          appBarTheme: const AppBarTheme(backgroundColor: Colors.black)),
      home: const MoviesScreen(),
    );
  }
}




// Future<void> _showMyDialog(context) async {
//   return showDialog(
//     context: context,
//     barrierDismissible: false, // user must tap button! اذا هي فولس يجب على المستخدم الضغط على الزر
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: const Text('شكراً',textAlign: TextAlign.center,),
//         content:  SingleChildScrollView(
//           child: ListBody(
//             children:const [
//               Icon(Icons.error_outline,color: Colors.red,size: 50,),
//               Text('خدمات اخر',textAlign: TextAlign.center),
//             ],
//           ),
//         ),
//         actions:[
//           TextButton(
//             child: const Text('شكراً'),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//         ],
//       );
//     },
//   );
// }

