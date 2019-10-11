import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../models/crew.dart';

class CrewListItem extends StatelessWidget {
  final Crew crewMember;

  const CrewListItem(this.crewMember);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 5,
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
        child: ListTile(
          leading: CircleAvatar(
            radius: 30,
            child: Icon(crewMember.team.icon),
          ),
          title: Text("${crewMember.team.name} - ${crewMember.name}",
              style: Theme.of(context).textTheme.title),
          subtitle: Text(
              "Last update " + timeago.format(crewMember.lastLocationUpdate)),
          trailing: IconButton(
            icon: Icon(Icons.map),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
