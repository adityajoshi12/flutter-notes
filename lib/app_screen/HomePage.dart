import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var faker = new Faker();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          InkWell(
              child: RaisedButton(
            onPressed: saveToFirestore,
            child: Text("Add"),
          ))
        ],
      ),
    );
  }

  void saveToFirestore() {
    Firestore.instance.collection('books').document().setData({
      'title': faker.lorem.sentence(),
      'author': faker.person.name(),
      'createdAt': FieldValue.serverTimestamp()
    });
  }
}
