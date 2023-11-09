import 'package:aisu_realestate/app/app.bottomsheets.dart';
import 'package:aisu_realestate/app/app.locator.dart';
import 'package:aisu_realestate/app/app.router.dart';
import 'package:aisu_realestate/models/apartment_model.dart';
import 'package:aisu_realestate/models/app_id_model.dart';
import 'package:aisu_realestate/models/document_model.dart';
import 'package:aisu_realestate/models/landlord_model.dart';
import 'package:aisu_realestate/models/property_model.dart';
import 'package:aisu_realestate/services/listing_service.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:objectid/objectid.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ListingsViewModel extends ReactiveViewModel {
  final _navigationService = locator<NavigationService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _listingService = locator<ListingService>();

  AppIdModel get appIdData => _listingService.appIdData;

  final LandlordModel _landlordModel = LandlordModel(
      id: "", landlordNumber: "", name: "", phone: "", email: "", idNumber: "");

  LandlordModel get landlordModel => _landlordModel;

  List<ApartmentModel> get newApartmentList => _listingService.newApartmentList;
  List<PropertyModel> get newPropertyList => _listingService.newPropertyList;

  final ApartmentModel _apartmentModel = defaultApartmentModel;
  ApartmentModel get apartmentModel => _apartmentModel;

  List<String> pageTitles = [
    "Add Landlord",
    "Add Apartment",
    "Add Property",
  ];

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  PageController _pageController = PageController();
  PageController get pageController => _pageController;

  // ApartmentControllers
  TextEditingController apartmentNameController = TextEditingController();
  TextEditingController apartmentAreaController = TextEditingController();
  TextEditingController apartmentStreetController = TextEditingController();

  // PropertyControllers
  TextEditingController propertyFloorController = TextEditingController();
  TextEditingController propertyFlatController = TextEditingController();
  TextEditingController propertyDescriptionController = TextEditingController();
  TextEditingController propertyRentController = TextEditingController();

  final List<DocumentModel> _documentsList = [];
  List<DocumentModel> get documentsList => _documentsList;

  String _selectedCity = "";
  String get selectedCity => _selectedCity;

  String _selectedRoom = "";
  String get selectedRoom => _selectedRoom;

  String _selectedBath = "";
  String get selectedBath => _selectedBath;

  String _selectedDeposit = "";
  String get selectedDeposit => _selectedDeposit;

  ApartmentModel _selectedApartment = defaultApartmentModel;
  ApartmentModel get selectedApartment => _selectedApartment;

  final formKeys = {
    0: GlobalKey<FormState>(),
    1: GlobalKey<FormState>(),
    2: GlobalKey<FormState>(),
  };

  List<String> city = [
    "Mombasa",
    "Malindi",
    "Kilifi",
    "Nairobi",
    "Machakos",
    "Kisumu",
  ];

  List<String> rooms = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
  ];

  List<String> depositData = [
    "1 X Monthly Rent",
    "2 X Monthly Rent",
    "3 X Monthly Rent",
  ];

  int _documentId = 1;

  String _currentApartmentId = "";
  String get currentApartmentId => _currentApartmentId;

  String _currentPropertyId = "";
  String get currentPropertyId => _currentPropertyId;

  String _currentLandlordId = "";
  String get currentLandlordId => _currentLandlordId;

  bool _animate = false;
  bool get animate => _animate;

  String _selectedId = "";
  String get selectedId => _selectedId;

  initListing() {
    fetchListing();
  }

  fetchListing() {
    _listingService.getListings();
  }

  // updateAppId() {
  //   Map data = {"landlord_number": "LD-0006"};
  //   _listingService.updateAppID(data);
  // }

  initAddListing() {
    _pageController = PageController(initialPage: 0);
    final id = ObjectId(); // That's all 🔥😮!
    _landlordModel.id = id.hexString;

    _currentApartmentId = appIdData.apartmentNumber;
    _currentPropertyId = appIdData.propertyNumber;
    _currentLandlordId = appIdData.landlordNumber;

    notifyListeners();
  }

  postLandlord() {
    _listingService.addLandlord(landlordModel);
  }

  postApartment(ApartmentModel apartmentModel) {
    _listingService.addApartment(apartmentModel);
  }

  postProperty(PropertyModel propertyModel) {
    _listingService.addProperty(propertyModel);
  }

  navigateToAddListing() {
    _navigationService.navigateToAddListingsView();
  }

  updateLandlordDetails(String value, String key) {
    switch (key) {
      case "name":
        _landlordModel.name = value;

        break;
      case "phone":
        _landlordModel.phone = value;

        break;
      case "email":
        _landlordModel.email = value;

        break;
      case "id_number":
        _landlordModel.idNumber = value;

        break;
      default:
    }
    notifyListeners();
  }

  addApartment() {
    if (formKeys[_currentIndex]!.currentState!.validate()) {
      saveApartment();
    }

    notifyListeners();

    // return null;
  }

  saveApartment() {
    final id = ObjectId(); // That's all 🔥😮!

    ApartmentModel newApartment = ApartmentModel(
        id: id.hexString,
        name: apartmentNameController.text,
        city: _selectedCity,
        area: apartmentAreaController.text,
        street: apartmentStreetController.text,
        landlordId: _landlordModel.id,
        apartmentNumber: _currentApartmentId);

    if (apartmentNameController.text.isNotEmpty &&
        apartmentAreaController.text.isNotEmpty &&
        apartmentStreetController.text.isNotEmpty &&
        _selectedCity != "") {
      _listingService.addNewApartment(newApartment);

      String newApartId = _currentApartmentId;

      List split = newApartmentList.last.apartmentNumber.split("-");
      int newId = int.parse(split.last) + 1;

      newApartId = "AP-${newId.toString().padLeft(split.last.length, "0")}";

      _currentApartmentId = newApartId;
    }

    apartmentNameController.clear();
    apartmentAreaController.clear();
    apartmentStreetController.clear();
    setSelectedCity("");

    notifyListeners();
  }

  deleteApartment(String id) {
    _listingService.deleteApartment(id);
  }

  saveProperty() {
    // if (isAdding) {
    if (formKeys[_currentIndex]!.currentState!.validate()) {
      PropertyModel propertyModel = PropertyModel(
        id: "",
        propertyNumber: _currentPropertyId,
        floor: propertyFloorController.text,
        flat: propertyFlatController.text,
        room: _selectedRoom,
        bath: _selectedBath,
        description: propertyDescriptionController.text,
        landlordId: _landlordModel.id,
        apartmentId: _selectedApartment.id,
        monthlyRent: int.parse(propertyRentController.text),
        deposit: int.parse(_selectedDeposit.split(" X ").first),
      );

      _listingService.addNewProperty(propertyModel);

      propertyFloorController.clear();
      propertyFlatController.clear();
      propertyDescriptionController.clear();
      propertyRentController.clear();
      _selectedRoom = "";
      _selectedBath = "";
      _selectedDeposit = "";

      String newPropId = _currentPropertyId;

      List split = newPropertyList.last.propertyNumber.split("-");
      int newId = int.parse(split.last) + 1;

      newPropId = "PR-${newId.toString().padLeft(split.last.length, "0")}";

      _currentPropertyId = newPropId;
    }

    notifyListeners();
  }

  setCurrentIndex(index) {
    _currentIndex = index;
    notifyListeners();
  }

  goBack() {
    if (_currentIndex != 0) {
      _currentIndex--;

      _pageController.animateToPage(_currentIndex,
          duration: const Duration(microseconds: 400), curve: Curves.easeIn);
    } else {
      _navigationService.back();
      _listingService.clearApartment();
      _listingService.clearProperty();
    }

    notifyListeners();
  }

  goToNext() {
    print(_currentIndex);
    if (_currentIndex == 0) {
      if (formKeys[_currentIndex]!.currentState!.validate()) {
        _landlordModel.landlordNumber = _currentLandlordId;
        _currentIndex++;

        _pageController.animateToPage(_currentIndex,
            duration: const Duration(microseconds: 400), curve: Curves.easeIn);
      }
      // postLandlord();
    } else if (_currentIndex == 1) {
      if (formKeys[_currentIndex]!.currentState!.validate() ||
          newApartmentList.isNotEmpty) {
        saveApartment();
        _currentIndex++;

        _pageController.animateToPage(_currentIndex,
            duration: const Duration(microseconds: 400), curve: Curves.easeIn);
      }
    }
    // formKeys[_currentIndex]!.currentState!.save();

    // if (_currentIndex < pageTitles.length - 1) {
    //   _currentIndex++;

    //   _pageController.animateToPage(_currentIndex,
    //       duration: const Duration(microseconds: 400), curve: Curves.easeIn);
    // }

    notifyListeners();
  }

  uploadNewListing() {}

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

  setSelectedCity(String value) {
    _selectedCity = value;
    notifyListeners();
  }

  setSelectedRoom(String value) {
    _selectedRoom = value;

    notifyListeners();
  }

  setSelectedBath(String value) {
    _selectedBath = value;
    notifyListeners();
  }

  setSelectedDeposit(String value) {
    _selectedDeposit = value;
    notifyListeners();
  }

  setSelectedApartment(ApartmentModel value) {
    _selectedApartment = value;

    notifyListeners();
  }

  setAnimate() {
    _animate = !_animate;
    notifyListeners();
  }

  setSelectedId(value) {
    _selectedId = value;
    notifyListeners();
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_listingService];
}
