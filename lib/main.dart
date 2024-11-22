import 'package:escobar/countries_list.dart';
import 'package:escobar/dropdown_menu.dart';
import 'package:escobar/dropdown_practice.dart';
import 'package:escobar/splash_Screen.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(Myapp());
}

class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: const homestate(),
      ),
    );
  }
}
