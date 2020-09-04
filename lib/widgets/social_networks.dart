import 'package:flutter/material.dart';
import 'package:flutter_cochabamba/constants/enums.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialNetworks extends StatelessWidget {
  String facebookUrl;
  String twitterUrl;
  String instagramUrl;
  String youtubeUrl;
  Color colorIcons;
  List<Widget> socialNetworksWidget = [];

  SocialNetworks(
      {this.facebookUrl,
      this.twitterUrl,
      this.instagramUrl,
      this.youtubeUrl,
      this.colorIcons});

  void initSocialNetwork() {
    if (facebookUrl != null)
      socialNetworksWidget
          .add(_socialNetwork(socialNetworks.facebook, facebookUrl));
    if (twitterUrl != null)
      socialNetworksWidget
          .add(_socialNetwork(socialNetworks.twitter, twitterUrl));
    if (instagramUrl != null)
      socialNetworksWidget
          .add(_socialNetwork(socialNetworks.instagram, instagramUrl));
    if (youtubeUrl != null)
      socialNetworksWidget
          .add(_socialNetwork(socialNetworks.youtube, youtubeUrl));
  }

  @override
  Widget build(BuildContext context) {
    initSocialNetwork();
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: socialNetworksWidget,
      ),
    );
  }

  Widget _socialNetwork(dynamic socialNetwork, String socialNetworkUrl) {
    return IconButton(
        icon: _iconSocialNetwork(socialNetwork),
        onPressed: () => goToPage(socialNetworkUrl));
  }

  Widget _iconSocialNetwork(dynamic socialNetwork) {
    print(socialNetwork);
    switch (socialNetwork) {
      case socialNetworks.facebook:
        return Icon(FontAwesome.facebook, color: colorIcons);
      case socialNetworks.twitter:
        return Icon(FontAwesome.twitter, color: colorIcons);
      case socialNetworks.instagram:
        return Icon(FontAwesome.instagram, color: colorIcons);
      case socialNetworks.youtube:
        return Icon(FontAwesome.youtube, color: colorIcons);
      default:
        return Container();
    }
  }

  Future<void> goToPage(url) async {
    if (await canLaunch(url) != null) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
