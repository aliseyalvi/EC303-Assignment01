import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login UI',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        // visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: MyHomePage(title: 'Login'),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(title: 'Login'),
        '/home': (context) => HomeScreen(),
        '/calculate': (context) => CalculationScreen()
      },
    );
  }
}

class LoginPage extends StatefulWidget {
  // MyHomePage({Key key, this.title}) : super(key: key);
  const LoginPage({key, this.title}) : super(key: key);
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  final String title;
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  bool _obscureText = true;
  String _password = "";
  String _username = "";
  bool value = false;
  bool _passwordVisible = false;
  final _formKey = GlobalKey<FormState>();

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget buildCheckbox() => ListTile(
        leading: Checkbox(
          value: value,
          onChanged: (value) {
            setState(() {
              this.value = value;
            });
          },
        ),
        title: Text(
          'Remember Me',
          style: const TextStyle(fontSize: 12.0),
        ),
      );

  Widget build(BuildContext context) {
    bool checkBoxValue = true;
    final emailField = TextFormField(
      onChanged: (text) {
        setState(() {
          this._username = text;
        });
      },
      decoration: const InputDecoration(
          labelText: 'User Name',
          hintText: 'Enter Your User Name',
          icon: const Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: const Icon(Icons.email))),
      // obscureText: _obscureText,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter username';
        }
        return null;
      },
    );
    final passwordField = TextField(
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.blueAccent,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
        onPressed: () {
          if (_formKey.currentState.validate()) {
            Navigator.pushNamed(context, "/home",
                arguments: ScreenArguments(_username));
          }
        },
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Container(
          color: Colors.white70,
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // SizedBox(
                //   height: 155.0,
                //   child: Image.network(
                //     'https://st3.depositphotos.com/12985790/18246/i/600/depositphotos_182461084-stock-photo-anonymous.jpg',
                //     fit: BoxFit.contain,
                //   ),
                // ),
                CircleAvatar(
                    radius: 75,
                    backgroundImage: NetworkImage(
                        'https://st3.depositphotos.com/12985790/18246/i/600/depositphotos_182461084-stock-photo-anonymous.jpg')),
                SizedBox(height: 45.0),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      emailField,
                      TextFormField(
                        keyboardType: TextInputType.text,
                        obscureText:
                            !_passwordVisible, //This will obscure text dynamically
                        decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'Enter your password',
                          icon: const Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: const Icon(Icons.lock)),
                          suffixIcon: IconButton(
                            icon: Icon(
                              // Based on passwordVisible state choose the icon
                              _passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Theme.of(context).primaryColorDark,
                            ),
                            onPressed: () {
                              // Update the state i.e. toogle the state of passwordVisible variable
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter password';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 35.0,
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(child: buildCheckbox()),
                          Expanded(
                              child: Text(
                            'Forget Password',
                            style: TextStyle(color: Colors.blue),
                            textAlign: TextAlign.end,
                          ))
                        ],
                      ),
                      // SizedBox(
                      loginButon,
                      SizedBox(
                        height: 15.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  // MyHomePage({Key key, this.title}) : super(key: key);
  const HomeScreen({key, this.title}) : super(key: key);
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  final String title;
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  static const routeName = '/home';
  final _formKey = GlobalKey<FormState>();
  String _firstNumber = "";
  String _secondNumber = "";

  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;

    final firstField = TextFormField(
      keyboardType: TextInputType.number,
      onChanged: (text) {
        setState(() {
          this._firstNumber = text;
        });
      },
      decoration: const InputDecoration(
        labelText: 'First Number',
        hintText: 'Enter First Number Here',
      ),
      // obscureText: _obscureText,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a valid number';
        }
        return null;
      },
    );

    final secondfField = TextFormField(
      keyboardType: TextInputType.number,
      onChanged: (text) {
        setState(() {
          this._secondNumber = text;
        });
      },
      decoration: const InputDecoration(
        labelText: 'Second Number',
        hintText: 'Enter Second Number Here',
      ),
      // obscureText: _obscureText,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a valid number';
        }
        return null;
      },
    );

    final proceedButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.blueAccent,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
        onPressed: () {
          if (_formKey.currentState.validate()) {
            Navigator.pushNamed(context, "/calculate",
                arguments:
                    CalculateScreenArguments(_firstNumber, _secondNumber));
          }
        },
        child: Text("Proceed",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
        appBar: AppBar(
          title: Text(args.title),
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      firstField,
                      secondfField,
                      SizedBox(
                        height: 35.0,
                      ),

                      // SizedBox(
                      proceedButton,
                      SizedBox(
                        height: 15.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class CalculationScreen extends StatefulWidget {
  // MyHomePage({Key key, this.title}) : super(key: key);
  const CalculationScreen({key, this.title}) : super(key: key);
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  final String title;
  @override
  _CalculationScreenState createState() => _CalculationScreenState();
}

class _CalculationScreenState extends State<CalculationScreen> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  static const routeName = '/calculate';

  @override
  Widget build(BuildContext context) {
    final CalculateScreenArguments args =
        ModalRoute.of(context).settings.arguments;
    var result = int.parse(args.firstDigit) + int.parse(args.secondDigit);
    var resultString = '${args.firstDigit} + ${args.secondDigit}  =  ${result}';
    final calculateText = Text(resultString);

    return Scaffold(
        appBar: AppBar(
          title: Text('Calculate Screen'),
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(25),
            child: calculateText,
          ),
        ));
  }
}

class ScreenArguments {
  final String title;

  ScreenArguments(this.title);
}

class CalculateScreenArguments {
  String firstDigit;
  String secondDigit;

  CalculateScreenArguments(this.firstDigit, this.secondDigit);
}
