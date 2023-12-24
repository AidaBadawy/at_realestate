import 'package:aisu_realestate/models/landlord_model.dart';
import 'package:aisu_realestate/ui/common/app_colors.dart';
import 'package:aisu_realestate/ui/common/box_text.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'listings_viewmodel.dart';

class InfoListingsView extends StackedView<ListingsViewModel> {
  final LandlordModel landlord;

  const InfoListingsView({
    Key? key,
    required this.landlord,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ListingsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: kcWhiteColor,
      appBar: AppBar(
        // backgroundColor: kcWhiteColor,
        iconTheme: const IconThemeData(color: kcBlackColor),
        elevation: 0,
        title: ManropeText.semiBold(landlord.name, 14, kcBlackColor),
      ),
      body: const Column(
        children: [],
      ),
    );
  }

  @override
  ListingsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ListingsViewModel()..initAddListing();
}
