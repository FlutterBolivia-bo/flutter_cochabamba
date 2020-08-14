import 'package:flutter/material.dart';
import 'package:flutter_cochabamba/models/members.dart';

class MemberDetail extends StatelessWidget {
  ThemeData theme;

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    final Member member = ModalRoute.of(context).settings.arguments as Member;
    print(member.name);
    return Scaffold(
      appBar: AppBar(
        title: Text('Miembro'),
      ),
      body: Container(
        color: theme.primaryColor,
        child: _memberDetail(member),
      ),
    );
  }

  Widget _memberDetail(Member member) {
    return Container(
      child: Column(
        children: [
          _photoMember(member.photoUrl),
          _name(member.name)
        ],
      ),
    );
  }

  Widget _photoMember(String url) {
    return Image(image: NetworkImage(url));
  }

  Widget _name(String name) {
    return Container(
      child: Center(
        child: Text(name, style: TextStyle(color: Colors.white),),
      ),
    );
  }
}
