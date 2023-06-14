import 'package:flutter/material.dart';

class SamplesTSB extends StatefulWidget {
  const SamplesTSB({super.key});

  @override
  State<SamplesTSB> createState() => _SamplesTSBState();
}

class _SamplesTSBState extends State<SamplesTSB> {
  final List<String> SamplesTSBList = [
    'Sample 1',
    'Sample 2',
    'Sample 3',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List of Samples TSB'),
      ),
      body: ListView.builder(
        itemCount: SamplesTSBList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(SamplesTSBList[index]),
          );
        },
      ),
    );
  }
}
