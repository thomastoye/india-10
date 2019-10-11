import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';

class TeamType {
  final IconData icon;
  final String name;
  final String usualPrefix;

  static const ambulance = TeamType(name: "Ambulance", icon: Mdi.ambulance, usualPrefix: "ZW");
  static const intervention = TeamType(name: "Intervention team", icon: Mdi.bagPersonal, usualPrefix: "India");
  static const jump = TeamType(name: "Jump team", icon: Mdi.runFast, usualPrefix: "Juliett");
  static const aidStation = TeamType(name: "Aid station", icon: Mdi.hospitalBox, usualPrefix: "HP");
  static const hospital = TeamType(name: "Hospital", icon: Mdi.hospitalBuilding, usualPrefix: null);
  static const bike = TeamType(name: "Bike team", icon: Mdi.bike, usualPrefix: "Foxtrot");
  static const doctor = TeamType(name: "Doctor", icon: Mdi.doctor, usualPrefix: null);
  static const gator = TeamType(name: "Gator", icon: Mdi.jeepney, usualPrefix: null);
  static const cp = TeamType(name: "CP", icon: Mdi.towerFire, usualPrefix: "CP");

  static const all = [ ambulance, intervention, jump, aidStation, hospital, bike, doctor, gator, cp ];

  const TeamType({ this.name, this.icon, this.usualPrefix });

  static TeamType getById(String name) {
    return all.firstWhere((type) => type.name == name);
  }
}

class Team {
  final String name;
  final TeamType type;

  const Team({ this.name, this.type });
}
  