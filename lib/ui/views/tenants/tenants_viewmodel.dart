import 'package:aisu_realestate/app/app.bottomsheets.dart';
import 'package:aisu_realestate/app/app.locator.dart';
import 'package:aisu_realestate/app/app.router.dart';
import 'package:aisu_realestate/models/document_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class TenantsViewModel extends ReactiveViewModel {
  final _navigationService = locator<NavigationService>();
  final _bottomSheetService = locator<BottomSheetService>();

  List<String> pageTitles = [
    "Tenant Details",
    "Property Details",
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

  String _selectedLandlord = "";
  String get selectedLandlord => _selectedLandlord;

  String _selectedApartment = "";
  String get selectedApartment => _selectedApartment;

  String _selectedFlat = "";
  String get selectedFlat => _selectedFlat;

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  PageController _pageController = PageController();
  PageController get pageController => _pageController;

  final List<DocumentModel> _documentsList = [];
  List<DocumentModel> get documentsList => _documentsList;

  int _documentId = 1;

  initAddListing() {
    _pageController = PageController(initialPage: 0);
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

  setSelectedLandlord(String value) {
    _selectedLandlord = value;
    _selectedApartment = "";
    _selectedFlat = "";
    notifyListeners();
  }

  setSelectedApartment(String value) {
    _selectedApartment = value;
    _selectedFlat = "";
    notifyListeners();
  }

  setSelectedFlat(String value) {
    _selectedFlat = value;
    notifyListeners();
  }
}
