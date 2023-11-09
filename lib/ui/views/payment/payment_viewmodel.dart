import 'package:aisu_realestate/app/app.locator.dart';
import 'package:aisu_realestate/app/app.router.dart';
import 'package:aisu_realestate/models/apartment_model.dart';
import 'package:aisu_realestate/models/landlord_model.dart';
import 'package:aisu_realestate/models/payment_model.dart';
import 'package:aisu_realestate/models/property_model.dart';
import 'package:aisu_realestate/services/listing_service.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PaymentViewModel extends ReactiveViewModel {
  final _navigationService = locator<NavigationService>();
  final _listingService = locator<ListingService>();

  List<LandlordModel> get placeList => _listingService.landlordList;
  List<ApartmentModel> get apartmentList => _listingService.apartmentList;
  List<PropertyModel> get propertyList => _listingService.propertyList;

  List<String> paymentType = [
    "Tenant Payment",
    "Landlord Payment",
  ];

  List<String> paymentCategory = [
    "Deposit",
    "Expense",
    "Rent",
  ];

  String _paymentTypeSelected = "";
  String get paymentTypeSelected => _paymentTypeSelected;

  String _paymentCategorySelected = "";
  String get paymentCategorySelected => _paymentCategorySelected;

  LandlordModel _landlordSelected = defaultLanlord;
  LandlordModel get landlordSelected => _landlordSelected;

  ApartmentModel _apartmentSelected = defaultApartmentModel;
  ApartmentModel get apartmentSelected => _apartmentSelected;

  PropertyModel _propertySelected = defaultProperty;
  PropertyModel get propertySelected => _propertySelected;

  List<PropertyModel> _propertyListData = [];
  List<PropertyModel> get propertyListData => _propertyListData;

  List<ApartmentModel> _apartmentListData = [];
  List<ApartmentModel> get apartmentListData => _apartmentListData;

  late ExpandedTileController _expandedcontroller;
  ExpandedTileController get expandedcontroller => _expandedcontroller;

  late ExpandedTileController _expandedcontrollerTwo;
  ExpandedTileController get expandedcontrollerTwo => _expandedcontrollerTwo;

  late ExpandedTileController _expandedcontrollerThree;
  ExpandedTileController get expandedcontrollerThree =>
      _expandedcontrollerThree;

  List<String> payByList = ["M-Pesa", "Bank", "Cash"];

  String _selectedPayBy = "";
  String get selectedPayBy => _selectedPayBy;

  List<PaymentModel> recentPayment = [
    PaymentModel(
      id: "1",
      invoiceNumber: "INV-0001",
      amount: 20000,
      landlordId: "1",
      apartmentId: "2",
      propertyId: "3",
      type: "Rent",
    ),
    PaymentModel(
      id: "1",
      invoiceNumber: "INV-0002",
      amount: 1500,
      landlordId: "1",
      apartmentId: "2",
      propertyId: "3",
      type: "Expense",
    ),
    PaymentModel(
      id: "1",
      amount: 40000,
      invoiceNumber: "INV-0003",
      landlordId: "1",
      apartmentId: "2",
      propertyId: "3",
      type: "Deposit",
    ),
    PaymentModel(
      id: "1",
      invoiceNumber: "INV-0004",
      amount: 23000,
      landlordId: "1",
      apartmentId: "2",
      propertyId: "3",
      type: "Rent",
    ),
    PaymentModel(
      id: "1",
      invoiceNumber: "INV-0005",
      amount: 250000,
      landlordId: "1",
      apartmentId: "2",
      propertyId: "3",
      type: "Rent",
    ),
  ];
  List<PaymentModel> pendingPayment = [
    PaymentModel(
      id: "1",
      tenantName: "Aidarus Badawy",
      amount: 10000,
      landlordId: "1",
      apartmentId: "2",
      propertyId: "3",
      type: "Rent",
    ),
    PaymentModel(
      id: "1",
      tenantName: "Swaleh Salim",
      amount: 1500,
      landlordId: "1",
      apartmentId: "2",
      propertyId: "3",
      type: "Rent",
    ),
    PaymentModel(
      id: "1",
      amount: 40000,
      tenantName: "Ali Abdallah",
      landlordId: "1",
      apartmentId: "2",
      propertyId: "3",
      type: "Deposit",
    ),
    PaymentModel(
      id: "1",
      tenantName: "Kamau Joseph",
      amount: 23000,
      landlordId: "1",
      apartmentId: "2",
      propertyId: "3",
      type: "Rent",
    ),
    PaymentModel(
      id: "1",
      tenantName: "Abdallah Swaleh",
      amount: 250000,
      landlordId: "1",
      apartmentId: "2",
      propertyId: "3",
      type: "Deposit",
    ),
  ];
  initAddPayment() {
    _expandedcontroller = ExpandedTileController(isExpanded: true);
    _expandedcontrollerTwo = ExpandedTileController(isExpanded: false);
    _expandedcontrollerThree = ExpandedTileController(isExpanded: false);

    notifyListeners();
  }

  setSelectedPaymentType(String value) {
    _paymentTypeSelected = value;
    notifyListeners();
  }

  setSelectedPaymentCategory(String value) {
    _paymentCategorySelected = value;
    notifyListeners();
  }

  updateLandlordSelected(LandlordModel landlordSearch) {
    _landlordSelected = landlordSearch;

    _apartmentSelected = defaultApartmentModel;
    _propertySelected = defaultProperty;

    _propertyListData = [];
    _apartmentListData = [];

    _apartmentListData = apartmentList
        .where((element) => element.landlordId == landlordSearch.id)
        .toList();

    notifyListeners();
  }

  setSelectApartment(ApartmentModel apartmentData) {
    _apartmentSelected = apartmentData;

    _propertySelected = defaultProperty;

    _propertyListData = propertyList
        .where((element) => element.apartmentId == apartmentData.id)
        .toList();
    notifyListeners();
  }

  setSelectProperty(PropertyModel propertyData) {
    _propertySelected = propertyData;
    _paymentCategorySelected = "";
    notifyListeners();
  }

  clearSelection() {
    _landlordSelected = defaultLanlord;
    _apartmentSelected = defaultApartmentModel;
    _propertySelected = defaultProperty;
    _apartmentListData = [];
    _propertyListData = [];

    notifyListeners();
  }

  setSelectedPayBy(String value) {
    _selectedPayBy = value;
    notifyListeners();
  }

  navigateToAddPayment() async {
    await _navigationService.navigateTo(
      Routes.addPaymentView,
      transition: TransitionsBuilders.slideLeftWithFade,
    );
  }

  List<LandlordModel> getSuggestions(String query) {
    List<LandlordModel> matches = placeList.toList();
    // matches.addAll(placeList);

    matches
        .retainWhere((s) => s.name.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_listingService];
}
