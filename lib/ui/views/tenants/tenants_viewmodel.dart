import 'dart:convert';
import 'dart:math';

import 'package:aisu_realestate/app/app.bottomsheets.dart';
import 'package:aisu_realestate/app/app.locator.dart';
import 'package:aisu_realestate/app/app.router.dart';
import 'package:aisu_realestate/models/apartment_model.dart';
import 'package:aisu_realestate/models/app_id_model.dart';
import 'package:aisu_realestate/models/document_model.dart';
import 'package:aisu_realestate/models/landlord_model.dart';
import 'package:aisu_realestate/models/property_model.dart';
import 'package:aisu_realestate/models/tenant_model.dart';
import 'package:aisu_realestate/services/listing_service.dart';
import 'package:aisu_realestate/services/tenant_service.dart';
import 'package:aisu_realestate/ui/common/enums.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class TenantsViewModel extends ReactiveViewModel {
  final _navigationService = locator<NavigationService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _listingService = locator<ListingService>();
  final _tenantService = locator<TenantService>();

  IncrementModel get appIdData => _listingService.incrementModel;

  StatusEnum _status = StatusEnum.idle;
  StatusEnum get status => _status;

  List<String> pageTitles = [
    "Tenant Details",
    "Property Details",
    "Payment Details",
  ];

  List<String> landlords = [
    "Aidarus Badawy",
    "Swaleh Alwy",
  ];

  List<String> apartment = [
    "Likoni Towers",
    "Burj Khalifa",
  ];

  List<String> flats = [
    "A1",
    "B2",
    "C1",
  ];

  LandlordModel _selectedLandlord = defaultLanlord;
  LandlordModel get selectedLandlord => _selectedLandlord;

  ApartmentModel _selectedApartment = defaultApartmentModel;
  ApartmentModel get selectedApartment => _selectedApartment;

  PropertyModel _selectedProperty = defaultProperty;
  PropertyModel get selectedProperty => _selectedProperty;

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  PageController _pageController = PageController();
  PageController get pageController => _pageController;

  final List<DocumentModel> _documentsList = [];
  List<DocumentModel> get documentsList => _documentsList;

  int _documentId = 1;

  initAddListing() {
    _pageController = PageController(initialPage: 0);
    fetchVacantProperties();
  }

  fetchVacantProperties() {
    _listingService.fetchProperties();
  }

  fetchTenant() async {
    setStatus(StatusEnum.busy);
    await _tenantService.fetchTotalTenant();
    setStatus(StatusEnum.idle);
  }

  List<LandlordModel> get landlordListVacantSorted {
    Map<String, LandlordModel> uniqueLandlordsMap = {};

    for (var landlord in _listingService.landlordListVacant) {
      uniqueLandlordsMap[landlord.id] = landlord;
    }

    List<LandlordModel> uniqueLandlords = uniqueLandlordsMap.values.toList();

    return uniqueLandlords;
  }

  List<ApartmentModel> get apartmentListVacantByLandlordId {
    Set<String> uniqueApartmentIds = <String>{};

    Map<String, ApartmentModel> uniqueApartmentsMap = {};

    for (var apartment in _listingService.apartmentListVacant) {
      if (apartment.landlordId == _selectedLandlord.id &&
          !uniqueApartmentIds.contains(apartment.id)) {
        uniqueApartmentIds.add(apartment.id);
        uniqueApartmentsMap[apartment.id] = apartment;
      }
    }

    List<ApartmentModel> filteredApartments =
        uniqueApartmentsMap.values.toList();

    return filteredApartments;
  }

  List<PropertyModel> get propertyListForSelectedApartment {
    // Filtering the list based on the selected apartment ID
    List<PropertyModel> filteredProperties = _listingService.propertyListVacant
        .where((property) => property.apartmentId == _selectedApartment.id)
        .toList();

    return filteredProperties;
  }

  navigateToAddListing() {
    _navigationService.navigateToAddTenantsView();
  }

  goToNext() {
    if (_currentIndex < pageTitles.length - 1) {
      _currentIndex++;

      _pageController.animateToPage(_currentIndex,
          duration: const Duration(microseconds: 400), curve: Curves.easeIn);
    } else {}

    notifyListeners();
  }

  goBack() {
    if (_currentIndex != 0) {
      _currentIndex--;

      _pageController.animateToPage(_currentIndex,
          duration: const Duration(microseconds: 400), curve: Curves.easeIn);
    } else {
      _navigationService.back();
    }

    notifyListeners();
  }

  setCurrentIndex(index) {
    _currentIndex = index;
    notifyListeners();
  }

  pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'png', 'jpeg'],
      allowMultiple: false,
    );

    if (result != null) {
      PlatformFile file = result.files.first;

      _documentId = _documentsList.length + 1;

      DocumentModel data = DocumentModel(
          name: file.name,
          path: file.path!,
          id: _documentId,
          extension: file.extension!);

      _documentsList.add(data);
      notifyListeners();
    }
  }

  saveTenant(name, email, phone, idNumber) async {
    // if (tenantKey.currentState!.validate()) {
    setStatus(StatusEnum.busy);
    await _listingService.fetchIncrement();

    String tenantId = generateRandomId();

    String tenantNumber = "";

    List splitLandlord = appIdData.tenantNumber!.split("-");
    int newLandlordId = int.parse(splitLandlord.last) + 1;

    tenantNumber =
        "TE-${newLandlordId.toString().padLeft(splitLandlord.last.length, "0")}";

    TenantModel tenantModel = TenantModel(
      name: name,
      email: email,
      idNumber: idNumber,
      phone: phone,
      id: tenantId,
      tenantNumber: tenantNumber,
      landlord: _selectedLandlord.id,
      property: _selectedProperty.id,
      balancePayment: 0,
      // lastPayment: _selectedDate,
      pendingPayment:
          (_selectedProperty.monthlyRent * _selectedProperty.deposit),
    );

    bool tenantAdded = await _tenantService.addTenant(tenantModel);

    if (tenantAdded) {
      IncrementModel incrementModelUpdate = appIdData;
      incrementModelUpdate.tenantNumber = tenantNumber;
      await _listingService.updateIncrement(incrementModelUpdate);

      PropertyModel? propertyModel = _selectedProperty;
      propertyModel.tenantId = tenantId;

      await _listingService.updateProperty(propertyModel.id, propertyModel);

      await Future.delayed(const Duration(seconds: 2)).whenComplete(() {
        fetchTenant();
      });
      setStatus(StatusEnum.idle);
    }
  }

  String generateRandomId() {
    var random = Random.secure();
    var values = List<int>.generate(16, (i) => random.nextInt(256));
    var id = base64Url.encode(values);
    return id.substring(0, 15); // Adjust the length as needed
  }

  deleteDocument(int id) {
    _documentsList.removeWhere((element) => element.id == id);
    _documentId = _documentId - 1;
    notifyListeners();
  }

  void showBottomSheet(DocumentModel document) {
    _bottomSheetService.showCustomSheet(
        variant: BottomSheetType.document,
        title: document.name,
        data: document,
        enableDrag: false);
  }

  setSelectedLandlord(LandlordModel value) {
    _selectedLandlord = value;
    _selectedApartment = defaultApartmentModel;
    _selectedProperty = defaultProperty;
    notifyListeners();
  }

  setSelectedApartment(ApartmentModel value) {
    _selectedApartment = value;
    _selectedProperty = defaultProperty;
    notifyListeners();
  }

  setSelectedFlat(PropertyModel value) {
    _selectedProperty = value;
    notifyListeners();
  }

  setStatus(StatusEnum value) {
    _status = value;
    notifyListeners();
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_listingService];
}
