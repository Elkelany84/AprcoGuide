import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  Test({this.pharsname});

  final String? pharsname;
  @override
  Widget build(BuildContext context) {
    return Container(child: Text(pharsname!),);
  }
}
