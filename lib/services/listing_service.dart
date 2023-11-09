import 'dart:convert';

import 'package:aisu_realestate/models/apartment_model.dart';
import 'package:aisu_realestate/models/app_id_model.dart';
import 'package:aisu_realestate/models/landlord_model.dart';
import 'package:aisu_realestate/models/property_model.dart';
import 'package:aisu_realestate/services/dio_client.dart';
import 'package:aisu_realestate/ui/common/api.url.dart';
import 'package:aisu_realestate/utils/env.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:stacked/stacked.dart';

class ListingService with ListenableServiceMixin {
  // final _mainService = locator<MainService>();

  ListingService() {
    listenToReactiveValues([
      _newApartmentList,
      _apartmentList,
      _appIdData,
      _newPropertyList,
      _propertyList,
      _landlordList,
      // _events,
      // _explore,
    ]);
  }

  final ReactiveValue<List<ApartmentModel>> _newApartmentList =
      ReactiveValue<List<ApartmentModel>>([]);
  List<ApartmentModel> get newApartmentList => _newApartmentList.value;

  final ReactiveValue<List<ApartmentModel>> _apartmentList =
      ReactiveValue<List<ApartmentModel>>([
    ApartmentModel(
      id: "111",
      name: "Likoni Towers",
      city: "Mombasa",
      area: "Kizingo",
      street: "Nyerere Avenue",
      landlordId: "001",
      apartmentNumber: "AP-001",
    ),
    ApartmentModel(
      id: "112",
      name: "Mtaani Towers",
      city: "Mombasa",
      area: "Kizingo",
      street: "Nyerere Avenue",
      landlordId: "001",
      apartmentNumber: "AP-002",
    ),
    ApartmentModel(
      id: "113",
      name: "Majengo Estate",
      city: "Mombasa",
      area: "Majengo",
      street: "Nyerere Avenue",
      landlordId: "002",
      apartmentNumber: "AP-003",
    ),
    ApartmentModel(
      id: "114",
      name: "Mtwapa Villas",
      city: "Mombasa",
      area: "Mtwapa",
      street: "Mtwapa Avenue",
      landlordId: "003",
      apartmentNumber: "AP-004",
    ),
  ]);
  List<ApartmentModel> get apartmentList => _apartmentList.value;

  final ReactiveValue<List<PropertyModel>> _propertyList =
      ReactiveValue<List<PropertyModel>>([
    PropertyModel(
      id: "222",
      propertyNumber: "PR-001",
      floor: "1",
      flat: "A1",
      room: "2",
      bath: "2",
      description:
          "Laboris do ullamco do pariatur voluptate aliquip excepteur officia.",
      landlordId: "001",
      apartmentId: "111",
      monthlyRent: 20000,
      deposit: 1,
    ),
    PropertyModel(
      id: "223",
      propertyNumber: "PR-002",
      floor: "1",
      flat: "B1",
      room: "2",
      bath: "2",
      description:
          "Laboris do ullamco do pariatur voluptate aliquip excepteur officia.",
      landlordId: "001",
      apartmentId: "111",
      monthlyRent: 20000,
      deposit: 1,
    ),
    PropertyModel(
      id: "224",
      propertyNumber: "PR-003",
      floor: "1",
      flat: "C2",
      room: "2",
      bath: "2",
      description:
          "Laboris do ullamco do pariatur voluptate aliquip excepteur officia.",
      landlordId: "001",
      apartmentId: "112",
      monthlyRent: 30000,
      deposit: 2,
    ),
    PropertyModel(
      id: "225",
      propertyNumber: "PR-004",
      floor: "1",
      flat: "A4",
      room: "2",
      bath: "2",
      description:
          "Laboris do ullamco do pariatur voluptate aliquip excepteur officia.",
      landlordId: "001",
      apartmentId: "112",
      monthlyRent: 32000,
      deposit: 2,
    ),
    PropertyModel(
      id: "226",
      propertyNumber: "PR-005",
      floor: "1",
      flat: "B1",
      room: "2",
      bath: "2",
      description:
          "Laboris do ullamco do pariatur voluptate aliquip excepteur officia.",
      landlordId: "001",
      apartmentId: "112",
      monthlyRent: 44000,
      deposit: 1,
    ),
    PropertyModel(
      id: "226",
      propertyNumber: "PR-005",
      floor: "1",
      flat: "B1",
      room: "2",
      bath: "2",
      description:
          "Laboris do ullamco do pariatur voluptate aliquip excepteur officia.",
      landlordId: "001",
      apartmentId: "112",
      monthlyRent: 44000,
      deposit: 1,
    ),
    PropertyModel(
      id: "227",
      propertyNumber: "PR-006",
      floor: "1",
      flat: "A7",
      room: "2",
      bath: "2",
      description:
          "Laboris do ullamco do pariatur voluptate aliquip excepteur officia.",
      landlordId: "002",
      apartmentId: "113",
      monthlyRent: 44000,
      deposit: 1,
    ),
  ]);
  List<PropertyModel> get propertyList => _propertyList.value;

