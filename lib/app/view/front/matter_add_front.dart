import 'package:flutter/material.dart';
import 'package:gestao_horas_certificado/app/view/back/matter_add_back.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AddMatter extends StatelessWidget{
  final _add = GlobalKey<FormState>();

  Widget fieldMatter(MatterAddBack back) {
    return TextFormField( 
      validator: back.validateMatter,
      onSaved: (newValue) => back.matter.name = newValue,
      initialValue: back.matter.name,
      decoration: InputDecoration( 
        labelText: 'Nome da Matéria'
      ),
    );
  }

  Widget fieldTeacher(MatterAddBack back) {
    return TextFormField( 
      validator: back.validateTeacher,
      onSaved: (newValue) => back.matter.teacher = newValue,
      initialValue: back.matter.teacher,
      decoration: InputDecoration( 
        labelText: 'Nome do professor(a)'
      ),
    );
  }
  
  Widget fieldValues(MatterAddBack back) {
    var maskValue = MaskTextInputFormatter(mask: '##.#');
    return Row( 
      children: [
        Expanded(
          child: TextFormField(
            inputFormatters: [maskValue],
            validator: back.validateFirstValue,
            onSaved: (newValue) { 
              double? value = double.tryParse(newValue ?? '');
              back.matter.firstValue = value;
            },
            initialValue: back.matter.firstValue?.toString() ?? '',
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Nota 1ºTrimestre',
              hintText: '00.0',
            ),
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: TextFormField(
            validator: back.validateSecondValue,
            onSaved: (newValue) {
              double? value = double.tryParse(newValue ?? '');
              back.matter.secondValue = value;
            },
            initialValue: back.matter.secondValue?.toString() ?? '',
            inputFormatters: [maskValue],
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Nota 2ºTrimestre',
              hintText: '00.0',
            ),
          ), 
        ),
        SizedBox(width: 10),
        Expanded(
          child: TextFormField( 
            validator: back.validateThirdValue,
            onSaved: (newValue) {
              double? value = double.tryParse(newValue ?? '');
              back.matter.thirdValue = value;
            },
            initialValue: back.matter.thirdValue?.toString() ?? '',
            inputFormatters: [maskValue],
            keyboardType: TextInputType.number,
            decoration: InputDecoration( 
              labelText: 'Nota 3ºTrimestre',
              hintText: '00.0',
            ),
          ),
        ),
      ],
    );
  }
  


  @override 
  Widget build(BuildContext context) {
    var _back = MatterAddBack(context);
    return Scaffold( 
      appBar: AppBar( 
        backgroundColor: Colors.blue,
        title: Text('Adicionar Matéria'),
        actions: [ 
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              _add.currentState?.validate();
              if(_back.isValid) {
                _add.currentState?.save();
                _back.save();
                Navigator.of(context).pop();
              }
              
            },
            )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form( 
          key: _add,
          child: Column( 
            children: [
              Column(
                children:  [
                  fieldMatter(_back),
                  //SizedBox(width: 10),
                  fieldTeacher(_back),
                ],
              ),
              SizedBox(height: 10),
              fieldValues(_back),
            ],
          ),

        ),
      ),
    );
  }
}