import 'package:flutter/material.dart';
import 'package:tutorials/freezed_user/user_with_generation.dart';
import 'package:tutorials/user_without_generation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final userWithoutGeneration = UserWithoutGeneration("Diana", 30, 1);
  final userWithoutGeneration2 = UserWithoutGeneration("Diana", 30, 1);

  UserWithGeneration userWithGeneration = UserWithGeneration(name: 'Diana', age: 30, coolness: 100);
  UserWithGeneration userWithGeneration2 = UserWithGeneration(name: 'Diana', age: 30, coolness: 100);

  void compareObjects() {

    if(userWithoutGeneration == userWithoutGeneration2) {
      print('Son iguales');
    } else {
      print('No son iguales');
    }

    if(userWithGeneration == userWithGeneration2) {
      print('userWithGeneration Son iguales');
    } else {
      print('userWithGeneration No son iguales');
    }

    userWithGeneration = userWithGeneration.copyWith(name: 'User');
  }


  @override
  Widget build(BuildContext context) {
    compareObjects();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key,required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
