import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('title'),
      ),
      body: Center(
        child: SelectionButtons(),
      ),
    );
  }
}

class SelectionButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('아무거나 선택하세요'),
      onPressed: () {
        _navigatedAndDisplaySelection(context);
      },
    );
  }

  void _navigatedAndDisplaySelection(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SelectionScreen(),
      ),
    );

    Scaffold.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text("$result")));
  }
}

class SelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('선택해주세요'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
              child: RaisedButton(
                child: Text('Yes'),
                onPressed: () {
                  Navigator.pop(context, 'Yes');
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: RaisedButton(
                child: Text('No'),
                onPressed: () {
                  Navigator.pop(context, 'No');
                },
              ),
            ),
          ],
        ),
      ),
    );
    throw UnimplementedError();
  }
}