  final ReactiveValue<List<PropertyModel>> _newPropertyList =
      ReactiveValue<List<PropertyModel>>([]);
  List<PropertyModel> get newPropertyList => _newPropertyList.value;

  final ReactiveValue<AppIdModel> _appIdData =
      ReactiveValue<AppIdModel>(defaultAppIdModel);
  AppIdModel get appIdData => _appIdData.value;

  final ReactiveValue<List<LandlordModel>> _landlordList =
      ReactiveValue<List<LandlordModel>>([
    LandlordModel(
        id: "001",
        landlordNumber: "LD-001",
        name: "Aidarus Badawy",
        phone: "0101010101",
        email: "aidarus@email.com",
        idNumber: "11111"),
    LandlordModel(
        id: "002",
        landlordNumber: "LD-002",
        name: "Swaleh Alwy",
        phone: "0101010101",
        email: "aidarus@email.com",
        idNumber: "11111"),
    LandlordModel(
        id: "003",
        landlordNumber: "LD-003",
        name: "Abdallah  Athman",
        phone: "0101010101",
        email: "abdallah@email.com",
        idNumber: "11111"),
  ]);
  List<LandlordModel> get landlordList => _landlordList.value;

  // final ReactiveValue<CountryExploreModel> _explore =
  //     ReactiveValue<CountryExploreModel>(defaultExplore());
  // CountryExploreModel get explore => _explore.value;

  // final ReactiveValue<CountryEventsModel> _loadedevents =
  //     ReactiveValue<CountryEventsModel>(defaultEvent());
  // CountryEventsModel get loadedevents => _loadedevents.value;

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

