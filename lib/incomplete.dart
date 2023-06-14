import 'package:flutter/material.dart';

class IncompletePage extends StatelessWidget {
  const IncompletePage({super.key});

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
                    }, child: const Text('Sterility', style: TextStyle(fontSize: 15),)),
                  ),
                  const Text('2', style: TextStyle(fontSize: 30),),
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
                    }, child: const Text('Endotoxin', style: TextStyle(fontSize: 15),)),
                  ),
                  const Text('0', style: TextStyle(fontSize: 30),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
