import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  int selectedValue = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedValue = selectedValue == 1 ? 0 : 1;
        });
      },
      child: Container(
        width: 50,
        height: 50,
        color: selectedValue == 1 ? Colors.blue : Colors.white,
        child: Center(
          child: Text(
            selectedValue.toString(),
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
