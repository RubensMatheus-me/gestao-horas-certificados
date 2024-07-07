import 'package:flutter/material.dart';

class AddCertificate extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grade de Certificados'),
        backgroundColor: Colors.blueGrey,
      ),
      floatingActionButton: FloatingActionButton( 
        onPressed: () {

        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blueGrey,
      ),
    );
  }
  
}