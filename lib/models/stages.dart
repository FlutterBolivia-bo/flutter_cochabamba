import 'package:cloud_firestore/cloud_firestore.dart';

class Stages {
  String id;
  String name;
  Timestamp date;
  String eventDayId;
  String place;
  String type;
  GeoPoint geoPoint;

  Stages(
      {this.id,
      this.name,
      this.date,
      this.eventDayId,
      this.place,
      this.type,
      this.geoPoint});

  factory Stages.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data;
    return Stages(
      id: doc.documentID,
      name: data['name'],
      date: data['date'],
      eventDayId: data['eventDayId'],
      place: data['place'],
      type: data['type'],
      geoPoint: data['geoPoint'],
    );
  }
}
