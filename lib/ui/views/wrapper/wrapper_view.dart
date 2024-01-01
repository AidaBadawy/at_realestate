import 'package:aisu_realestate/ui/common/app_colors.dart';
import 'package:aisu_realestate/ui/views/home/home_view.dart';
import 'package:aisu_realestate/ui/views/listings/listings_view.dart';
import 'package:aisu_realestate/ui/views/payment/payment_view.dart';
import 'package:aisu_realestate/ui/views/settings/settings_view.dart';
import 'package:aisu_realestate/ui/views/tenants/tenants_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:stacked/stacked.dart';

import 'wrapper_viewmodel.dart';

class WrapperView extends StackedView<WrapperViewModel> {
  const WrapperView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    WrapperViewModel viewModel,
    Widget? child,
  ) {
    // return Scaffold(
    //   appBar: AppBar(
    //     // title: Text(viewModel.title[viewModel.selectedIndex]),
    //     title: ManropeText.bold(
    //         viewModel.title[viewModel.selectedIndex], 16, kcBlackColor),
    //     actions: [
    //       // IconButton(onPressed: () {}, icon: const Icon(AntDesign.message1)),
    //       IconButton(onPressed: () {}, icon: const Icon(Feather.bell))
    //     ],
    //     elevation: 0,
    //     backgroundColor: kcWhiteColor,
    //     iconTheme: const IconThemeData(color: kcBlackColor),
    //   ),
    //   drawer: DrawerWidget(
    //     viewModel: viewModel,
    //   ),
    //   backgroundColor: Theme.of(context).colorScheme.background,
    //   body: _widgetOptions[viewModel.selectedIndex],

    // );
    return PersistentTabView(
      context,
      controller: viewModel.controller,
      screens: _widgetOptions(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),

      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),

      navBarStyle:
          NavBarStyle.style15, // Choose the nav bar style with this property.
    );
  }

  List<Widget> _widgetOptions() {
    return [
      const PaymentView(),
      const ListingsView(),
      const HomeView(),
      const TenantsView(),
      const SettingsView(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(
          Feather.credit_card,
        ),
        // title: ("Payment"),
        activeColorPrimary: kcPrimaryColor,
        inactiveColorPrimary: kcLightGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          FontAwesome5Regular.building,
          size: 22,
        ),
        // title: ("Listings"),
        activeColorPrimary: kcPrimaryColor,
        inactiveColorPrimary: kcLightGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          Feather.home,
          color: kcWhiteColor,
        ),
        // title: ("Home"),
        activeColorPrimary: kcPrimaryColor,
        inactiveColorPrimary: kcLightGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          Feather.users,
        ),
        // title: ("Tenants"),
        activeColorPrimary: kcPrimaryColor,
        inactiveColorPrimary: kcLightGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.settings),
        // title: ("Settings"),
        activeColorPrimary: kcPrimaryColor,
        inactiveColorPrimary: kcLightGrey,
      ),
    ];
  }

  @override
  WrapperViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      WrapperViewModel();

  @override
  void onViewModelReady(WrapperViewModel viewModel) {
    viewModel.initWrapper();
    super.onViewModelReady(viewModel);
  }
}
