import 'package:flutter/material.dart';
import 'dart:math';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;
import 'database.dart';
import 'filestorage.dart';

const kTextStyle = TextStyle(fontSize: 20, color: Colors.grey);
const kTextStyle2 = TextStyle(fontSize: 40, fontWeight: FontWeight.bold);
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
  DatabaseFile randDatabase = DatabaseFile();
  FileStorage randFileStorage = FileStorage();
  int fileStorageRandomNo = 0;

  save_file_storage() {
    randFileStorage.writeRandNum(rno);
  }

  load_file_storage() {
    randFileStorage.readRandNum().then((int value) => setState(() {
      fileStorageRandomNo = value;
    }));
  }

  void RandomGenerator() {
    int min = 90000000;
    int max = 1000000000;
    setState(() {
      rno1 = min + Random().nextInt(max - min);
    });
  }

  Widget displayDatabaseData() {
    return FutureBuilder<int>(
        future: randDatabase.getRandNum(),
        builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
          if (snapshot.hasData) {
            return Text((snapshot.data).toString(),
                textAlign: TextAlign.center, style: kTextStyle2);
          } else {
            return CircularProgressIndicator();
          }
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
            'Shared Preferences File Storage SQLLite',
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
                    style: kTextStyle,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '$rno1',
                    style: kTextStyle2,
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
                    style: kTextStyle,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '$rno',
                    style: kTextStyle2,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'You saved this number in sqllite',
                    style: kTextStyle,
                  )
                ],
              ),
              displayDatabaseData(),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'You saved this number in Local File',
                    style: kTextStyle,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '$fileStorageRandomNo',
                    style: kTextStyle2,
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
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CenterButton(
                    onPressed: () {
                      randDatabase.getRandNum();
                    },
                    bText: 'Load from SQLlite',
                  ),
                  CenterButton(
                    onPressed: () {
                      randDatabase
                          .insertRandNum(RandNumData(id: 1, number: rno));
                    },
                    bText: 'Save to SQLlite',
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CenterButton(
                    onPressed: () {
                      load_file_storage();
                    },
                    bText: 'Read from File',
                  ),
                  CenterButton(
                    onPressed: () {
                      save_file_storage();
                    },
                    bText: 'Write to File',
                  ),
                ],
              )
            ],
          ),
        ));
  }
}

class CenterButton extends StatelessWidget {
  CenterButton({@required this.bText, this.onPressed});
  final bText;
  final onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        '$bText',
        style: TextStyle(
          fontSize: 20,
        ),
      ),
      style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(Colors.grey.shade500),
          backgroundColor: MaterialStateProperty.all(Colors.black)),
    );
  }
}
filestorage.dart
import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class FileStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/randNum.txt');
  }

  Future<int> readRandNum() async {
    try {
      final file = await _localFile;
      print("Loading random number from file storage");

      // Read the file
      String contents = await file.readAsString();

      return int.parse(contents);
    } catch (e) {
      // If encountering an error, return 0
      return 0;
    }
  }

  Future<File> writeRandNum(int randNum) async {
    final file = await _localFile;
    print("Saving random number to file storage");
    // Write the file
    return file.writeAsString('$randNum');
  }
}
datadase.dart
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class RandNumData {
  final int id;
  final int number;
  RandNumData({this.id, this.number});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'number': number,
    };
  }
}

class DatabaseFile {
  Database database;
  String table = "randNumTable";
  DatabaseFile() {
    open();
    print("calling constructor");
  }

  Future open() async {
    // Directory documentsDirectory = await getApplicationDocumentsDirectory();
    // String path = join(documentsDirectory.path, "TestDB.db");
    database = await openDatabase(
        join(await getDatabasesPath(), 'rand_num_database.db'),
        version: 1, onCreate: (Database db, int version) async {
      print("opening database");
      return db.execute(
        "CREATE TABLE randNumTable(id INTEGER PRIMARY KEY, number INTEGER)",
      );
    });
  }

  Future<void> insertRandNum(RandNumData randNum) async {
    // Get a reference to the database.
    final Database db = await database;
    print("inserting in database");
    await db.insert(
      'randNumTable',
      randNum.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int> getRandNum() async {
    // Get a reference to the database.
    final Database db = await database;
    print("get data from database");
    // Query the table for all The Dogs.
    final num = await db.query(table);
    print(num);
    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return (num[0]['number']);
  }
}
