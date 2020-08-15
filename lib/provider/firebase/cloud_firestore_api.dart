import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_cochabamba/models/Sponsor.dart';
import 'package:flutter_cochabamba/models/event_day.dart';
import 'package:flutter_cochabamba/models/members.dart';
import 'package:flutter_cochabamba/models/stages.dart';

class CloudFireStoreAPI {
  final String MEMBERS = 'members';
  final String SPONSORS = 'sponsors';
  final String EVENT_DAY = 'eventDay';
  final String STAGES = 'stages';

  final Firestore _db = Firestore.instance;

  Stream<List<Member>> streamMembers() {
    var ref = _db.collection(MEMBERS);
    return ref.snapshots().map((list) =>
        list.documents.map((doc) => Member.fromFirestore(doc)).toList());
  }

  Stream<List<Sponsor>> streamSponsors() {
    var ref = _db.collection(SPONSORS);
    return ref.where('flagDelete', isEqualTo: false).snapshots().map((list) =>
        list.documents.map((doc) => Sponsor.fromFirestore(doc)).toList());
  }

  Stream<List<EventDay>> streamEventDay() {
    var ref = _db.collection(EVENT_DAY);
    return ref.where('activated', isEqualTo: true).snapshots().map((list) =>
        list.documents.map((doc) => EventDay.fromFirestore(doc)).toList());
  }

  Future<List<EventDay>> getEventDay() async {
    var ref = _db.collection(EVENT_DAY);
    var documents = await ref
        .where('activated', isEqualTo: true)
        .getDocuments();
    List<EventDay> eventsDay = [];
    documents.documents.forEach((element) {
      eventsDay.add(EventDay.fromFirestore(element));
      eventsDay.sort((a,b) => a.date.toDate().compareTo(b.date.toDate()));
    });
    return eventsDay;
  }

  Future<List<Stages>> getstagesByIdEventDay(String eventDayId) async {
    CollectionReference ref = _db.collection(STAGES);
    var documents =
        await ref.where('eventDayId', isEqualTo: eventDayId).getDocuments();
    List<Stages> stages = [];
    documents.documents.forEach((element) {
      stages.add(Stages.fromFirestore(element));
    });
    return stages;
  }
}
