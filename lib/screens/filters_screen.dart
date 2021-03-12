import 'package:flutter/material.dart';

class FiltersScreen extends StatelessWidget {
  static String routeName = 'filters';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Filters Screen'),
        ),
        body: Text("Filters Screen"),
      ),
    );
  }
}
