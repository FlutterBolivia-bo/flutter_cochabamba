import 'package:flutter/material.dart';
import 'package:flutter_cochabamba/provider/controllers/event_day_controller.dart';
import 'package:flutter_cochabamba/provider/firebase/cloud_firestore_api.dart';
import 'package:flutter_cochabamba/ui_strings.dart';
import 'package:flutter_cochabamba/widgets/loading.dart';
import 'package:flutter_cochabamba/widgets/nav_bar_event_day.dart';
import 'package:flutter_cochabamba/widgets/stages_list.dart';
import 'package:provider/provider.dart';

class EventsPage extends StatefulWidget {
  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  final db = CloudFireStoreAPI();
  List<String> stages = [];
  int eventDaySelected = 0;
  ThemeData theme;
  EventDayController eventDayController;

  @override
  Widget build(BuildContext context) {
    eventDayController = Provider.of<EventDayController>(context);
    theme = Theme.of(context);
    if(eventDayController.loading) {
      eventDayController.getEventsDay(db);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(UiStrings.schedule),
      ),
      body: Container(
        color: theme.primaryColor,
        height: double.infinity,
        child: Column(
          children: [
            eventDayController.loading ? Loading() : NavBarEventDay(),
            StagesList()
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    eventDayController.resetProvider();
    super.dispose();
  }

}
