import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class Todo {
  final String title;
  final String description;

  Todo(this.title, this.description);
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

class MyHomeScreen extends StatefulWidget {
  final title;

  const MyHomeScreen({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyHomeScreen();
    // throw UnimplementedError();
  }
}

class _MyHomeScreen extends State<MyHomeScreen> {
  bool _visiable = true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title), // widget이 정확히 어케 넘어오는지 모르겠음
      ),
      body: Center(
        child: AnimatedOpacity(
          opacity: _visiable ? 1.0 : 0.0,
          duration: Duration(milliseconds: 500),
          child: Container(
            width: 200.0,
            height: 200.0,
            color: Colors.green,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _visiable = !_visiable;
          });
        },
        tooltip: 'Toggle',
        child: Icon(Icons.flip),
      ),
    );
    // throw UnimplementedError();
  }
}

// 애니메이션 효과 연습
class AnimatedContainerApp extends StatefulWidget {
  @override
  _AnimatedContainerAppState createState() => _AnimatedContainerAppState();
}

class _AnimatedContainerAppState extends State<AnimatedContainerApp> {
  double _width = 50;
  double _height = 50;
  Color _color = Colors.green;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation Pracitce'),
      ),
      body: Center(
        child: AnimatedContainer(
          width: _width,
          height: _height,
          decoration: BoxDecoration(color: _color, borderRadius: _borderRadius),
          duration: Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: () {
          setState(() {
            final random = Random();

            _width = random.nextInt(300).toDouble();
            _height = random.nextInt(300).toDouble();
            _color = Color.fromARGB(
              random.nextInt(255),
              random.nextInt(255),
              random.nextInt(255),
              1,
            );
            _borderRadius =
                BorderRadius.circular(random.nextInt(100).toDouble());
          });
        },
      ),
    );
  }
}

// 화면간 데이터 전달 연습
class TodoScreen extends StatelessWidget {
  final List<Todo> todos;

  const TodoScreen({
    Key key,
    @required this.todos,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Todosss'),
        ),
        body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(todos[index].title),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(todo: todos[index]),
                  ),
                );
              },
            );
          },
        ));
  }
}

class DetailScreen extends StatelessWidget {
  final Todo todo;

  const DetailScreen({Key key, this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Text(todo.description),
      ),
    );
  }
}
