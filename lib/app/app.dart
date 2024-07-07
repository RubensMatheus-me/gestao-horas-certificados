import 'package:flutter/material.dart';
import 'package:gestao_horas_certificado/app/view/front/certificate_list_front.dart';
import 'package:gestao_horas_certificado/app/view/front/matter_list_front.dart';
import 'package:gestao_horas_certificado/app/view/front/matter_add_front.dart';

class MyApp extends StatelessWidget {
  static const HOME = '/';
  static const MATTERS = 'add-matter';
  static const CERTIFICATES = 'add-certificate';

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
        MATTERS: (context) => AddMatter(),
        CERTIFICATES: (context) => AddCertificate(),
      },
    );
  }
}