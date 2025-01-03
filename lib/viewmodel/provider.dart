import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:remoteconfic/services/services.dart';

class ProviderOfFetching extends ChangeNotifier {
  ServicesofRemote ser = ServicesofRemote();
  String? name = '';
  int? age = 0;

  getInitialze() async {
    try {
      await ser.getData();
      name = await ser.getName();
      log('name');

      age = await ser.getAge();
      log(age.toString());
      notifyListeners();
    } catch (e) {
      log('error ');
    }
  }
}
