import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:udemycoursepartquiz/provider/quizprovider.dart';
import 'package:udemycoursepartquiz/ui/home.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => QuizProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: QuizApp(),
      ),
    );
  }
}
