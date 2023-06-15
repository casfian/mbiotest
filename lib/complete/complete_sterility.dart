import 'package:flutter/material.dart';
import 'package:mbiotest/sample_thio.dart';
import 'package:mbiotest/sample_tsb.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class Sterility extends StatefulWidget {
  const Sterility({super.key});

  @override
  State<Sterility> createState() => _SterilityState();
}

class _SterilityState extends State<Sterility> {
  final List<String> clientNames = [];

  Future getClients() async {
    List<dynamic>? data;

    var url =
        Uri.parse('http://etas.nuclearmalaysia.gov.my/api/listcompany.php');
    // var url =
    //  Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      print('Success');
      var jsonResponse = convert.jsonDecode(response.body);
      print(jsonResponse);
      data = jsonResponse;
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sterility'),
      ),
      body: FutureBuilder(
          future: getClients(), //source data
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              // show data
              return ListView.builder(
                itemCount: clientNames.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(snapshot.data[index]['name']),
                        Text(snapshot.data[index]['id']),
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
                                        builder: (context) =>
                                            SamplesThio(passId: snapshot.data[index]['id'] )),
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
                                        builder: (context) =>
                                            const SamplesTSB()),
                                  );
                                },
                                child: const Text('TSB')),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            } else {
              return const Center(child: Text('Loading...'));
            }
          }),
    );
  }
}




/*
ListView.builder(
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
      */



      /*
      ListView.builder(
                    itemCount:
                        snapshot.data.length == '' ? 0 : snapshot.data.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(snapshot.data[index]['name']),
                        
                      );
                    });
      */