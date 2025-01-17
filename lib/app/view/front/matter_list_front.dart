import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gestao_horas_certificado/app/domain/entities/matter.dart';
import 'package:gestao_horas_certificado/app/view/back/matter_list_back.dart';

class MatterList extends StatelessWidget {
  final _back = MatterListBack();

    CircleAvatar bookAvatar() {
    return CircleAvatar(child: Icon(Icons.book));
  }

  Widget iconEditButton(Function()? onPressed) {
    return IconButton( 
      onPressed: onPressed, 
      icon: Icon(Icons.edit),
      color: Colors.orangeAccent,
      );
  }

  Widget iconRemoveButton(BuildContext context, Function()? remove) {
    return IconButton( 
      icon: Icon(Icons.delete),
      color: Colors.redAccent,
      onPressed: () {
        showDialog( 
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Excluir'),
            content: Text('Confirmar a Exclusão?'),
            actions: [
              TextButton( 
                child: Text('Não'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton( 
                child: Text('Sim'), 
                onPressed: remove,
                )
            ],
          )
        );
      }, 
    );
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar( 
        title: Text('Grade de Matérias'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: Icon(Icons.check_circle),
            onPressed: () {
              _back.goToComplementaryHours(context);
            },

          ),
          IconButton(
            icon: Icon(Icons.paste_outlined),
            onPressed: () {
              _back.goToCertificate(context);
            },

          ),
          
          
        ],
      ),
      body: Observer(builder: (context) {
        return FutureBuilder(
          future: _back.list,
          builder: (context, future) {
            if(!future.hasData) {
              return Center(child: CircularProgressIndicator());
            }else if (!future.hasData || (future.data as List<Matter>).isEmpty){
              return Center(child: Text('Nenhuma Matéria cadastrada'));
            }else {
              List<Matter>? list = future.data;
              return ListView.builder(
                itemCount: list?.length,
                itemBuilder: (context, i) {
                  var matter = list?[i];
                  return ListTile( 
                    leading: bookAvatar(),
                    title: Text(matter?.name ?? 'Nome não reconhecido'),
                    onTap: () {
                      
                    },
                    subtitle: Text('Média: ${matter!.average?.toString() ?? 'N/A'}'),
                    trailing: SizedBox( 
                      width: 100,
                      child: Row( 
                        children: [
                          iconEditButton(() {
                            _back.goToAddMatter(context, matter);
                          }),
                          iconRemoveButton(context, () {
                            _back.remove(matter.id);
                            Navigator.of(context).pop();
                          }),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          },
          
        );
      },
    ),
    floatingActionButton: FloatingActionButton(  
      onPressed: () {
        _back.goToAddMatter(context);
      },
      child: Icon(Icons.add),
      backgroundColor: Colors.blue,
    ),
  );
  }
}
