import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_cochabamba/models/members.dart';

class CloudFireStoreAPI {
  final String MEMBERS = 'members';

  final Firestore _db = Firestore.instance;

  Stream<List<Member>> streamMembers() {
    var ref = _db.collection(MEMBERS);
    return ref
        .snapshots()
        .map((list) => list.documents.map((doc) => Member.fromFirestore(doc)).toList());
  }
}
