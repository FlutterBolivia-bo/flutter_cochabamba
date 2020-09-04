import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cochabamba/models/stages.dart';
import 'package:flutter_cochabamba/provider/controllers/event_day_controller.dart';
import 'package:flutter_cochabamba/theme/custom_text_styles.dart';
import 'package:flutter_cochabamba/ui_strings.dart';
import 'package:provider/provider.dart';

class StagesList extends StatefulWidget {
  @override
  _StagesListState createState() => _StagesListState();
}

class _StagesListState extends State<StagesList> {
  ThemeData theme;
  EventDayController eventDayController;

  @override
  Widget build(BuildContext context) {
    eventDayController = Provider.of<EventDayController>(context);
    theme = Theme.of(context);
    List<Stages> _currentStages = eventDayController.currentStages;
    print(_currentStages);
    if(_currentStages.isEmpty) {
      return Container(
        child: Center(
          child: Text(UiStrings.thereAreNoUpcomingEvents, style: CustomTextStyles.textTitle(),),
        ),
      );
    }
    return Container(
      padding: EdgeInsets.all(20.0),
      width: double.infinity,
      height: 500,
      child: ListView(
        children: _currentStages.map((stage) {
          return Container(child: _itemStage(stage));
        }).toList(),
      ),
    );
  }

  Widget _itemStage(Stages stage) {
    return Card(
      child: ListTile(
        leading: _hourStage(stage.date),
        title: Text(
          stage.name,
        ),
        subtitle: _detailStage(stage),
      ),
    );
  }

  Widget _hourStage(Timestamp timestamp) {
    return Text(
      '${timestamp.toDate().hour.toString()} ${timestamp.toDate().hour > 12 ? 'PM' : 'AM'}',
      style: TextStyle(color: Colors.blue),
    );
  }

  Widget _detailStage(Stages stage) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(stage.place),
        ],
      ),
    );
  }

}
