import 'package:aisu_realestate/ui/common/app_colors.dart';
import 'package:aisu_realestate/ui/common/box_text.dart';
import 'package:aisu_realestate/ui/common/enums.dart';
import 'package:aisu_realestate/ui/common/ui_helpers.dart';
import 'package:aisu_realestate/ui/views/listings/add_listing_tab/apartment_tab_view.dart';
import 'package:aisu_realestate/ui/views/listings/add_listing_tab/landlord_tab_view.dart';
import 'package:aisu_realestate/ui/views/listings/add_listing_tab/property_tab_view.dart';
import 'package:aisu_realestate/ui/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'listings_viewmodel.dart';

class AddListingsView extends StackedView<ListingsViewModel> {
  const AddListingsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ListingsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        backgroundColor: kcWhiteColor,
        appBar: AppBar(
          backgroundColor: kcWhiteColor,
          iconTheme: const IconThemeData(color: kcBlackColor),
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              viewModel.goBack();
            },
            icon: const Icon(Icons.arrow_back),
          ),
          title: ManropeText.semiBold(
              viewModel.pageTitles[viewModel.currentIndex], 14, kcBlackColor),
        ),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 7,
                    color:
                        viewModel.currentIndex >= 0 ? kcBlueColor : kcLightGrey,
                  ),
                ),
                horizontalSpaceTiny,
                Expanded(
                  child: Container(
                    height: 7,
                    color:
                        viewModel.currentIndex >= 1 ? kcBlueColor : kcLightGrey,
                  ),
                ),
                horizontalSpaceTiny,
                Expanded(
                  child: Container(
                    height: 7,
                    color:
                        viewModel.currentIndex >= 2 ? kcBlueColor : kcLightGrey,
                  ),
                ),
              ],
            ),
            Expanded(
              child: PageView(
                controller: viewModel.pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  LandlordTabView(
                    viewModel: viewModel,
                  ),
                  ApartmentTabView(
                    viewModel: viewModel,
                  ),
                  PropertyTabView(
                    viewModel: viewModel,
                  )
                ],
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ButtonWidget(
            isBusy: viewModel.status == StatusEnum.busy,
            height: 50,
            isDisabled: false,
            btnColor: kcBlueColor,
            text: viewModel.currentIndex == 2 ? "Save Listing" : "Next",
            onTap: () => viewModel.goToNext(),
          ),
        ));
  }

  @override
  ListingsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ListingsViewModel()..initAddListing();
}
