import 'package:aisu_realestate/app/app.locator.dart';
import 'package:aisu_realestate/models/apartment_model.dart';
import 'package:aisu_realestate/models/app_id_model.dart';
import 'package:aisu_realestate/models/landlord_model.dart';
import 'package:aisu_realestate/models/property_model.dart';
import 'package:aisu_realestate/models/total_count_model.dart';
import 'package:aisu_realestate/services/authentication_service.dart';
import 'package:aisu_realestate/services/dio_client.dart';
import 'package:aisu_realestate/services/pocketbase_service.dart';
import 'package:aisu_realestate/ui/common/pocketbase_collection.dart';
import 'package:aisu_realestate/utils/env.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:stacked/stacked.dart';

class ListingService with ListenableServiceMixin {
  // final _mainService = locator<MainService>();

  ListingService() {
    listenToReactiveValues([
      _newApartmentList,
      _apartmentList,
      _incrementModel,
      _newPropertyList,
      _propertyList,
      _landlordList,
      _totalLandlord,
      _totalProperty,
      _totalTenant,
      _totalVacant,
      _totalCount,
      _searchlandlordList,
    ]);
  }

  final _authenticationService = locator<AuthenticationService>();
  final _pocketBaseService = locator<PocketBaseService>();

  final ReactiveValue<List<ApartmentModel>> _newApartmentList =
      ReactiveValue<List<ApartmentModel>>([]);
  List<ApartmentModel> get newApartmentList => _newApartmentList.value;

  final ReactiveValue<int> _totalLandlord = ReactiveValue<int>(0);
  int get totalLandlord => _totalLandlord.value;

  final ReactiveValue<int> _totalProperty = ReactiveValue<int>(0);
  int get totalProperty => _totalProperty.value;

  final ReactiveValue<int> _totalTenant = ReactiveValue<int>(0);
  int get totalTenant => _totalTenant.value;

  final ReactiveValue<int> _totalVacant = ReactiveValue<int>(0);
  int get totalVacant => _totalVacant.value;

  final ReactiveValue<TotalCount> _totalCount =
      ReactiveValue<TotalCount>(defaultTotalCount);
  TotalCount get totalCount => _totalCount.value;

  final ReactiveValue<List<PropertyModel>> _propertyListVacant =
      ReactiveValue<List<PropertyModel>>([]);
  List<PropertyModel> get propertyListVacant => _propertyListVacant.value;

  final ReactiveValue<List<LandlordModel>> _landlordListVacant =
      ReactiveValue<List<LandlordModel>>([]);
  List<LandlordModel> get landlordListVacant => _landlordListVacant.value;

  final ReactiveValue<List<ApartmentModel>> _apartmentListVacant =
      ReactiveValue<List<ApartmentModel>>([]);
  List<ApartmentModel> get apartmentListVacant => _apartmentListVacant.value;

  final ReactiveValue<List<ApartmentModel>> _apartmentList =
      ReactiveValue<List<ApartmentModel>>([]);
  List<ApartmentModel> get apartmentList => _apartmentList.value;

  final ReactiveValue<List<PropertyModel>> _propertyList =
      ReactiveValue<List<PropertyModel>>(
    [],
  );
  List<PropertyModel> get propertyList => _propertyList.value;

  final ReactiveValue<List<PropertyModel>> _newPropertyList =
      ReactiveValue<List<PropertyModel>>([]);
  List<PropertyModel> get newPropertyList => _newPropertyList.value;

  final ReactiveValue<IncrementModel> _incrementModel =
      ReactiveValue<IncrementModel>(IncrementModel());
  IncrementModel get incrementModel => _incrementModel.value;

  final ReactiveValue<List<LandlordModel>> _landlordList =
      ReactiveValue<List<LandlordModel>>([]);
  List<LandlordModel> get landlordList => _landlordList.value;

  final ReactiveValue<List<LandlordModel>> _searchlandlordList =
      ReactiveValue<List<LandlordModel>>([]);
  List<LandlordModel> get searchlandlordList => _searchlandlordList.value;

  late Dio _dio;
  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  addNewApartment(ApartmentModel value) {
    _newApartmentList.value.add(value);
    notifyListeners();
  }

