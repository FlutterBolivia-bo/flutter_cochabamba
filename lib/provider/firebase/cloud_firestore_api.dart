import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_cochabamba/models/Sponsor.dart';
import 'package:flutter_cochabamba/models/members.dart';

class CloudFireStoreAPI {
  final String MEMBERS = 'members';
  final String SPONSORS = 'sponsors';

  final Firestore _db = Firestore.instance;

  Stream<List<Member>> streamMembers() {
    var ref = _db.collection(MEMBERS);
    return ref
        .snapshots()
        .map((list) => list.documents.map((doc) => Member.fromFirestore(doc)).toList());
  }

  Stream<List<Sponsor>> streamSponsors() {
    var ref = _db.collection(SPONSORS);
    return ref
        .where('flagDelete', isEqualTo: false)
        .snapshots()
        .map((list) => list.documents.map((doc) => Sponsor.fromFirestore(doc)).toList());
  }

}
