import 'package:flutter/material.dart';
import 'package:my_dev/detail.dart';
import 'package:my_dev/tripmodel.dart';
import 'package:my_dev/welcome.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
        primarySwatch: Colors.purple,
      ),
      home: Welcome(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _settingCounter = 0;
  final duplicateItems = List<String>.generate(3, (i) => "Item $i");
  final getData = List<TripModel>.generate(
      10,
      (i) => new TripModel("Trip to Bromo #$i", "owner to #$i ",
          "30 Menit agor", "jakarta", ""));
  var items = List<String>();
  var trips = List<TripModel>();

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter += 2;
    });
  }

  void toDetailPage(TripModel tripModel) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => DetailScreen(tripModel: tripModel)),
    );
  }

  void _setting() {
    setState(() {
      _settingCounter++;
    });
    print("OK {$_settingCounter}");
  }

  @override
  void initState() {
    items.addAll(duplicateItems);
    trips.addAll(getData);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new Scaffold(
      appBar: PreferredSize(
         preferredSize: Size.fromHeight(60.0),
         child: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Ok Ga", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blue,
      )
      )
      ,
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text("Ropandi"),
              accountEmail: new Text("Some text"),
              currentAccountPicture: new CircleAvatar(
                backgroundImage: new NetworkImage(
                    "https://idrcorner.com/images/icon/gw.jpg"),
              ),
            ),
            new ListTile(
              title: new Text("Setting"),
              trailing: new Icon(Icons.settings),
              onTap: () => _setting(),
            ),
            new ListTile(
              title: new Text("Close"),
              trailing: new Icon(Icons.close),
            )
          ],
        ),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                height: 45.0,
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "search places",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(5.0)))),
                ),
              ),
            ),
            Expanded(
                child: ListView.builder(
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (context, index) {
                TripModel data = trips[index];
                return new GestureDetector(
                  onTap: () => toDetailPage(data),
                  child: Container(
                      padding: EdgeInsets.all(4.0),
                      child: new Column(
                        children: <Widget>[
                          new Row(
                            children: <Widget>[
                              // Widget to display the list of project
                              new Expanded(
                                flex: 4,
                                child: new Container(
                                  height: 120.0,
                                  decoration: new BoxDecoration(
                                      borderRadius:
                                          new BorderRadius.circular(10.0),
                                      color: Colors.white),
                                  child: new Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        new Container(
                                          height: 115.0,
                                          width: 119,
                                          child: new ClipRRect(
                                            borderRadius:
                                                new BorderRadius.circular(15.0),
                                            child: Image.network(
                                                "https://idrcorner.com/images/icon/gw.jpg"),
                                          ),
                                        )
                                        // new Image.network("https://idrcorner.com/images/icon/gw.jpg"),
                                      ]
                                      //new Icon(Icons.email)],
                                      ),
                                ),
                              ),
                              new Expanded(
                                  flex: 6,
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: new Container(
                                      height: 120.0,
                                      decoration: new BoxDecoration(
                                          borderRadius:
                                              new BorderRadius.circular(5.0),
                                          color: Colors.white),
                                      child: new Column(
                                        children: <Widget>[
                                          new Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Expanded(
                                                  flex: 7, // 20%
                                                  child: new Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      new Text(
                                                        data.title,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: TextStyle(
                                                            fontSize: 18),
                                                      ),
                                                      new Text(
                                                        data.owner,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            color: Colors.blue),
                                                      ),
                                                      new Text(
                                                        "Details >>>>",
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            color: Colors.red),
                                                      ),
                                                    ],
                                                  )),
                                              Expanded(
                                                  flex: 3, // 60%
                                                  child: new Column(
                                                    children: <Widget>[
                                                      new Text(
                                                        data.lastAddTime,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: TextStyle(
                                                            fontSize: 10),
                                                      ),
                                                    ],
                                                  )),
                                            ],
                                          ),
                                          new Row(
                                            children: <Widget>[
                                              new Text(
                                                data.title,
                                                textAlign: TextAlign.left,
                                                style: TextStyle(fontSize: 12),
                                              ),
                                            ],
                                          ),
                                          new Row(
                                            children: <Widget>[],
                                          ),
                                          new Row(
                                            children: <Widget>[],
                                          ),
                                          new Row(
                                            //mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: <Widget>[
                                              new Icon(Icons.place,
                                                  color: Colors.grey),
                                              new Text(
                                                "Kota Jakarta",
                                                textAlign: TextAlign.right,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.grey),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                          new Row(
                            children: <Widget>[
                              Expanded(
                                child: new Container(
                                    child: Divider(
                                  color: Colors.black,
                                )),
                              )
                            ],
                          )
                        ],
                      )),
                );
              },
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.edit),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 60.0,
          child: new Row(
            children: <Widget>[
              Expanded(
                  child: Column(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.home, color: Colors.white),
                      tooltip: "Home",
                      onPressed: () => print("Home"),
                    )
                  ],
                )
                  ),
              Expanded(
                child:  Column(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.notifications, color: Colors.white),
                      tooltip: "Home",
                      onPressed: () => print("Home"),
                    )
                  ],
                )
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.chat_bubble_outline, color: Colors.white),
                      onPressed: () => print("Notification"),
                    )
                  ],
                ),
              ),
              Expanded(
                  child: Column(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.calendar_today, color: Colors.white),
                      tooltip: "Home",
                      onPressed: () => print("Home"),
                    )
                  ],
                )
              ),
            ],
          ),
        ),
        color: Colors.purple,
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
