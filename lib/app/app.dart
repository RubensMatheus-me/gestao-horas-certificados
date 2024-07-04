import 'package:flutter/material.dart';
import 'package:gestao_horas_certificado/app/view/front/matter_list_front.dart';
import 'package:gestao_horas_certificado/app/view/front/matter_add_front.dart';

class MyApp extends StatelessWidget {
  static const HOME = '/';
  static const ADD_MATTERS = 'add-matter';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        HOME: (context) => MatterList(),
        ADD_MATTERS: (context) => AddMatter(),
      },
    );
  }
}