import 'package:flutter/material.dart';
import 'package:flutter_cochabamba/ui_strings.dart';
import 'package:flutter_cochabamba/constants/constants.dart';
import 'package:flutter_cochabamba/pages/events_page.dart';
import 'package:flutter_cochabamba/pages/home_page.dart';
import 'package:flutter_cochabamba/pages/members_page.dart';
import 'package:flutter_cochabamba/pages/sponsors_page.dart';
import 'package:flutter_cochabamba/theme/custom_themes.dart';
import 'package:flutter_cochabamba/theme/theme_changer.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeChanger>(
          create: (_) => ThemeChanger(CustomThemes.mainTheme),
        ),
      ],
      child: MainApp(),
    );
  }
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme.getTheme(),
      title: UiStrings.titleApp,
      initialRoute: Routes.HOME,
      routes: {
        Routes.HOME: (BuildContext context) => HomePage(),
        Routes.EVENTS: (BuildContext context) => EventsPage(),
        Routes.SPONSORS: (BuildContext context) => SponsorsPage(),
        Routes.MEMBERS: (BuildContext context) => MembersPage(),
      },
    );
  }
}
