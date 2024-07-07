import 'package:flutter/material.dart';
import 'package:gestao_horas_certificado/app/view/back/certificate_add_back.dart';

class AddCertificate extends StatelessWidget {
  final _add = GlobalKey<FormState>();

  Widget fieldCertificateName(CertificateAddBack back) {
    return TextFormField(
      validator: back.validateCertificateName,
      onSaved: (newValue) => back.certificate.name = newValue,
      initialValue: back.certificate.name,
      decoration: InputDecoration(
        labelText: 'Nome do Certificado'
      ),
    );
  }
  Widget fieldCertificateDescription(CertificateAddBack back) {
    return TextFormField(
      validator: back.validateCertificateDescription,
      onSaved: (newValue) => back.certificate.description = newValue,
      initialValue: back.certificate.description,
      decoration: InputDecoration(
        labelText: 'Descrição do Certificado'
      ),
    );
  }
  Widget fieldCertificateHours(CertificateAddBack back) {
    return TextFormField(
      validator: back.validateCertificateHours,
      onSaved: (newValue) {
        int? value = int.tryParse(newValue ?? '');
        back.certificate.hours = value;
     },
      initialValue: back.certificate.hours?.toString() ?? '',
      decoration: InputDecoration(
        labelText: 'Horas do Certificado'
      ),
      keyboardType: TextInputType.number,
    );
  }

  Widget fieldCertificateType(CertificateAddBack back) {
    return DropdownButtonFormField<String>(
      validator: back.validateCertificateType,
      onSaved: (newValue) => back.certificate.type = newValue,
      value: back.certificate.type,
      decoration: InputDecoration(
        labelText: 'Tipo de Certificado',
      ),
      items: ['Ensino', 'Extensão', 'Social'].map((String value) {
        return DropdownMenuItem<String> (
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (newValue) {
        back.certificate.type = newValue;
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    var _back = CertificateAddBack(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Adicionar Certificado'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              if (_add.currentState?.validate() ?? false) {
                _add.currentState?.save();
                _back.save();
                Navigator.of(context).pop();
              }
            },
            )
        ],
      ),
      body: Padding( 
        padding: EdgeInsets.all(10.0),
        child: Form(  
          key: _add,
          child: ListView(  
            children: [
              fieldCertificateName(_back),
              SizedBox(height: 10),
              fieldCertificateDescription(_back),
              SizedBox(height: 10),
              fieldCertificateHours(_back),
              SizedBox(height: 10),
              fieldCertificateType(_back),
            ],
          ),
        ),
        
      ),
    );
  }
}