import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quadbtech_test/provider/homescreen_provider.dart';
import 'package:quadbtech_test/view/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => HomescreenProvider())
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme:
              ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.black),
          home: const Splashscreen()),
    );
  }
}
