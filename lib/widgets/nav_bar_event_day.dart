import 'package:flutter/material.dart';
import 'package:flutter_cochabamba/models/event_day.dart';
import 'package:flutter_cochabamba/provider/controllers/event_day_controller.dart';
import 'package:flutter_cochabamba/provider/firebase/cloud_firestore_api.dart';
import 'package:provider/provider.dart';

import '../ui_strings.dart';

class NavBarEventDay extends StatefulWidget {
  @override
  _NavBarEventDayState createState() => _NavBarEventDayState();
}

class _NavBarEventDayState extends State<NavBarEventDay> {
  EventDayController eventDayController;
  int eventDaySelected = 0;
  final db = CloudFireStoreAPI();
  ThemeData theme;

  @override
  Widget build(BuildContext context) {
    eventDayController = Provider.of<EventDayController>(context);
    theme = Theme.of(context);
    return Container(
      width: double.infinity,
      height: 35,
      child: _createListEventDay(eventDayController.eventDay, context),
    );
  }

  Widget _createListEventDay(List<EventDay> eventsDay, BuildContext context) {
    if (eventsDay != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: eventsDay.asMap().entries.map((entry) {
          return _eventDay(entry.value, entry.key);
        }).toList(),
      );
    } else {
      return Container(
        child: Center(
          child: Text(
            UiStrings.noAvailable,
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    }
  }

  Widget _eventDay(EventDay eventDay, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          eventDaySelected = index;
          eventDayController.getStagesByIdEventDay(db, eventDay.id);
        });
      },
      child: Card(
        color: eventDaySelected == index ? Colors.blue : Colors.white,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 5),
          width: 50,
          child: Center(
            child: Text(
              '${eventDay.date.toDate().month.toString()} ${eventDay.date.toDate().day.toString()}',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
