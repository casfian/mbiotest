import 'package:flutter/material.dart';
import 'package:mbiotest/complete/complete_endotoksin.dart';
import 'package:mbiotest/complete/complete_sterility.dart';

class CompletePage extends StatelessWidget {
  const CompletePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //row1
            Container(
              width: 220,
              height: 100,
              
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 120,
                    child: ElevatedButton(onPressed: () {
                        //code 
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Sterility()),
                    );

                    }, child: const Text('Sterility', style: TextStyle(fontSize: 15),)),
                  ),
                  const Text('3', style: TextStyle(fontSize: 30),),
                ],
              ),
            ),

            //row2
            Container(
              width: 220,
              height: 100,
              
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 120,
                    child: ElevatedButton(onPressed: () {
                        //code 
                        Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Endotoxin()),
                    );
                    }, child: const Text('Endotoxin', style: TextStyle(fontSize: 15),)),
                  ),
                  const Text('2', style: TextStyle(fontSize: 30),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
