import 'package:aisu_realestate/ui/common/app_colors.dart';
import 'package:aisu_realestate/ui/common/box_text.dart';
import 'package:aisu_realestate/ui/common/ui_helpers.dart';
import 'package:aisu_realestate/ui/views/tenants/add_tenant_tab/property_detail_tab.dart';
import 'package:aisu_realestate/ui/views/tenants/add_tenant_tab/tenant_detail_tab.dart';
import 'package:aisu_realestate/ui/views/tenants/tenants_viewmodel.dart';
import 'package:aisu_realestate/ui/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class AddTenantsView extends StackedView<TenantsViewModel> {
  const AddTenantsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    TenantsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        backgroundColor: kcWhiteColor,
        appBar: AppBar(
          backgroundColor: kcWhiteColor,
          iconTheme: const IconThemeData(color: kcBlackColor),
          leading: IconButton(
            onPressed: () {
              viewModel.goBack();
            },
            icon: const Icon(Icons.arrow_back),
          ),
          elevation: 0,
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
                    color: viewModel.currentIndex >= 0
                        ? kcPrimaryColor
                        : kcLightGrey,
                  ),
                ),
                horizontalSpaceTiny,
                Expanded(
                  child: Container(
                    height: 7,
                    color: viewModel.currentIndex > 0
                        ? kcPrimaryColor
                        : kcLightGrey,
                  ),
                ),
              ],
            ),
            Expanded(
              child: PageView(
                controller: viewModel.pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  TenantDetailTab(
                    viewModel: viewModel,
                  ),
                  PropertyDetailTab(
                    viewModel: viewModel,
                  ),
                ],
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ButtonWidget(
            isBusy: false,
            isDisabled: false,
            text: "Next",
            onTap: () => viewModel.goToNext(),
          ),
        ));
  }

  @override
  TenantsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      TenantsViewModel()..initAddListing();
}
