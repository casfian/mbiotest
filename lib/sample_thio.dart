import 'package:flutter/material.dart';
import 'package:mbiotest/datasheet.dart';



class SamplesThio extends StatefulWidget {
  const SamplesThio({super.key});

  @override
  State<SamplesThio> createState() => _SamplesThioState();
}

class _SamplesThioState extends State<SamplesThio> {
  final List<String> SamplesThioList = [
    'Sample 1',
    'Sample 2',
    'Sample 3',
    'Sample 4',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List of Samples Thio'),
      ),
      body: ListView.builder(
        itemCount: SamplesThioList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(SamplesThioList[index]),
            onTap: () {
              Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Datasheet()),
                    );
            },
          );
        },
      ),
    );
  }
}