  deleteApartment(String id) {
    _newApartmentList.value.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  clearApartment() {
    _newApartmentList.value = [];
    notifyListeners();
  }

  clearSearchApartment() {
    _apartmentList.value.clear();
    notifyListeners();
  }

  updateApartment(String id) {}

  addNewProperty(PropertyModel value) {
    _newPropertyList.value.add(value);
    notifyListeners();
  }

  deleteProperty(String id) {
    _newPropertyList.value.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  clearProperty() {
    _newPropertyList.value = [];
    notifyListeners();
  }

  Future<bool> getListings() async {
    try {
      _dio = await DioClient().publicDio();
      final response = await _dio.get(
        "${env!.baseUrl}api/collections/landlordFetch/records",
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': _authenticationService.userData.token,
          },
        ),
      );
      if (response.statusCode == 200) {
        List data = response.data;

        debugPrint(data.toString());

        return true;
      }
    } on DioException catch (exception) {
      _errorMessage = exception.message.toString();
      Fluttertoast.showToast(
          msg: _errorMessage,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }

    return false;
  }

  Future<bool> addLandlord(LandlordModel landlordModel) async {
    try {
      await _pocketBaseService.pb.collection(pbLandlord).create(
        body: landlordModel.toJson(),
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

  Future<bool> addApartment(ApartmentModel apartmentModel) async {
    try {
      await _pocketBaseService.pb.collection(pbApartment).create(
        body: apartmentModel.toJson(),
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

  Future<bool> addProperty(PropertyModel propertyModel) async {
    try {
      await _pocketBaseService.pb.collection(pbProperty).create(
        body: propertyModel.toJson(),
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

  final pb = PocketBase(env!.baseUrl);

  fetchLandlordPocketBase(int page, int total) async {
    final resultList = await pb.collection('landlord').getList(
      page: page,
      perPage: total,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': _authenticationService.userData.token!,
      },
    );
  }

  fetchTenantPocketBase(int page, int total) async {
    final resultList = await pb.collection('tenants').getList(
      page: page,
      perPage: total,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': _authenticationService.userData.token!,
      },
    );

    print(resultList);
  }

  fetchPropertyPocketBase(int page, int total) async {
    final resultList = await pb.collection('property').getList(
      page: page,
      perPage: total,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': _authenticationService.userData.token!,
      },
    );

    print(resultList);
  }

  Future<bool> fetchTotalCount() async {
    try {
      final totalPocket =
          await _pocketBaseService.pb.collection(pbTotalCount).getFullList(
        headers: {
          'Authorization': _authenticationService.userData.token!,
        },
      );

      if (totalPocket.isNotEmpty) {
        _totalCount.value = TotalCount.fromJson(totalPocket.first.toJson());

        return true;
      }

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

  Future<bool> fetchTotalLandlord() async {
    try {
      final totalPocket =
          await _pocketBaseService.pb.collection(pbLandlord).getFullList(
        headers: {
          'Authorization': _authenticationService.userData.token!,
        },
      );

      if (totalPocket.isNotEmpty) {
        _landlordList.value = List.from(totalPocket
            .map<LandlordModel>((e) => LandlordModel.fromJson(e.toJson())));

        return true;
      }

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

  Future<List<LandlordModel>> searchTotalLandlord(String name) async {
    try {
      final totalPocket = await _pocketBaseService.pb
          .collection(pbLandlord)
          .getFullList(headers: {
        'Authorization': _authenticationService.userData.token!,
      }, filter: 'name ~ "$name"');

      _searchlandlordList.value = List.from(totalPocket
          .map<LandlordModel>((e) => LandlordModel.fromJson(e.toJson())));

      return _searchlandlordList.value;
    } on ClientException catch (e) {
      Fluttertoast.showToast(
          msg: e.response["message"],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      return [];
    }
  }

  Future<List<ApartmentModel>> fetchLandlordApartment(String id) async {
    try {
      final totalPocket = await _pocketBaseService.pb
          .collection(pbApartment)
          .getFullList(headers: {
        'Authorization': _authenticationService.userData.token!,
      }, filter: 'landlord_id = "$id"');

      _apartmentList.value = List.from(totalPocket
          .map<ApartmentModel>((e) => ApartmentModel.fromJson(e.toJson())));

      return _apartmentList.value;
    } on ClientException catch (e) {
      Fluttertoast.showToast(
          msg: e.response["message"],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      return [];
    }
  }

  Future<List<PropertyModel>> fetchLandlordProperty(String id) async {
    try {
      final totalPocket = await _pocketBaseService.pb
          .collection(pbProperty)
          .getFullList(headers: {
        'Authorization': _authenticationService.userData.token!,
      }, filter: 'apartment_id = "$id"', expand: "tenant");

      print(totalPocket);

      _propertyList.value = List.from(totalPocket
          .map<PropertyModel>((e) => PropertyModel.fromJson(e.toJson())));

      return _propertyList.value;
    } on ClientException catch (e) {
      Fluttertoast.showToast(
          msg: e.response["message"],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      return [];
    }
  }

  Future<bool> fetchIncrement() async {
    try {
      final incrementPocket =
          await _pocketBaseService.pb.collection(pbIncrements).getFullList(
        headers: {
          'Authorization': _authenticationService.userData.token!,
        },
      );

      if (incrementPocket.isNotEmpty) {
        _incrementModel.value =
            IncrementModel.fromJson(incrementPocket.first.toJson());
        // _incrementModel.value.id = incrementPocket.first.id;
        return true;
      }

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

  Future<bool> updateIncrement(IncrementModel incrementModel) async {
    try {
      await _pocketBaseService.pb.collection(pbIncrements).update(
        _incrementModel.value.id!,
        body: incrementModel.toJson(),
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

  Future<bool> updateProperty(
      String propertyId, PropertyModel propertyModel) async {
    try {
      await _pocketBaseService.pb.collection(pbProperty).update(
        propertyId,
        body: propertyModel.toJson(),
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

  Future<bool> fetchProperties() async {
    try {
      final propertyPocket =
          await _pocketBaseService.pb.collection(pbProperty).getFullList(
        filter: 'tenant = ""',
        expand: "landlord_id, apartment_id",
        headers: {
          'Authorization': _authenticationService.userData.token!,
        },
      );

      if (propertyPocket.isNotEmpty) {
        var landlordMap =
            propertyPocket.map((e) => e.expand["landlord_id"]!.first);

        var apartmentMap =
            propertyPocket.map((e) => e.expand["apartment_id"]!.first);

        _propertyListVacant.value = List<PropertyModel>.from(propertyPocket
            .map<PropertyModel>((e) => PropertyModel.fromJson(e.toJson())));

        _landlordListVacant.value = List.from(landlordMap
            .map<LandlordModel>((e) => LandlordModel.fromJson(e.toJson())));

        _apartmentListVacant.value = List.from(apartmentMap
            .map<ApartmentModel>((e) => ApartmentModel.fromJson(e.toJson())));

        return true;
      }

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
