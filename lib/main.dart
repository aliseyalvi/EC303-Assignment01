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
  final List<String> recepieImages = <String>['burger', 'pizza','fried-chicken','Fast-food-meal','burger', 'pizza','fried-chicken','Fast-food-meal'];
  final List<String> recepieNames = <String>['burger', 'pizza','fried chicken', 'fast food meal','burger', 'pizza','fried chicken', 'fast food meal'];
  final List<String> recepiePrep = <String>['30', '50' , '60' , '40', '30', '50' , '60' , '40'];
  final List<String> recepieDesc = <String>['This is burger', 'This is Pizza', 'This is Fried Chicken', 'This is Fast Food Meal','This is burger', 'This is Pizza', 'This is Fried Chicken', 'This is Fast Food Meal'];

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
          child: GridView.count(
        crossAxisCount: 3,
        children: List.generate(recepieImages.length, (index) {
          return InkWell(
            child: Container(
              height: 40.0,
              width: 40.0,
              padding: EdgeInsets.all(5.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  'images/${recepieImages[index]}.jpg',
                  height: 40.0,
                  width: 40.0,
                  fit: BoxFit.fill,
                ),
              )
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => recipedetail(
                          recipename: recepieNames[index],
                          recipeimg: recepieImages[index],
                          preptime: recepiePrep[index],
                          recipedescription: recepieDesc[index])));
            },
          );
        }),
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
