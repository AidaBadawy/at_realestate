import 'package:aisu_realestate/app/app.locator.dart';
import 'package:aisu_realestate/models/tenant_model.dart';
import 'package:aisu_realestate/services/authentication_service.dart';
import 'package:aisu_realestate/services/pocketbase_service.dart';
import 'package:aisu_realestate/ui/common/pocketbase_collection.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:stacked/stacked.dart';

class TenantService with ListenableServiceMixin {
  TenantService() {
    listenToReactiveValues([
      _tenantList,
    ]);
  }

  final _pocketBaseService = locator<PocketBaseService>();
  final _authenticationService = locator<AuthenticationService>();

  final ReactiveValue<List<TenantModel>> _tenantList =
      ReactiveValue<List<TenantModel>>([]);
  List<TenantModel> get tenantList => _tenantList.value;

  Future<bool> addTenant(TenantModel tenantModel) async {
    try {
      await _pocketBaseService.pb.collection(pbTenant).create(
        body: tenantModel.toJson(),
        headers: {
          'Authorization': _authenticationService.userData.token!,
        },
      );

      return true;
    } on ClientException catch (e) {
      Fluttertoast.showToast(
          msg: e.response["message"],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      return false;
    }
  }

  Future<bool> fetchTotalTenant() async {
    try {
      final totalPocket =
          await _pocketBaseService.pb.collection(pbTenant).getFullList(
        expand: "landlord,property.apartment_id",
        headers: {
          'Authorization': _authenticationService.userData.token!,
        },
      );

      // if (totalPocket.isNotEmpty) {
      _tenantList.value = List.from(totalPocket
          .map<TenantModel>((e) => TenantModel.fromJson(e.toJson())));

      return true;
      // }

      // return true;
    } on ClientException catch (e) {
      Fluttertoast.showToast(
          msg: e.response["message"],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      return false;
    }
  }
}
