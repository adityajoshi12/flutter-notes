import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';

class LogsPage extends StatefulWidget {
  @override
  _LogsPageState createState() => _LogsPageState();
}

class _LogsPageState extends State<LogsPage> {
  QuerySnapshot books;
  @override
  Widget build(BuildContext context) {
    return Container(child: _carList());
  }

  @override
  void initState() {
    getData().then((result) {
      setState(() {
        books = result;
      });
    });

    super.initState();
  }

  Future getData() async {
    return await Firestore.instance.collection('books').getDocuments();
  }

  Widget _carList() {
    if (books != null) {
      return ListView.builder(
        itemCount: books.documents.length,
        padding: EdgeInsets.all(5.0),
        itemBuilder: (context, i) {
          return new ListTile(
            title: Text(books.documents[i].data['author']),
            subtitle: Text(new DateFormat("dd-MM-yyyy hh:mm a").format(
                DateTime.fromMillisecondsSinceEpoch(books
                    .documents[i].data['createdAt'].millisecondsSinceEpoch))),
          );
        },
      );
    } else {
      return Center(
        child: Loading(indicator: BallPulseIndicator(), size: 100.0),
      );
    }
  }
}
