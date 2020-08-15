import 'package:flutter/material.dart';
import 'package:flutter_cochabamba/models/event_day.dart';
import 'package:flutter_cochabamba/models/stages.dart';
import 'package:flutter_cochabamba/provider/firebase/cloud_firestore_api.dart';

class EventDayController with ChangeNotifier {
  List<EventDay> _eventDays = [];
  List<Stages> _currentStages = [];
  bool _loading = true;

  getEventsDay(CloudFireStoreAPI db) {
    db.getEventDay().then((value) async {
      _eventDays = value;
      _loading = false;
      if(value.isNotEmpty) {
        _currentStages = await db.getstagesByIdEventDay(value[0].id);
        print(currentStages);
      }
      notifyListeners();
    }).catchError((e) {});
  }

  getStagesByIdEventDay(CloudFireStoreAPI db, String eventDayId) {
    db.getstagesByIdEventDay(eventDayId).then((value) {
      _currentStages = value;
      notifyListeners();
    }).catchError((e) {});
  }

  get eventDay {
    return _eventDays;
  }

  set eventDay(List<EventDay> eventDays) {
    this._eventDays = eventDays;
    notifyListeners();
  }

  get currentStages {
    return _currentStages;
  }

  set currentStages(List<Stages> currentStages) {
    this._currentStages = currentStages;
    notifyListeners();
  }

  get loading {
    return _loading;
  }

  set loading(bool loading) {
    this._loading = loading;
    notifyListeners();
  }

  resetProvider() {
    _eventDays = [];
    _currentStages = [];
    _loading = true;
    notifyListeners();
  }
}
