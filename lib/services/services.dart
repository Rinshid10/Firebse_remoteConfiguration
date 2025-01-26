import 'dart:developer';

import 'package:firebase_remote_config/firebase_remote_config.dart';

class ServicesofRemote {
  final FirebaseRemoteConfig conf = FirebaseRemoteConfig.instance;
  Future getData() async {
    try {
    

      await conf.setConfigSettings(RemoteConfigSettings(
          fetchTimeout: Duration(seconds: 10),
          minimumFetchInterval: Duration(seconds: 10)));
      await conf.fetchAndActivate();
    } on FirebaseRemoteConfig catch (e) {
      log('error to fetch data or iniziolise data $e');
    }
  }

  getName() async {
    return conf.getString('name');
  }

  getColor() async {
    return conf.getString('color');
  }

  getAge() async {
    return conf.getInt('age');
  }
}
