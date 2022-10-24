import 'package:flutter/material.dart';

class Construccion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:const Center(
        child: Text('Seccion en Construcción', style: TextStyle(fontSize: 25)),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.yellow[900],
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios)),
    );
  }
}
