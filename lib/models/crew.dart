import 'package:flutter/material.dart';

import 'team.dart';

class Crew {
  final String name;
  final DateTime lastLocationUpdate;
  final Team team;

  const Crew(
      {
        @required this.name,
        @required this.lastLocationUpdate,
        @required this.team,
      });
}
