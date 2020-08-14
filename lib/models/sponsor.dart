import 'package:cloud_firestore/cloud_firestore.dart';

class Sponsor {
  String id;
  String name;
  String photoUrl;
  String description;
  String facebookUrl;
  String instagramUrl;
  String twitterUrl;
  String youtubeUrl;
  GeoPoint geoPoint;

  Sponsor(
      {this.id,
      this.name,
      this.photoUrl,
      this.description,
      this.facebookUrl,
      this.instagramUrl,
      this.twitterUrl,
      this.youtubeUrl,
      this.geoPoint});

  factory Sponsor.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data;
    return Sponsor(
        id: doc.documentID,
        name: data['name'],
        photoUrl: data['photoUrl'],
        description: data['description'],
        facebookUrl: data['facebookUrl'],
        instagramUrl: data['instagramUrl'],
        twitterUrl: data['twitterUrl'],
        youtubeUrl: data['youtubeUrl'],
        geoPoint: data['geoPoint']);
  }
}
