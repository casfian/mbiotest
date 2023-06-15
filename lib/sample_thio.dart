import 'package:flutter/material.dart';
import 'package:mbiotest/datasheet.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class SamplesThio extends StatefulWidget {
  const SamplesThio({super.key, required this.passId});

  final String passId;

  @override
  State<SamplesThio> createState() => _SamplesThioState();
}

class _SamplesThioState extends State<SamplesThio> {
  
  Future getSamples(String sampleId) async {
    List<dynamic>? data;

    var url = Uri.parse(
        'http://etas.nuclearmalaysia.gov.my/api/liststerilitysample.php?id=$sampleId');
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
        title: const Text('List of Samples Thio'),
      ),
      body: FutureBuilder(
          future: getSamples(widget.passId), //source data
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              // show data
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(snapshot.data[index]['test_id']), //ne tuka kepada yg betul
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Datasheet()),
                      );
                    },
                  );
                },
              );
            } else {
              return const Text('Loading');
            }
          }),
    );
  }
}


/*
ListView.builder(
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
*/