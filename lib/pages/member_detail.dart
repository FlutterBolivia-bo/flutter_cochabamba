import 'package:flutter/material.dart';
import 'package:flutter_cochabamba/models/members.dart';
import 'package:flutter_cochabamba/widgets/social_networks.dart';

class MemberDetail extends StatefulWidget {
  @override
  _MemberDetailState createState() => _MemberDetailState();
}

class _MemberDetailState extends State<MemberDetail> {
  ThemeData theme;

  MediaQueryData mediaQuery;

  @override
  Widget build(BuildContext context) {
    mediaQuery = MediaQuery.of(context);
    theme = Theme.of(context);
    final Member member = ModalRoute.of(context).settings.arguments as Member;
    print(member.name);
    return Scaffold(
      body: Container(
        height: double.infinity,
        color: theme.primaryColor,
        child: _memberDetail(member, context),
      ),
    );
  }

  Widget _memberDetail(Member member, BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            child: Column(
              children: [
                _photoMember(member.photoUrl),
                _name(member.name),
                SizedBox(
                  height: 15,
                ),
                _description(member.description),
                SizedBox(
                  height: 15,
                ),
                _socialNetworks(member)
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: SafeArea(
                child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0)),
                    child: IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () => Navigator.of(context).pop()))),
          ),
        ],
      ),
    );
  }

  Widget _photoMember(String url) {
    return Container(
        height: mediaQuery.size.height * 0.6,
        child: Image(image: NetworkImage(url)));
  }

  Widget _name(String name) {
    return Container(
      child: Center(
        child: Text(
          name,
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
    );
  }

  Widget _description(String description) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Center(
        child: Text(
          description,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }

  Widget _socialNetworks(Member member) {
    return Container(
        child: SocialNetworks(
      facebookUrl: member.facebookUrl,
      twitterUrl: member.twitterUrl,
      instagramUrl: member.instagramUrl,
      youtubeUrl: member.youtubeUrl,
      colorIcons: Colors.white,
    ));
  }
}
