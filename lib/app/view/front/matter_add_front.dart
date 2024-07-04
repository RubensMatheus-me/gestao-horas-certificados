import 'package:flutter/material.dart';
import 'package:gestao_horas_certificado/app/view/back/matter_add_back.dart';

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
              if(!_back.isValid) {
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
              fieldMatter(_back)
            ],
          
          ),
        ),
      ),
    );
  }
}