import 'package:aisu_realestate/app/app.locator.dart';
import 'package:aisu_realestate/models/payment_model.dart';
import 'package:aisu_realestate/services/authentication_service.dart';
import 'package:aisu_realestate/services/pocketbase_service.dart';
import 'package:aisu_realestate/ui/common/pocketbase_collection.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:stacked/stacked.dart';

class PaymentService with ListenableServiceMixin {
  PaymentService() {
    listenToReactiveValues([
      _recentPaymentList,
      _pendingPaymentList,
    ]);
  }

  final _pocketBaseService = locator<PocketBaseService>();
  final _authenticationService = locator<AuthenticationService>();

  final ReactiveValue<List<PaymentModel>> _recentPaymentList =
      ReactiveValue<List<PaymentModel>>([]);
  List<PaymentModel> get recentPaymentList => _recentPaymentList.value;

  final ReactiveValue<List<PaymentModel>> _pendingPaymentList =
      ReactiveValue<List<PaymentModel>>([]);
  List<PaymentModel> get pendingPaymentList => _pendingPaymentList.value;

  Future<bool> addPayment(PaymentModel tenantModel) async {
    try {
      await _pocketBaseService.pb.collection(pbPayment).create(
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

  Future<bool> fetchPendingPayment() async {
    try {
      final totalPayment =
          await _pocketBaseService.pb.collection(pbPayment).getFullList(
        expand: "tenant,landlord,property",
        filter: 'is_pending = true',
        headers: {
          'Authorization': _authenticationService.userData.token!,
        },
      );

      _pendingPaymentList.value = List.from(totalPayment
          .map<PaymentModel>((e) => PaymentModel.fromJson(e.toJson())));

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

  Future<bool> fetchrecentPayment() async {
    try {
      final totalPayment =
          await _pocketBaseService.pb.collection(pbPayment).getFullList(
        // expand: "tenant,landlord,property",
        filter: 'is_pending = false',
        headers: {
          'Authorization': _authenticationService.userData.token!,
        },
      );

      _recentPaymentList.value = List.from(totalPayment
          .map<PaymentModel>((e) => PaymentModel.fromJson(e.toJson())));

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
}
