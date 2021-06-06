import 'package:flutter/material.dart';
import 'dart:math';
import 'package:shared_preferences/shared_preferences.dart';

const DescTextStyle = TextStyle(fontSize: 18, color: Colors.grey);
const NumberTextStyle = TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.grey);
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int rno = 123456;
  int rno1;
  void RandomGenerator() {
    int min = 90000000;
    int max = 1000000000;
    setState(() {
      rno1 = min + Random().nextInt(max - min);
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      rno = prefs.getInt('rno');
    });
  }

  setData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setInt('rno', rno1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Using Shared Preferences',
          ),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'You have generated random number:',
                    style: DescTextStyle,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '$rno1',
                    style: NumberTextStyle,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'You saved this number in shared preference:',
                    style: DescTextStyle,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '$rno',
                    style: NumberTextStyle,
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CenterButton(
                    bText: 'Load',
                    onPressed: () {
                      getData();
                    },
                  ),
                  CenterButton(
                    onPressed: () {
                      RandomGenerator();
                    },
                    bText: 'Random',
                  ),
                  CenterButton(
                    onPressed: () {
                      setData();
                    },
                    bText: 'Save',
                  ),
                ],
              )
            ],
          ),
        ));
  }
}

class CenterButton extends StatelessWidget {
  CenterButton({@required this.bText, @required this.onPressed});
  final bText;
  final onPressed;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: Text(
        '$bText',
        style: TextStyle(
          fontSize: 16,
            color: Colors.black54
        ),
      ),
      style: ButtonStyle(
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))),
      ),
    );

  }
}