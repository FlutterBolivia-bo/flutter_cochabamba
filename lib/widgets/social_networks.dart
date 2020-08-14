import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialNetworks extends StatelessWidget {
  String facebookUrl;
  String twitterUrl;
  String instagramUrl;
  String youtubeUrl;
  Color colorIcons;

  SocialNetworks(
      {this.facebookUrl, this.twitterUrl, this.instagramUrl, this.youtubeUrl, this.colorIcons});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          facebookUrl != null
              ? IconButton(
                  icon: Icon(
                    FontAwesome.facebook,
                    color: colorIcons,
                  ),
                  onPressed: () => goToPage(facebookUrl))
              : Container(),
          twitterUrl != null
              ? IconButton(
                  icon: Icon(FontAwesome.twitter, color: colorIcons),
                  onPressed: () => goToPage(twitterUrl))
              : Container(),
          instagramUrl != null
              ? IconButton(
                  icon: Icon(FontAwesome.instagram, color: colorIcons),
                  onPressed: () => goToPage(instagramUrl))
              : Container(),
          youtubeUrl != null
              ? IconButton(
                  icon:
                      Icon(FontAwesome.youtube_play, color: colorIcons),
                  onPressed: () => goToPage(youtubeUrl))
              : Container()
        ],
      ),
    );
  }

  Future<void> goToPage(url) async {
    if (await canLaunch(url) != null) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
