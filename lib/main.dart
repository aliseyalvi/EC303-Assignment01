import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login UI',
      initialRoute: '/',
      routes: {
        '/': (context) => resume(),
        // '/': (context) => MyApp(),
      },
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      // home: MyHomePage(title: 'Flutter Login'),
    );
  }
}

class resume extends StatefulWidget {
  @override
  _resumeState createState() => _resumeState();
}

class _resumeState extends State<resume> {
  bool get hasFocus => false;
  @override
  Widget build(BuildContext context) {
    final personal_info = MaterialButton(
      minWidth: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => personal()));
      },
      child: Text(
        "Personal Information",
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.red),
      ),
    );

    final cover_letter = MaterialButton(
      minWidth: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => coverletter()));
      },
      child: Text(
        "Cover Letter",
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.red),
      ),
    );

    return new Scaffold(
        appBar: AppBar(
          title: Text("Resume Builder"),
        ),
        body: ListView(
          children: <Widget>[personal_info, cover_letter],
        ));
  }
}

class personal extends StatefulWidget {
  @override
  _personalState createState() => _personalState();
}

class _personalState extends State<personal> {
  bool _value = false;
  void changevalue(bool value) {
    setState(() {
      _value = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Information'),
      ),
      body: Center(
        child: ListView(children: [
          Container(
            color: Colors.grey.shade300,
            child: Column(
              children: [
                Card(
                  color: Colors.grey.shade300,
                  child: ListTile(
                    leading: Text(
                      'Name:',
                      style: TextStyle(
                        color: Colors.grey.shade800,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ), //name
                TextField(
                  decoration: InputDecoration(
                    labelText: 'User Name',
                    hintText: 'Enter Your User Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                //name
                Card(
                  color: Colors.grey.shade300,
                  child: ListTile(
                    leading: Text(
                      'Address:',
                      style: TextStyle(
                        color: Colors.grey.shade800,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ), //address
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Address',
                    hintText: 'Enter Your Address',
                    border: OutlineInputBorder(),
                  ),
                ), //address
                Card(
                  color: Colors.grey.shade300,
                  child: ListTile(
                    leading: Text(
                      'Email:',
                      style: TextStyle(
                        color: Colors.grey.shade800,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ), //email
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter Your Email',
                    border: OutlineInputBorder(),
                  ),
                ),
                Card(
                  color: Colors.grey.shade300,
                  child: ListTile(
                    leading: Text(
                      'Number:',
                      style: TextStyle(
                        color: Colors.grey.shade800,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ), //email
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Number',
                    hintText: 'Enter Your Number',
                    border: OutlineInputBorder(),
                  ),
                ), //email
                const SizedBox(
                  height: 12,
                ),
                new SwitchListTile(
                    activeColor: Colors.red,
                    activeTrackColor: Colors.yellow,
                    title: Text('Photo'),
                    value: _value,
                    onChanged: (bool value) {
                      changevalue(value);
                    }),
                // Image.asset(_value ? 'images/mypic.jpeg' : '', height: 100),
                CircleAvatar(
                    radius: 75,
                    backgroundImage: NetworkImage(
                        'https://st3.depositphotos.com/12985790/18246/i/600/depositphotos_182461084-stock-photo-anonymous.jpg')),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class coverletter extends StatefulWidget {
  @override
  _coverletterState createState() => _coverletterState();
}

class _coverletterState extends State<coverletter> {
  bool _value = false;
  void changevalue(bool value) {
    setState(() {
      _value = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cover Letter'),
      ),
      body: Center(
        child: ListView(children: [
          Container(
            color: Colors.grey.shade300,
            child: Column(
              children: [
                new SwitchListTile(
                    title: Text(
                      'Cover Letter',
                      style:
                          TextStyle(fontSize: 20, color: Colors.grey.shade800),
                    ),
                    value: _value,
                    onChanged: (bool value) {
                      changevalue(value);
                    }),
                Card(
                  color: Colors.grey.shade300,
                  child: ListTile(
                    leading: Text(
                      'Date:',
                      style: TextStyle(
                        color: Colors.grey.shade800,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ), //email
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter date',
                    border: OutlineInputBorder(),
                  ),
                ), //address
                Card(
                  color: Colors.grey.shade300,
                  child: ListTile(
                    leading: Text(
                      'Addressed To ( Optional ) :',
                      style: TextStyle(
                        color: Colors.grey.shade800,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ), //email
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter Address',
                    border: OutlineInputBorder(),
                  ),
                ), //email
                Card(
                  color: Colors.grey.shade300,
                  child: ListTile(
                    leading: Text(
                      'Body :',
                      style: TextStyle(
                        color: Colors.grey.shade800,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ), //email
                TextField(
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    hintText: 'Enter Body',
                    border: OutlineInputBorder(),
                  ),
                ), //email
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
