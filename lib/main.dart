import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      home: recipebook(),
    ));
  }
}

class recipebook extends StatefulWidget {
  @override
  _recipebookState createState() => _recipebookState();
}

class _recipebookState extends State<recipebook> {

  final List<String> recepieImages = <String>['burger', 'pizza'];
  final List<String> recepieNames = <String>['burger', 'pizza'];
  final List<String> recepiePrep = <String>['30', '50'];
  final List<String> recepieDesc = <String>['This is burger', 'This is Pizza'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.teal,
          actions: [IconButton(icon: Icon(Icons.book), onPressed: () {})],
          title: Text(
            'My Recipe Book',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          )),
      body: SafeArea(
          child: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: recepieImages.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 50,
            // color: Colors.amber[colorCodes[index]],
            // child: Center(child: Text('Entry ${entries[index]}')),
            child: InkWell(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage:
                          AssetImage('images/${recepieImages[index]}.jpg'),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Row(
                            children: <Widget>[
                              Text(
                                recepieNames[index],
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Row(
                            children: <Widget>[
                              Text(
                                'Prep Time: ${recepiePrep[index]} min',
                                style: TextStyle(fontSize: 16),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => recipedetail(
                            recipename: recepieImages[index],
                            recipeimg: recepieNames[index],
                            preptime: recepiePrep[index],
                            recipedescription: recepieDesc[index])));

              },
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      )),
    );
  }
}

class recipedetail extends StatefulWidget {
  static const String routeName = '/recipedetail';
  String recipename;
  String recipeimg;
  String preptime;
  String recipedescription;
  recipedetail(
      {this.recipedescription, this.preptime, this.recipeimg, this.recipename});

  @override
  _recipedetailState createState() => _recipedetailState();
}

class _recipedetailState extends State<recipedetail> {
  Expanded fullrecipe() {
    return Expanded(
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/${widget.recipeimg}.jpg'),
                        fit: BoxFit.fill)),
                alignment: Alignment.center,
                padding: EdgeInsets.all(20),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(border: Border.all()),
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            '${widget.recipename}',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Prep Time: ${widget.preptime} min',
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 3,
                child: Container(
                  child: Column(
                    children: [
                      Expanded(
                        child: Row(children: <Widget>[
                          Text(
                            'Complete Recipe Description: ',
                            style: TextStyle(fontSize: 20),
                          )
                        ]),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                            width: double.infinity,
                            child: Text(
                              '${widget.recipedescription}',
                              style: TextStyle(fontSize: 18),
                            )),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.teal,
        title: Text(
          widget.recipename,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[fullrecipe()],
        ),
      ),
    );
  }
}
