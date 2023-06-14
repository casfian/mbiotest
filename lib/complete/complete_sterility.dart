import 'package:flutter/material.dart';
import 'package:mbiotest/sample_thio.dart';
import 'package:mbiotest/sample_tsb.dart';

class Sterility extends StatefulWidget {
  const Sterility({super.key});

  @override
  State<Sterility> createState() => _SterilityState();
}

class _SterilityState extends State<Sterility> {
  final List<String> clientNames = [
    'Client A',
    'Client B',
    'Client C',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sterility'),
      ),
      body: ListView.builder(
        itemCount: clientNames.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(clientNames[index]),
                const SizedBox(
                  width: 20,
                ),
                Row(
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SamplesThio()),
                          );
                        },
                        child: const Text('Thio')),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SamplesTSB()),
                          );
                        },
                        child: const Text('TSB')),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
