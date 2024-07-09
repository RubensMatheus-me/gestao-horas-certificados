import 'package:flutter/material.dart';
import 'package:gestao_horas_certificado/app/view/back/complementary_hours_list_back.dart';

class ComplementaryHoursList extends StatefulWidget {
  @override
  _ComplementaryHoursListState createState() => _ComplementaryHoursListState();
}

class _ComplementaryHoursListState extends State<ComplementaryHoursList> {
  final _back = ComplementaryHoursListBack();
  final ValueNotifier<Map<String, int>> totalHoursNotifier = ValueNotifier<Map<String, int>>({});

  @override
  void initState() {
    super.initState();
    _fetchTotalHours();
  }

  Future<void> _fetchTotalHours() async {
    Map<String, int> totalHours = await _back.getAllHoursByActivityType();
    totalHoursNotifier.value = totalHours;
  }

  @override
  void dispose() {
    totalHoursNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grade de Horas Complementares'),
        backgroundColor: Colors.lightBlue,
      ),
      body: ValueListenableBuilder<Map<String, int>>(
        valueListenable: totalHoursNotifier,
        builder: (context, totalHours, child) {
            return ListView(
              children: [
                ListTile(
                  title: Text(
                    'Ensino',
                    style: TextStyle(fontSize: 14),
                    ),
                    trailing: Text('${totalHours['Ensino'] ?? 0} horas',
                    style: TextStyle(fontSize: 14),
                    ),
                  ),
                ListTile(
                  title: Text(
                    'Extensão',
                    style: TextStyle(fontSize: 14),
                    ),
                    trailing: Text('${totalHours['Extensão'] ?? 0} horas',
                    style: TextStyle(fontSize: 14),
                    ),
                  ),
                ListTile(
                  title: Text(
                    'Social',
                    style : TextStyle(fontSize: 14),
                    ),
                    trailing: Text('${totalHours['Social'] ?? 0} horas',
                    style : TextStyle(fontSize: 14),
                  )
                ),
              ],
            );
          }
      ),
    );
  }
}