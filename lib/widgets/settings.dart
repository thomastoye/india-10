import 'package:flutter/material.dart';

import '../models/team.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  TeamType _teamType = TeamType.intervention;
  final _teamNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Card(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Text(
                        "Jouw naam",
                      ),
                      width: 100,
                    ),
                    Container(
                      width: 200,
                      child: TextField(
                        decoration: InputDecoration(hintText: 'Naam'),
                      ),
                    )
                  ],
                )),
          ),
          Card(
            child: Container(
              padding: EdgeInsets.all(8),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        child: Text("Soort team"),
                        width: 100,
                      ),
                      Expanded(
                        child: DropdownButton<TeamType>(
                          icon: Container(margin: EdgeInsets.only(left: 5), child: Icon(Icons.arrow_downward)),
                          iconSize: 14,
                          elevation: 16,
                          value: _teamType,
                          items: TeamType.all.map<DropdownMenuItem<TeamType>>(
                              (TeamType value) {
                            return DropdownMenuItem<TeamType>(
                              value: value,
                              child: Row(
                                children: <Widget>[
                                  Icon(value.icon),
                                  Container(
                                    child: Text(value.name),
                                    margin: EdgeInsets.only(left: 10),
                                  )
                                ],
                              ),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              _teamType = newValue;
                              _teamNameController.text = newValue.usualPrefix != null
                                  ? newValue.usualPrefix
                                  : "";
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        child: Text("Teamnaam"),
                        width: 100,
                      ),
                      Expanded(
                          child: TextField(
                            controller: _teamNameController,
                        decoration: InputDecoration(hintText: 'Naam'),
                      ))
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
