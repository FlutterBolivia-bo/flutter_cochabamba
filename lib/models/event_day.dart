import 'package:cloud_firestore/cloud_firestore.dart';

class EventDay {
  String id;
  Timestamp date;
  bool activated;
  List<String> stages;

  EventDay({this.id, this.date, this.activated, this.stages});

  factory EventDay.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data;
    return EventDay(
        id: doc.documentID,
        date: data['date'],
        activated: data['activated'],
        stages: List.from(data['stages']));
  }
}
