import 'package:flutter/material.dart';
import 'routes.dart';
void main() {
 runApp(const MyApp());
}


class MyApp extends StatelessWidget {
 const MyApp({super.key});

// this is the new db version
 @override
 Widget build(BuildContext context) {
   return MaterialApp(
     title: 'UI ASSIGNMENT 01',
     theme: ThemeData(primarySwatch: Colors.blue),
     initialRoute: '/home',
     routes: appRoutes,
   );
 }
}

