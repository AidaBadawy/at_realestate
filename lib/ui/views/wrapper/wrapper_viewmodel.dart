import 'package:aisu_realestate/ui/common/app_strings.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
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

  PersistentTabController _controller = PersistentTabController();
  PersistentTabController get controller => _controller;

  initWrapper() {
    _selectedIndex = 4;
    _controller = PersistentTabController(initialIndex: 2);
  }

  void onItemTapped(int index) {
    // setState(() {
    _selectedIndex = index;
    notifyListeners();
    // });
  }
}
