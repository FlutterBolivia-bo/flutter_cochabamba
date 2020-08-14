import 'package:flutter/material.dart';
import 'package:flutter_cochabamba/constants/constants.dart';
import 'package:flutter_cochabamba/models/members.dart';
import 'package:flutter_cochabamba/provider/firebase/cloud_firestore_api.dart';
import 'package:flutter_cochabamba/ui_strings.dart';

class MembersPage extends StatefulWidget {
  @override
  _MembersPageState createState() => _MembersPageState();
}

class _MembersPageState extends State<MembersPage> {
  final db = CloudFireStoreAPI();

  ThemeData theme;

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(UiStrings.members),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        color: theme.primaryColor,
        child: _steamMembers(),
      ),
    );
  }

  Widget _steamMembers() {
    return StreamBuilder(
        stream: db.streamMembers(),
        builder: (BuildContext context, AsyncSnapshot<List<Member>> snapshot) {
          return _createListMembers(snapshot.data, context);
        });
  }

  Widget _createListMembers(List<Member> members, BuildContext context) {
    print(members);
    if (members != null) {
      return GridView.count(
        crossAxisCount: 2,
        children: members.map((member) {
          return _memberItem(member, context);
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

  Widget _memberItem(Member member, BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Navigator.pushNamed(context, Routes.MEMBER_DETAIL, arguments: member),
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        child: Image(image: NetworkImage(member.photoUrl)),
      ),
    );
  }
}
