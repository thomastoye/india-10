import 'package:flutter/material.dart';

import 'models/team.dart';
import 'widgets/crew-list.dart';
import 'widgets/settings.dart';
import 'models/crew.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'India 10'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static final List<Team> teams = [
    Team(name: "India 10", type: TeamType.intervention),
    Team(name: "India 20", type: TeamType.intervention),
    Team(name: "Zulu 10", type: TeamType.intervention),
    Team(name: "Juliet 10", type: TeamType.jump),
    Team(name: "Hulppost", type: TeamType.aidStation),
    Team(name: "CP-OPS", type: TeamType.cp),
  ];

  static final List<Crew> crewList = [
    Crew(name: "Thomas", lastLocationUpdate: DateTime.fromMillisecondsSinceEpoch(1570804458454), team: teams[0]),
    Crew(name: "Piet", lastLocationUpdate: DateTime.fromMillisecondsSinceEpoch(1560804458454), team: teams[1]),
    Crew(name: "Joris", lastLocationUpdate: DateTime.fromMillisecondsSinceEpoch(1570804458454), team: teams[2]),
    Crew(name: "Korneel", lastLocationUpdate: DateTime.fromMillisecondsSinceEpoch(1570804458454), team: teams[3]),
    Crew(name: "Sofie", lastLocationUpdate: DateTime.fromMillisecondsSinceEpoch(1570804458454), team: teams[4]),
    Crew(name: "Anne", lastLocationUpdate: DateTime.fromMillisecondsSinceEpoch(1570804458454), team: teams[5]),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _getHomePage(BuildContext context) {
    return Column(children: <Widget>[
      CrewList(crewList)
    ],);
  }

  Widget _getMapPage(BuildContext context) {
    return Text('Map');
  }

  Widget _getSettingsPage(BuildContext context) {
    return Settings();
  }

  Widget getPage(int index, BuildContext context) {
    switch (index) {
      case 0: return _getHomePage(context);
      case 1: return _getMapPage(context);
      case 2: return _getSettingsPage(context);

      default: return _getHomePage(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: getPage(_selectedIndex, context),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            title: Text('Kaart'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Instellingen'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
