import 'package:flutter/material.dart';
import 'package:flutter_notes/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

//? soru işaretli comment / sonra bakacem buraya
//* yeşil comment / not alıyorum
//! kırmızı comment / hata ve uyarı var burada
// TODO: yapılacak şeyleri buraya yazıyorum
// // işi bitmiş comment
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark),
      home: const HomeScreen(),
    );
  }
}
