import 'package:aisu_realestate/app/app.locator.dart';
import 'package:aisu_realestate/app/app.router.dart';
import 'package:aisu_realestate/models/apartment_model.dart';
import 'package:aisu_realestate/models/landlord_model.dart';
import 'package:aisu_realestate/models/payment_model.dart';
import 'package:aisu_realestate/models/property_model.dart';
import 'package:aisu_realestate/models/tenant_model.dart';
import 'package:aisu_realestate/services/listing_service.dart';
import 'package:aisu_realestate/services/payment_service.dart';
import 'package:aisu_realestate/services/tenant_service.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PaymentViewModel extends ReactiveViewModel {
  final _navigationService = locator<NavigationService>();
  final _listingService = locator<ListingService>();
  final _tenantService = locator<TenantService>();
  final _paymentService = locator<PaymentService>();

  List<LandlordModel> get landlord => _listingService.landlordList;
  List<PropertyModel> get propertyList => _listingService.propertyList;
  List<PaymentModel> get pendingPayment => _paymentService.pendingPaymentList;
  List<PaymentModel> get recentPayment => _paymentService.recentPaymentList;

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

  TenantModel _tenantSelected = TenantModel();
  TenantModel get tenantSelected => _tenantSelected;

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

  initAddPayment() {
    _expandedcontroller = ExpandedTileController(isExpanded: true);
    _expandedcontrollerTwo = ExpandedTileController(isExpanded: false);
    _expandedcontrollerThree = ExpandedTileController(isExpanded: false);

    notifyListeners();
  }

  initPayment() {
    fetchPayments();
  }

  fetchPayments() {
    _paymentService.fetchrecentPayment();

    _paymentService.fetchPendingPayment();
  }

  setSelectedPaymentType(String value) {
    _paymentTypeSelected = value;
    notifyListeners();
  }

  setSelectedPaymentCategory(String value) {
    _paymentCategorySelected = value;
    notifyListeners();
  }

  updateLandlordSelected(LandlordModel landlordSearch) async {
    _landlordSelected = landlordSearch;

    _listingService.clearSearchApartment();

    _apartmentSelected = defaultApartmentModel;
    _propertySelected = defaultProperty;

    _propertyListData = [];
    _apartmentListData = [];

    _apartmentListData =
        await _listingService.fetchLandlordApartment(landlordSearch.id);

    notifyListeners();
  }

  updateTenantSelected(TenantModel tenantSearch) async {
    _tenantSelected = tenantSearch;

    // _listingService.clearSearchApartment();

    // _apartmentSelected = defaultApartmentModel;
    // _propertySelected = defaultProperty;

    // _propertyListData = [];
    // _apartmentListData = [];

    // _apartmentListData =
    //     await _listingService.fetchLandlordApartment(landlordSearch.id);

    notifyListeners();
  }

  setSelectApartment(ApartmentModel apartmentData) async {
    _apartmentSelected = apartmentData;

    _propertySelected = defaultProperty;

    _propertyListData = [];

    _propertyListData =
        await _listingService.fetchLandlordProperty(apartmentData.id);
    notifyListeners();
  }

  setSelectProperty(PropertyModel propertyData) {
    _propertySelected = propertyData;

    if (_propertySelected.tenantModel == null) {
      paymentCategory.removeWhere((element) => element == "Rent");
    } else {
      if (paymentCategory.length == 2) {
        paymentCategory.add("Rent");
      }
    }
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

  Future<List<LandlordModel>> getSuggestions(String query) async {
    List<LandlordModel> matches =
        await _listingService.searchTotalLandlord(query);

    return matches;
  }

  Future<List<TenantModel>> getSearchTenant(String query) async {
    List<TenantModel> matches = await _tenantService.searchTotalTenant(query);

    return matches;
  }

  @override
  List<ListenableServiceMixin> get listenableServices =>
      [_listingService, _paymentService, _tenantService];
}
