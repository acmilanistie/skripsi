import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String texts = "";

  TextEditingController namatext = new TextEditingController();
  TextEditingController namatextAlert = new TextEditingController();
  TextEditingController namatextSackbar = new TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldstate =
      new GlobalKey<ScaffoldState>();

  void _dialogMuncul(String str) {
    if (str.isEmpty) return;

    AlertDialog peringatanMuncul = new AlertDialog(
      content: new Text(
        str,
        style: new TextStyle(fontSize: 20),
      ),
      actions: [
        RaisedButton(
          child: Text('Ok'),
          color: Colors.red,
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
    );

    showDialog(context: context, child: peringatanMuncul);
  }

  void _snackbarMuncul(String str) {
    if (str.isEmpty) return;

    _scaffoldstate.currentState.showSnackBar(new SnackBar(
      content: Text(
        str,
        style: TextStyle(
          fontSize: 20,
        ),
      ),
      duration: Duration(seconds: 3),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldstate,
      appBar: AppBar(
        title: Text('Input Text, Alert dialog & snackbar'),
        backgroundColor: Colors.purple,
      ),
      body: Container(
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'masukkan nama',
              ),
              controller: namatext,
              onSubmitted: (String str) {
                // ganti dengan onsubmite
                setState(() {
                  texts = texts + '\n' + namatext.text;
                  namatext.text = '';
                });
              },
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'masukkan text dialog',
              ),
              controller: namatextAlert,
              onSubmitted: (String str) {
                _dialogMuncul(str);
                namatextAlert.text = '';
              },
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'masukkan text snackbar',
              ),
              controller: namatextSackbar,
              onSubmitted: (String str) {
                _snackbarMuncul(str);
                namatextSackbar.text = '';
              },
            ),
            Text(
              texts,
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
