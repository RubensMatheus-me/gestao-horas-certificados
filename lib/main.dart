import 'package:flutter/material.dart';
import 'package:gestao_horas_certificado/app/app.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart';
import 'package:gestao_horas_certificado/app/injection.dart'; 
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() async {
  if(!kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS)) {
    sqfliteFfiInit();
  }
  databaseFactory = databaseFactoryFfi;

  await setupInjection();
  runApp(MyApp());
}
