import 'dart:convert';
import 'dart:math';

import 'package:aisu_realestate/app/app.bottomsheets.dart';
import 'package:aisu_realestate/app/app.locator.dart';
import 'package:aisu_realestate/app/app.router.dart';
import 'package:aisu_realestate/app/app_exports.dart';
import 'package:aisu_realestate/models/apartment_model.dart';
import 'package:aisu_realestate/models/app_id_model.dart';
import 'package:aisu_realestate/models/document_model.dart';
import 'package:aisu_realestate/models/landlord_model.dart';
import 'package:aisu_realestate/models/payment_model.dart';
import 'package:aisu_realestate/models/property_model.dart';
import 'package:aisu_realestate/models/tenant_model.dart';
import 'package:aisu_realestate/services/listing_service.dart';
import 'package:aisu_realestate/services/payment_service.dart';
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
  final _paymentService = locator<PaymentService>();

  IncrementModel get appIdData => _listingService.incrementModel;

  List<TenantModel> get tenantList => _tenantService.tenantList;

  StatusEnum _status = StatusEnum.idle;
  StatusEnum get status => _status;

  DateTime? _selectedDate = DateTime.now();

  final formKeys = {
    0: GlobalKey<FormState>(),
    1: GlobalKey<FormState>(),
    2: GlobalKey<FormState>(),
  };

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

  final TenantModel _tenantPayload = TenantModel();
  TenantModel get tenantPayload => _tenantPayload;

  PropertyModel _selectedProperty = defaultProperty;
  PropertyModel get selectedProperty => _selectedProperty;

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  PageController _pageController = PageController();
  PageController get pageController => _pageController;

  final List<DocumentModel> _documentsList = [];
  List<DocumentModel> get documentsList => _documentsList;

  int _documentId = 1;

  initTenantView() {
    fetchTenant();
  }

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
    if (_currentIndex == 0) {
      if (formKeys[_currentIndex]!.currentState!.validate()) {
        String tenantId = generateRandomId();

        _tenantPayload.id = tenantId;

        _currentIndex++;

        _pageController.animateToPage(_currentIndex,
            duration: const Duration(microseconds: 400), curve: Curves.easeIn);
      }
    } else if (_currentIndex == 1) {
      if (_selectedProperty.id != "") {
        _currentIndex++;
        _pageController.animateToPage(_currentIndex,
            duration: const Duration(microseconds: 400), curve: Curves.easeIn);
      }
    } else {
      saveTenant();
    }

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

  onChangedTenant(String value, String key) {
    switch (key) {
      case "name":
        _tenantPayload.name = value;
        break;
      case "phone":
        _tenantPayload.phone = value;
        break;
      case "email":
        _tenantPayload.email = value;
        break;
      case "id_number":
        _tenantPayload.idNumber = value;
        break;
      case "rent":
        _tenantPayload.rentPayment = int.parse(value);
        break;
      case "date":
        _tenantPayload.lastPayment = DateTime.parse(value);
        notifyListeners();

        break;
      default:
    }
    notifyListeners();
  }

  saveTenant() async {
    setStatus(StatusEnum.busy);
    await _listingService.fetchIncrement();

    String tenantId = generateRandomId();

    String tenantNumber = "";

    List splitLandlord = appIdData.tenantNumber!.split("-");
    int newLandlordId = int.parse(splitLandlord.last) + 1;

    tenantNumber =
        "TE-${newLandlordId.toString().padLeft(splitLandlord.last.length, "0")}";

    TenantModel tenantModel = TenantModel(
      name: _tenantPayload.name,
      email: _tenantPayload.email,
      deposit: _selectedProperty.deposit,
      depositPaid: false,
      idNumber: _tenantPayload.idNumber,
      phone: _tenantPayload.phone,
      rentPayment: _tenantPayload.rentPayment,
      id: tenantId,
      tenantNumber: tenantNumber,
      landlord: _selectedLandlord.id,
      property: _selectedProperty.id,
      balancePayment: 0,
      // lastPayment: _tenantPayload.lastPayment,
      pendingPayment: (_tenantPayload.rentPayment! * _selectedProperty.deposit),
    );

    bool tenantAdded = await _tenantService.addTenant(tenantModel);

    if (tenantAdded) {
      IncrementModel incrementModelUpdate = appIdData;
      incrementModelUpdate.tenantNumber = tenantNumber;
      await _listingService.updateIncrement(incrementModelUpdate);

      _selectedProperty.tenantId = tenantId;

      await _listingService.updateProperty(
          _selectedProperty.id, _selectedProperty);

      await Future.delayed(const Duration(seconds: 2)).whenComplete(() {
        ScaffoldMessenger.of(StackedService.navigatorKey!.currentContext!)
            .showSnackBar(
          SnackBar(
            content:
                ManropeText.medium("Tenant Added Successful", 14, kcWhiteColor),
            duration: const Duration(seconds: 2),
            backgroundColor: kcGreenColor,
          ),
        );
        setPaymentsFunc(tenantId);
        fetchTenant();

        _listingService.fetchTotalCount();

        _navigationService.back();
      });
      setStatus(StatusEnum.idle);
    }
  }

  setPaymentsFunc(tenantId) async {
    //add deposit payment
    PaymentModel deposit = PaymentModel(
        tenantId: tenantId,
        amount: _tenantPayload.rentPayment! * _selectedProperty.deposit,
        landlordId: _selectedLandlord.id,
        propertyId: _selectedProperty.id,
        isPending: true,
        type: "Deposit");

    await _paymentService.addPayment(deposit);
    PaymentModel rent = PaymentModel(
        tenantId: tenantId,
        amount: _tenantPayload.rentPayment!,
        landlordId: _selectedLandlord.id,
        propertyId: _selectedProperty.id,
        isPending: true,
        type: "Rent");
    _paymentService.addPayment(rent);

    //add rent payment
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
    onChangedTenant(value.monthlyRent.toString(), 'rent');
    onChangedTenant(DateTime.now().toIso8601String(), 'date');
    notifyListeners();
  }

  setStatus(StatusEnum value) {
    _status = value;
    notifyListeners();
  }

  Future<DateTime?> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2101),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: kcPrimaryColor, // header background color
                onPrimary: kcWhiteColor, // header text color
                onSurface: kcBlackColor, // body text color
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor: kcBlackColor, // button text color
                ),
              ),
            ),
            child: child!,
          );
        });

    if (picked != null) {
      _selectedDate = picked;
    }
    notifyListeners();
    return picked;
  }

  @override
  List<ListenableServiceMixin> get listenableServices =>
      [_listingService, _tenantService];
}
