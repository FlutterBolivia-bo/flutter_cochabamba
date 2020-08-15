import 'package:flutter/material.dart';
import 'package:flutter_cochabamba/models/Sponsor.dart';
import 'package:flutter_cochabamba/widgets/social_networks.dart';

class SponsorDetail extends StatefulWidget {
  @override
  _SponsorDetailState createState() => _SponsorDetailState();
}

class _SponsorDetailState extends State<SponsorDetail> {
  ThemeData theme;

  MediaQueryData mediaQuery;

  @override
  Widget build(BuildContext context) {
    mediaQuery = MediaQuery.of(context);
    theme = Theme.of(context);
    final Sponsor sponsor =
        ModalRoute.of(context).settings.arguments as Sponsor;
    return Scaffold(
      body: Container(
        height: double.infinity,
        color: theme.primaryColor,
        child: _sponsorDetail(sponsor, context),
      ),
    );
  }

  Widget _sponsorDetail(Sponsor sponsor, BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            child: Column(
              children: [
                _photoMember(sponsor.photoUrl),
                _name(sponsor.name),
                SizedBox(
                  height: 15,
                ),
                _description(sponsor.description),
                SizedBox(
                  height: 15,
                ),
                _socialNetworks(sponsor)
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

  Widget _socialNetworks(Sponsor sponsor) {
    return Container(
        child: SocialNetworks(
      facebookUrl: sponsor.facebookUrl,
      twitterUrl: sponsor.twitterUrl,
      instagramUrl: sponsor.instagramUrl,
      youtubeUrl: sponsor.youtubeUrl,
      colorIcons: Colors.white,
    ));
  }
}
