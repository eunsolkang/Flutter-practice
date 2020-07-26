import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final appTitle = 'App title';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '연습용',
      theme: ThemeData(
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.cyan[600],
        fontFamily: 'Montserrat',
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      ),
      home: MyCustomForm(),
    );
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('title'),
      ),
      body: MyCustomForm(),
    );
    // throw UnimplementedError();
  }
}

// Custom Form 제작 연습
class MyCustomForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyCustomFormState();
    // throw UnimplementedError();
  }
}

class _MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  FocusNode myFocusNode;
  final myController = TextEditingController();

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
    myController.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

  void _printLatestValue() {
    print("Second Text field : ${myController.text}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('title'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              autofocus: true,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Enter some text!';
                } else {
                  return null;
                }
              },
              onChanged: (text) {
                print("first text field $text");
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Enter a search term',
                labelText: 'Enter your username',
              ),
            ),
            TextFormField(
              focusNode: myFocusNode,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Enter some text!';
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Enter a search term',
                labelText: 'Enter your username',
              ),
              controller: myController,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: RaisedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    Scaffold.of(context)
                        .showSnackBar(SnackBar(content: Text('dkdk')));
                  }
                },
                child: Text('Push'),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          return FocusScope.of(context).requestFocus(myFocusNode);
        },
        tooltip: 'focus text',
        child: Icon(Icons.edit),
      ),
    );

    // TODO: implement build
    // throw UnimplementedError();
  }
}
// Fade-In, Fade-Out 연습
