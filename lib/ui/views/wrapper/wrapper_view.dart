import 'package:aisu_realestate/ui/common/app_colors.dart';
import 'package:aisu_realestate/ui/common/box_text.dart';
import 'package:aisu_realestate/ui/views/home/home_view.dart';
import 'package:aisu_realestate/ui/views/listings/listings_view.dart';
import 'package:aisu_realestate/ui/views/payment/payment_view.dart';
import 'package:aisu_realestate/ui/views/reports/reports_view.dart';
import 'package:aisu_realestate/ui/views/settings/settings_view.dart';
import 'package:aisu_realestate/ui/views/tenants/tenants_view.dart';
import 'package:aisu_realestate/ui/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
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
    return Scaffold(
      appBar: AppBar(
        // title: Text(viewModel.title[viewModel.selectedIndex]),
        title: ManropeText.bold(
            viewModel.title[viewModel.selectedIndex], 16, kcBlackColor),
        actions: [
          // IconButton(onPressed: () {}, icon: const Icon(AntDesign.message1)),
          IconButton(onPressed: () {}, icon: const Icon(Feather.bell))
        ],
        elevation: 0,
        backgroundColor: kcWhiteColor,
        iconTheme: const IconThemeData(color: kcBlackColor),
      ),
      drawer: DrawerWidget(
        viewModel: viewModel,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: _widgetOptions[viewModel.selectedIndex],
    );
  }

  static const List<Widget> _widgetOptions = <Widget>[
    HomeView(),
    ListingsView(),
    TenantsView(),
    PaymentView(),
    ReportsView(),
    SettingsView(),
  ];

  @override
  WrapperViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      WrapperViewModel();
}
