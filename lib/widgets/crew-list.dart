import 'package:flutter/material.dart';
import 'package:india_10/models/crew.dart';
import 'package:india_10/widgets/crew-list-item.dart';

class CrewList extends StatelessWidget {
  final List<Crew> list;

  const CrewList(this.list);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return CrewListItem(list[index]);
        },
        itemCount: list.length,
      ),
    );
  }
}