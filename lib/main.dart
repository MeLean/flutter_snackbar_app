import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'SnackBar app',
      theme: new ThemeData(
        primarySwatch: Colors.green,
      ),
      home: new MyHomePage(title: 'SnackBar app'),
    );
  }
}//

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<ScaffoldState> _scaffold = GlobalKey();
  TextEditingController _snackBarTexController;

  _onSubmit(message) {
    if(message.isNotEmpty) {
      _snackBarTexController.clear();
      _scaffold.currentState
          .showSnackBar(SnackBar(content: Text(message)));

    }
  }


  @override
  void initState() {
    _snackBarTexController = TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffold,
      appBar: new AppBar(
        centerTitle: true,
        title: new Text(widget.title),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller: _snackBarTexController,
              textAlign: TextAlign.center,
              onSubmitted: (String message) => _onSubmit(message),
              decoration: InputDecoration(
                  hintText: 'Please enter snackbar mesage'),
            ),
          ],
      ),
    );
  }


}
