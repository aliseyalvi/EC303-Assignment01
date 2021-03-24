import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: MyHomePage(title: 'Sadaqat Ali',),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key,required this.title}) : super(key: key);
  // MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String text_value = 'Hello User';
  change() {
    setState(() {
      text_value = 'Hello 217967';
    });
  }

  @override
  Widget build(BuildContext context) {
    final textfield = Container(
      padding: EdgeInsets.all(16),
      child: Text('$text_value', style: TextStyle(fontSize: 24)),
    );
    final button = Material(
      elevation: 3,
      borderRadius: BorderRadius.horizontal(),
      child: ElevatedButton(
        onPressed: () {
          change();
        },
        child: Text(
          'Press',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24),
          
        ),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Sadaqat Ali'),
        backgroundColor: Colors.blueAccent,
        leading: Row(
          children: [
            Container(
              child: CircleAvatar(
                backgroundImage: NetworkImage('https://i.ibb.co/DbGHyY4/IMG-20190507-143957-2.jpg'),

              ),
            )
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[textfield, button],
        ),
      ),
    );
  }
}
