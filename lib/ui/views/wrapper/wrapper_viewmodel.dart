import 'package:aisu_realestate/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';

class WrapperViewModel extends ReactiveViewModel {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  List<String> title = [
    ksHome,
    ksListings,
    ksTenants,
    ksPayments,
    ksReports,
    ksSettings,
  ];

  void onItemTapped(int index) {
    // setState(() {
    _selectedIndex = index;
    notifyListeners();
    // });
  }
}
