import 'package:flutter/material.dart';
import 'package:mbiotest/dashboard.dart';

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Login function
  Future<Map<String, dynamic>> postLogin(
      String username, String password) async {
    var url =
        Uri.parse('http://etas.nuclearmalaysia.gov.my/api/userloginapi.php');

    var body = {'m': username, 'p': password};

    var response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: convert.jsonEncode(body),
    );

    if (response.statusCode == 200) {
      print('Success Login');
      var jsonResponse = convert.jsonDecode(response.body);
      print(jsonResponse);
      return jsonResponse;
    } else {
      print('Login Request failed with status: ${response.statusCode}.');
      return {}; // Return an empty map in case of failure
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(height: 50.0),
                Image.asset('images/logo.png', height: 100.0),
                const SizedBox(height: 50.0),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20.0),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () async {
                    if (emailController.text.isEmpty ||
                        passwordController.text.isEmpty) {
                      AlertDialog alert = AlertDialog(
                        title: const Text('Error'),
                        content:
                            const Text('Email dan Password tak boleh kosong!'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );

                      showDialog(
                        context: context,
                        builder: (context) {
                          return alert;
                        },
                      );
                    } else {
                      Map<String, dynamic> status = await postLogin(
                        emailController.text,
                        passwordController.text,
                      );

                      if (status['success'] == true) {
                        // Go to the next page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Dashboard()),
                        );
                      } else {
                        // Go to error page or show a popup
                        print('Error');
                      }
                    }
                  },
                  child: const Text('Log Masuk'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
