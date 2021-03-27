import 'package:flutter/material.dart';
import 'package:homewardtest/models/blog/blog_list.dart';
import 'package:homewardtest/views/auth/login_screen.dart';
import 'package:homewardtest/views/blog/blog_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlogListScreen(),
    );
  }
}