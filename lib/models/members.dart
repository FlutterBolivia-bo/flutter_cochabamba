import 'package:cloud_firestore/cloud_firestore.dart';

class Member {
  String id;
  String name;
  String photoUrl;
  String description;
  String facebookUrl;
  String instagramUrl;
  String twitterUrl;
  String youtubeUrl;

  Member(
      {this.id,
      this.name,
      this.photoUrl,
      this.description,
      this.facebookUrl,
      this.instagramUrl,
      this.twitterUrl,
      this.youtubeUrl});

  factory Member.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data;
    return Member(
        id: doc.documentID,
        name: data['name'],
        photoUrl: data['photoUrl'],
        description: data['description'],
        facebookUrl: data['facebookUrl'],
        instagramUrl: data['instagramUrl'],
        twitterUrl: data['twitterUrl'],
        youtubeUrl: data['youtubeUrl']);
  }
}
