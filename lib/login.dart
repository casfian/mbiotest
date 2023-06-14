import 'package:flutter/material.dart';
import 'package:mbiotest/dashboard.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
                  onPressed: () {
                    if (emailController.text.isEmpty ||
                       passwordController.text.isEmpty ) {
                        
                        AlertDialog alert = AlertDialog(
                          title: const Text('Error'),
                          content: const Text('Email dan Password tak boleh kosong!'),
                          actions: [
                            TextButton(onPressed: () {
                              Navigator.pop(context);
                            }, child: const Text('OK'))
                          ],
                        );

                        showDialog(context: context, builder: (context) {
                          return alert;
                        } );
                    } 
                     else {

                      // send email and password to server
                      //if server send a status success then baru boleh masuk
                      //senttoServer();
                      //if (status == '200') {

                        // Perform login logic here
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Dashboard()),
                        );

                      // } else {
                      //   //error
                      // }

                      

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
