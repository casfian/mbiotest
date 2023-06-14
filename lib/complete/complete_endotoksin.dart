import 'package:flutter/material.dart';

class Endotoxin extends StatefulWidget {
  const Endotoxin({super.key});

  @override
  State<Endotoxin> createState() => _EndotoxinState();
}

class _EndotoxinState extends State<Endotoxin> {
  final List<String> clientNames = [
    'Client A',
    'Client B',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Endotoxin'),
      ),
      body: ListView.builder(
        itemCount: clientNames.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(clientNames[index]),
          );
        },
      ),
    );
  }
}
