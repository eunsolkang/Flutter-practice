import 'package:flutter/material.dart';

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("First Route")),
      body: Center(
        child: RaisedButton(
          child: Text('Open second route'),
          onPressed: () {
            Navigator.pushNamed(context, '/second');
          },
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Second Route")),
      body: Center(
        child: RaisedButton(
          child: Text('Go back'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
