import 'package:flutter/material.dart';
import 'package:flutter_cochabamba/ui_strings.dart';
import 'package:flutter_cochabamba/constants/constants.dart';
import 'package:flutter_cochabamba/constants/enums.dart';
import 'package:flutter_cochabamba/theme/custom_text_styles.dart';
import 'package:flutter_cochabamba/widgets/custom_card.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  ThemeData theme;

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          color: theme.primaryColor,
          child: SafeArea(child: _body(context))),
    );
  }

  Widget _body(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40),
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 59,
            ),
            _title(),
            SizedBox(
              height: 30,
            ),
            _communityIcon(),
            SizedBox(
              height: 30,
            ),
            CustomCard(
              content: _welcome(),
            ),
            SizedBox(
              height: 30,
            ),
            CustomCard(
              content: _pages(context),
            )
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return Container(
      child: Text(
        UiStrings.titleApp,
        style: CustomTextStyles.textTitle(),
      ),
    );
  }

  Widget _communityIcon() {
    return Container(
      child: SvgPicture.asset(
        RouteImage.ICON_FLUTTER_HOME,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _welcome() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
      child: Column(
        children: [
          Text(
            UiStrings.welcome,
            style: TextStyle(fontSize: 22),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            UiStrings.messageWelcome,
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 30,
          ),
          _socialNetworks()
        ],
      ),
    );
  }

  Widget _socialNetworks() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
              icon: Icon(
                FontAwesome.facebook,
                color: theme.primaryColor,
              ),
              onPressed: () => goToPage(socialNetworks.facebook)),
          IconButton(
              icon: Icon(FontAwesome.twitter, color: theme.primaryColor),
              onPressed: () => goToPage(socialNetworks.twitter)),
          IconButton(
              icon: Icon(FontAwesome.instagram, color: theme.primaryColor),
              onPressed: () => goToPage(socialNetworks.instagram)),
          IconButton(
              icon: Icon(FontAwesome.youtube_play, color: theme.primaryColor),
              onPressed: () => goToPage(socialNetworks.youtube))
        ],
      ),
    );
  }

  Widget _pages(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _page(Icons.event, UiStrings.schedule,
              () => Navigator.pushNamed(context, Routes.EVENTS)),
          _page(Icons.people, UiStrings.members,
              () => Navigator.pushNamed(context, Routes.MEMBERS)),
          _page(FontAwesome.handshake_o, UiStrings.sponsors,
              () => Navigator.pushNamed(context, Routes.SPONSORS))
        ],
      ),
    );
  }

  Widget _page(IconData icon, String text, Function function) {
    return GestureDetector(
      child: Container(
        child: Column(
          children: [Icon(icon), Text(text)],
        ),
      ),
      onTap: () => function(),
    );
  }

  Future<void> goToPage(dynamic socialNetwork) async {
    String url;
    switch (socialNetwork) {
      case socialNetworks.facebook:
        {
          url = Constants.URL_FACEBOOK;
        }
        break;
      case socialNetworks.twitter:
        {
          url = Constants.URL_TWITTER;
        }
        break;
      case socialNetworks.instagram:
        {
          url = Constants.URL_INSTAGRAM;
        }
        break;
      case socialNetworks.youtube:
        {
          url = Constants.URL_YOUTUBE;
        }
        break;
    }
    if (await canLaunch(url) != null) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
