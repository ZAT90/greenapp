import 'package:bloc_provider/bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:greenapp/screens/details.dart';
import 'package:greenapp/screens/splash.dart';
import './screens/home.dart';
import './provider/peopleProvider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProviderTree(
      blocProviders: [PeopleProvider()],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          '/': (context) => SplashPage(),
          '/home': (context) => HomePage(),
          '/detail': (context) => PeopleDetail(),
        },
      ),
    );
  }
}
