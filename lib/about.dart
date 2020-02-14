import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: Center(
        child: Text("Alsayed Bakeries E-commerce App  © 2020"),
      ),
    );
  }
}