  Future<bool> fetchAppID() async {
    try {
      _dio = await DioClient().publicDio();
      final response = await _dio.get(
        "${env!.baseUrl}${RealEstateUrls.appId}",
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> data = response.data;

        debugPrint(data.toString());

        _appIdData.value = AppIdModel.fromJson(data);

        // _countryList.value =
        //     List.from(data.map<CountryModel>((e) => CountryModel.fromJson(e)));
        return true;
      }
    } on DioException catch (exception) {
      _errorMessage = exception.message.toString();
      Fluttertoast.showToast(
          msg: _errorMessage,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }

    return false;
  }

  Future<bool> updateAppID(Map data) async {
    try {
      _dio = await DioClient().publicDio();
      final response = await _dio.put(
        "${env!.baseUrl}${RealEstateUrls.updateSingleId}${_appIdData.value.id}",
        data: jsonEncode(data),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> data = response.data;

        debugPrint(data.toString());

        _appIdData.value = AppIdModel.fromJson(data);

        // _countryList.value =
        //     List.from(data.map<CountryModel>((e) => CountryModel.fromJson(e)));
        return true;
      }
    } on DioException catch (exception) {
      _errorMessage = exception.message.toString();
      Fluttertoast.showToast(
          msg: _errorMessage,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }

    return false;
  }

  Future<bool> getListings() async {
    try {
      _dio = await DioClient().publicDio();
      final response = await _dio.get(
        "${env!.baseUrl}${RealEstateUrls.landlord}",
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );
      if (response.statusCode == 200) {
        List data = response.data;

        debugPrint(data.toString());

        // _countryList.value =
        //     List.from(data.map<CountryModel>((e) => CountryModel.fromJson(e)));
        return true;
      }
    } on DioException catch (exception) {
      _errorMessage = exception.message.toString();
      Fluttertoast.showToast(
          msg: _errorMessage,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }

    return false;
  }

  Future<bool> addLandlord(LandlordModel landlordModel) async {
    try {
      _dio = await DioClient().publicDio();
      final response = await _dio.post(
        "${env!.baseUrl}${RealEstateUrls.addLandlord}",
        data: landlordModel.toJson(),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> data = response.data;

        debugPrint(data.toString());

        // _countryList.value =
        //     List.from(data.map<CountryModel>((e) => CountryModel.fromJson(e)));
        return true;
      }
    } on DioException catch (exception) {
      _errorMessage = exception.message.toString();
      Fluttertoast.showToast(
          msg: _errorMessage,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }

    return false;
  }

  Future<bool> addApartment(ApartmentModel apartmentModel) async {
    try {
      _dio = await DioClient().publicDio();
      final response = await _dio.post(
        "${env!.baseUrl}${RealEstateUrls.addApartment}",
        data: apartmentModel.toJson(),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> data = response.data;

        debugPrint(data.toString());

        // _countryList.value =
        //     List.from(data.map<CountryModel>((e) => CountryModel.fromJson(e)));
        return true;
      }
    } on DioException catch (exception) {
      _errorMessage = exception.message.toString();
      Fluttertoast.showToast(
          msg: _errorMessage,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }

    return false;
  }

  Future<bool> addProperty(PropertyModel propertyModel) async {
    try {
      _dio = await DioClient().publicDio();
      final response = await _dio.post(
        "${env!.baseUrl}${RealEstateUrls.addProperty}",
        data: propertyModel.toJson(),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> data = response.data;

        debugPrint(data.toString());

        // _countryList.value =
        //     List.from(data.map<CountryModel>((e) => CountryModel.fromJson(e)));
        return true;
      }
    } on DioException catch (exception) {
      _errorMessage = exception.message.toString();
      Fluttertoast.showToast(
          msg: _errorMessage,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }

    return false;
  }

  // Future<bool> getEvents() async {
  //   try {
  //     _dio = await DioClient().publicDio();
  //     final response = await _dio.get(
  //       "${env!.baseUrl}${CountryUrls.events}${country.id}",
  //       options: Options(
  //         headers: {
  //           'Content-Type': 'application/json',
  //         },
  //       ),
  //     );
  //     if (response.statusCode == 200) {
  //       Map<String, dynamic> data = response.data;

  //       _events.value = CountryEventsModel.fromJson(data);
  //       _loadedevents.value = CountryEventsModel.fromJson(data);
  //       return true;
  //     }
  //   } on DioException catch (exception) {
  //     _errorMessage = exception.response!.statusMessage.toString();
  //     Fluttertoast.showToast(
  //         msg: _errorMessage,
  //         toastLength: Toast.LENGTH_SHORT,
  //         gravity: ToastGravity.CENTER,
  //         timeInSecForIosWeb: 1,
  //         backgroundColor: Colors.red,
  //         textColor: Colors.white,
  //         fontSize: 16.0);
  //   }

  //   // throw exception;
  //   return false;

  //   // ShowToast().cancelToast(context, title: _errorMessage!);

  //   // print('$_errorMessage deleteSelectedFood');
  //   // FreelanceAlert().alert(
  //   //   context,
  //   //   title: str_error_occured,
  //   //   body: _errorMessage!,
  //   //   buttonTitle: str_okay,
  //   // );
  //   // return false;
  // }

  // Future<bool> getExplore() async {
  //   _explore.value.explore = [];
  //   try {
  //     _dio = await DioClient().publicDio();
  //     final response = await _dio.get(
  //       "${env!.baseUrl}${CountryUrls.explore}${country.id}",
  //       options: Options(
  //         headers: {
  //           'Content-Type': 'application/json',
  //         },
  //       ),
  //     );
  //     if (response.statusCode == 200) {
  //       Map<String, dynamic> data = response.data;

  //       _explore.value = CountryExploreModel.fromJson(data);
  //       notifyListeners();
  //       return true;
  //     }
  //   } on DioException catch (exception) {
  //     _errorMessage = exception.response!.statusMessage.toString();
  //     Fluttertoast.showToast(
  //         msg: _errorMessage,
  //         toastLength: Toast.LENGTH_SHORT,
  //         gravity: ToastGravity.CENTER,
  //         timeInSecForIosWeb: 1,
  //         backgroundColor: Colors.red,
  //         textColor: Colors.white,
  //         fontSize: 16.0);
  //   }

  //   // throw exception;
  //   return false;

  //   // ShowToast().cancelToast(context, title: _errorMessage!);

  //   // print('$_errorMessage deleteSelectedFood');
  //   // FreelanceAlert().alert(
  //   //   context,
  //   //   title: str_error_occured,
  //   //   body: _errorMessage!,
  //   //   buttonTitle: str_okay,
  //   // );
  //   // return false;
  // }
}
