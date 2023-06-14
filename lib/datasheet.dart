import 'package:flutter/material.dart';
import 'package:mbiotest/mywidget.dart';


class Datasheet extends StatefulWidget {
  const Datasheet({super.key});

  @override
  State<Datasheet> createState() => _DatasheetState();
}

class _DatasheetState extends State<Datasheet> {
  final List<String> DatasheetList = [
    'Day 1',
    'Day 2',
    'Day 3',
    'Day 4',
    'Day 5',
    'Day 6',
    'Day 7',
    'Day 8',
    'Day 9',
    'Day 10',
    'Day 11',
    'Day 12',
    'Day 13',
    'Day 14',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Datasheet'),
      ),
      body: ListView.builder(
        itemCount: DatasheetList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(DatasheetList[index]),
            trailing: MyWidget(),
          );
        },
      ),
    );
  }
}
