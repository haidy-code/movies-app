import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/HomeScreen.dart';
import 'package:movies_app/MyThemeData.dart';
import 'package:movies_app/browse/BrowseDetails.dart';
import 'package:movies_app/home/MovieDetails.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme:MyThemeData.lightTheme ,
      home: HomeScreen(),
      routes: {
        HomeScreen.routename: (buildcontext) => HomeScreen(),
        MovieDetails.routename: (buildcontext) => MovieDetails(),
        BrowseDetails.routename: (buildcontext) => BrowseDetails(),
      },
      initialRoute: HomeScreen.routename,
    );
  }
}



