import 'dart:async';

import 'package:aisu_realestate/utils/env.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

class PocketBaseService with ListenableServiceMixin {
  PocketBaseService() {
    listenToReactiveValues([
      initPocketBase(),
    ]);
  }

  PocketBase pb = PocketBase(env!.baseUrl);

  initPocketBase() async {
    final prefs = await SharedPreferences.getInstance();

    final store = AsyncAuthStore(
      save: (String data) async => prefs.setString('pb_auth', data),
      initial: prefs.getString('pb_auth'),
    );
    pb = PocketBase(env!.baseUrl, authStore: store);
  }

  Future<AsyncAuthStore> isUserValid() async {
    final prefs = await SharedPreferences.getInstance();

    final store = AsyncAuthStore(
      save: (String data) async => prefs.setString('pb_auth', data),
      initial: prefs.getString('pb_auth'),
    );

    return store;
  }
}
