import 'package:flutter/material.dart';
import 'package:finjoy/features/splash/screens/splash_screen.dart';

 void main(){
  runApp(FinjoyApp());
 }

class FinjoyApp extends StatelessWidget{
  const FinjoyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finjoy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: SplashScreen()
    );
  }
}