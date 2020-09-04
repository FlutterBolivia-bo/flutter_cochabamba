import 'package:flutter/material.dart';
import 'package:flutter_cochabamba/constants/constants.dart';
import 'package:flutter_cochabamba/models/Sponsor.dart';
import 'package:flutter_cochabamba/provider/firebase/cloud_firestore_api.dart';
import 'package:flutter_cochabamba/ui_strings.dart';

class SponsorsPage extends StatefulWidget {
  @override
  _SponsorsPageState createState() => _SponsorsPageState();
}

class _SponsorsPageState extends State<SponsorsPage> {
  final db = CloudFireStoreAPI();

  ThemeData theme;

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(UiStrings.sponsors),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        color: theme.primaryColor,
        child: _streamSponsor(),
      ),
    );
  }

  Widget _streamSponsor() {
    return StreamBuilder(
        stream: db.streamSponsors(),
        builder: (BuildContext context, AsyncSnapshot<List<Sponsor>> snapshot) {
          return _createListSponsors(snapshot.data, context);
        });
  }

  Widget _createListSponsors(List<Sponsor> sponsor, BuildContext context) {
    if (sponsor != null) {
      return GridView.count(
        crossAxisCount: 2,
        children: sponsor.map((sponsor) {
          return _sponsorItem(sponsor, context);
        }).toList(),
      );
    } else {
      return Container(
        child: Center(
          child: Text(UiStrings.noAvailable),
        ),
      );
    }
  }

  Widget _sponsorItem(Sponsor sponsor, BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, Routes.SPONSOR_DETAIL,
          arguments: sponsor),
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        child: Hero(
          tag: sponsor.id,
          child: Image(
            image: NetworkImage(sponsor.photoUrl),
          ),
        ),
      ),
    );
  }
}
