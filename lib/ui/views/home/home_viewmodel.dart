import 'package:aisu_realestate/app/app.bottomsheets.dart';
import 'package:aisu_realestate/app/app.dialogs.dart';
import 'package:aisu_realestate/app/app.locator.dart';
import 'package:aisu_realestate/models/sales_data.dart';
import 'package:aisu_realestate/services/listing_service.dart';
import 'package:aisu_realestate/ui/common/app_colors.dart';
import 'package:aisu_realestate/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _listingService = locator<ListingService>();

  final List<SalesData> chartData = [
    SalesData(2010, 35),
    SalesData(2011, 28),
    SalesData(2012, 34),
    SalesData(2013, 32),
    SalesData(2014, 40)
  ];

  final List<ChartData> data = [
    ChartData('CHN', 12),
    ChartData('GER', 15),
    ChartData('RUS', 30),
    ChartData('BRZ', 6.4),
    ChartData('IND', 14),
    ChartData('MUL', 20),
    ChartData('MI', 16),
  ];

  final List<ChartData> chartDataTwo = [
    ChartData('Not Paid', 10, kcRedColor),
    ChartData('Paid', 2, kcPrimaryColor)
  ];

  String get counterLabel => 'Counter is: $_counter';

  List<String> months = [
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
  ];

  List<String> filters = [
    "Weekly",
    "Monthly",
    "Yearly",
  ];

  String _selectedMonth = "";
  String get selectedMonth => _selectedMonth;

  String _selectedFilter = "Monthly";
  String get selectedFilter => _selectedFilter;

  String _selectedRentMonth = "August";
  String get selectedRentMonth => _selectedRentMonth;

  bool _isBarGraphTapped = false;
  bool get isBarGraphTapped => _isBarGraphTapped;

  bool _isDonughtTapped = false;
  bool get isDonughtTapped => _isDonughtTapped;

  setSelectedCity(String value) {
    _selectedMonth = value;
    notifyListeners();
  }

  setSelectedFilter(String value) {
    _selectedFilter = value;
    notifyListeners();
  }

  setSelectedRentMonth(String value) {
    _selectedRentMonth = value;
    notifyListeners();
  }

  setBarTapped() {
    _isBarGraphTapped = !_isBarGraphTapped;
    notifyListeners();
  }

  setDonughtTapped() {
    _isDonughtTapped = !_isDonughtTapped;
    notifyListeners();
  }

  int _counter = 0;

  initHome() {
    fetchAppIds();
  }

  fetchAppIds() {
    _listingService.fetchAppID();
  }

  void incrementCounter() {
    _counter++;
    rebuildUi();
  }

  void showDialog() {
    _dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
      title: 'Stacked Rocks!',
      description: 'Give stacked $_counter stars on Github',
    );
  }

  void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: ksHomeBottomSheetTitle,
      description: ksHomeBottomSheetDescription,
    );
  }
}
