import 'package:flutter/material.dart';
import 'choose_homework.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ChooseHomework(),
      debugShowCheckedModeBanner: false,
    );
  }
}
