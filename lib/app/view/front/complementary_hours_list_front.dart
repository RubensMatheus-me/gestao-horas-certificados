import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gestao_horas_certificado/app/view/back/complementary_hours_list_back.dart';

class ComplementaryHoursList extends StatefulWidget {
  @override
  _ComplementaryHoursListState createState() => _ComplementaryHoursListState();
}

class _ComplementaryHoursListState extends State<ComplementaryHoursList> {
  final _back = ComplementaryHoursListBack();
  final ValueNotifier<int?> totalHoursEnsinoNotifier = ValueNotifier<int?>(null);

  @override
  void initState() {
    super.initState();
    _fetchTotalHoursEnsino();
  }

  Future<void> _fetchTotalHoursEnsino() async {
    // Calcula o total de horas para certificados do tipo 'Ensino'
    int? totalHours = await _back.getTotalHour('Ensino');
    totalHoursEnsinoNotifier.value = totalHours;
  }

  @override
  void dispose() {
    totalHoursEnsinoNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grade de Certificados'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Observer(builder: (context) {
        return FutureBuilder<List<int>>(
          future: _back.list,
          builder: (context, AsyncSnapshot<List<int>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Erro: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('Nenhum certificado encontrado.'));
            } else {
              List<int> list = snapshot.data!;

              return ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, i) {
                  var certificate = list[i];
                  Widget trailingWidget;
                  trailingWidget = ValueListenableBuilder<int?>(
                      valueListenable: totalHoursEnsinoNotifier,
                      builder: (context, totalHoursEnsino, child) {
                        return totalHoursEnsino != null
                            ? Text('Ensino: $totalHoursEnsino horas')
                            : CircularProgressIndicator();
                      },
                    );
                                      return ListTile(
                    title: Text('Teste'),
                    subtitle: Text('taadaasdasd'),
                    trailing: trailingWidget,
                  );
                },
              );
            }
          },
        );
      }),
    );
  }
}
