import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_dev/tripmodel.dart';

class DetailScreen extends StatelessWidget {
  // Declare a field that holds the Todo.
  final TripModel tripModel;

  // In the constructor, require a Todo.
  DetailScreen({Key key, @required this.tripModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
        appBar: AppBar(
          title: Text(tripModel.title),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Container(
                  height: 155.0,
                  child:
                      Text(tripModel.title, style: TextStyle(fontSize: 24.0)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Container(
                  height: 25.0,
                  child:
                      Text(tripModel.title, style: TextStyle(fontSize: 24.0)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(tripModel.lastAddTime),
              ),
              Container(
                height: 250.0,
                width: 350.0,
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.all(3.0),
                decoration: new BoxDecoration(
                    border: new Border.all(color: Colors.grey)),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Detail",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          flex: 4,
                          child: new Text("Pengusul"),
                        ),
                        Expanded(
                          flex: 1,
                          child: new Text(":", textAlign: TextAlign.center),
                        ),
                        Expanded(
                          flex: 5,
                          child: new Text("Avril", textAlign: TextAlign.start),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          flex: 4,
                          child: new Text("Rute"),
                        ),
                        Expanded(
                          flex: 1,
                          child: new Text(":", textAlign: TextAlign.center),
                        ),
                        Expanded(
                          flex: 5,
                          child: new Text("YogyaKarta-Malang",
                              textAlign: TextAlign.start),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          flex: 4,
                          child: new Text("Personil"),
                        ),
                        Expanded(
                          flex: 1,
                          child: new Text(":", textAlign: TextAlign.center),
                        ),
                        Expanded(
                          flex: 5,
                          child:
                              new Text("6 Orang", textAlign: TextAlign.start),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          flex: 4,
                          child: new Text("Keberangkatan"),
                        ),
                        Expanded(
                          flex: 1,
                          child: new Text(":", textAlign: TextAlign.center),
                        ),
                        Expanded(
                          flex: 5,
                          child: new Text("31 Desember 2019",
                              textAlign: TextAlign.start),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          flex: 4,
                          child: new Text("Kembali"),
                        ),
                        Expanded(
                          flex: 1,
                          child: new Text(":", textAlign: TextAlign.center),
                        ),
                        Expanded(
                          flex: 5,
                          child: new Text("1 januari 2019",
                              textAlign: TextAlign.start),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: Text("Keterang lain"),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 3.0),
                        child: Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec hendrerit condimentum mauris id tempor. Praesent eu commodo lacus. Praesent eget mi sed libero eleifend tempor. Sed at fringilla ipsum. Duis malesuada feugiat urna vitae convallis. Aliquam eu libero arcu.",
                          style: TextStyle(fontSize: 12.0, color: Colors.grey),
                        ))
                  ],
                ),
              ),
              new Container(
                  width: 348.0,
                  child: Divider(
                    color: Colors.black,
                  )
                  ),
            ],
          ),
        ));
  }
}
