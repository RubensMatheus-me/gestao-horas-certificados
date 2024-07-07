import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gestao_horas_certificado/app/domain/entities/certificate.dart';
import 'package:gestao_horas_certificado/app/view/back/certificate_list_back.dart';

class CertificateList extends StatelessWidget {
  final _back = CertificateListBack();

  CircleAvatar avatar() {
    return CircleAvatar(child: Icon(Icons.article));
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
        title: Text('Grade de Certificados'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Observer(builder: (context) {
        return FutureBuilder(
          future: _back.list, 
          builder: (context, future) {
            if(!future.hasData) {
              return Center(child: CircularProgressIndicator());
            }else if (!future.hasData || (future.data as List<Certificate>).isEmpty){
              return Center(child: Text('Nenhum Certificado cadastrado'));
            }else {
              List<Certificate>? list = future.data;
              return ListView.builder(
                itemCount: list?.length,
                itemBuilder: (context, i) {
                  var certificate = list?[i];
                  return ListTile(
                    leading: avatar(),
                    title: Text(certificate?.name ?? 'Nome não reconhecido'),
                    onTap: () {
                      
                    },
                    subtitle: Text(certificate?.description ?? ''),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          iconEditButton(() {
                            _back.goToAddCertificate(context, certificate);
                          }),
                          iconRemoveButton(context, () {
                            _back.remove(certificate?.id);
                            Navigator.of(context).pop();
                          }),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          }
        );
      }),
      floatingActionButton: FloatingActionButton( 
        onPressed: () {
          _back.goToAddCertificate(context);
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }
  
}