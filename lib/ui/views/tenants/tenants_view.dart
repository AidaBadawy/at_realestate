import 'package:aisu_realestate/ui/common/app_colors.dart';
import 'package:aisu_realestate/ui/common/app_images.dart';
import 'package:aisu_realestate/ui/common/box_text.dart';
import 'package:aisu_realestate/ui/common/styles.dart';
import 'package:aisu_realestate/ui/common/ui_helpers.dart';
import 'package:aisu_realestate/ui/widgets/tenant_card.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:stacked/stacked.dart';

import 'tenants_viewmodel.dart';

class TenantsView extends StackedView<TenantsViewModel> {
  const TenantsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    TenantsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: kcWhiteColor,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            viewModel.initTenantView();
          },
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: SearchAnchor(
                  viewHintText: "Search tenant...",
                  headerHintStyle: manropeRegularFonts.copyWith(
                      fontSize: 13,
                      color: Theme.of(context).colorScheme.onSurfaceVariant),
                  viewLeading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                  builder: (BuildContext context, SearchController controller) {
                    return SearchBar(
                      hintText: "Search tenant...",
                      hintStyle: MaterialStateProperty.resolveWith((states) {
                        return manropeRegularFonts.copyWith(
                            fontSize: 13,
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant);
                      }),
                      elevation: MaterialStateProperty.resolveWith<double?>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {
                            return 8.0; // Increase elevation when pressed
                          } else {
                            return 2.0; // Default elevation for other states
                          }
                        },
                      ),
                      backgroundColor:
                          MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                          return kcWhiteColor;
                        },
                      ),
                      controller: controller,
                      padding: const MaterialStatePropertyAll<EdgeInsets>(
                          EdgeInsets.symmetric(horizontal: 16.0)),
                      onTap: () {
                        controller.openView();
                      },
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          side: const BorderSide(color: kcVeryLightGrey),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      onChanged: (_) {
                        controller.openView();
                      },
                      leading: const Icon(Icons.search),
                    );
                  },
                  suggestionsBuilder:
                      (BuildContext context, SearchController controller) {
                    if (controller.text.isEmpty) {
                      return List.generate(
                        0,
                        (int index) {
                          return Container();
                        },
                      );
                    }
                    return List<ListTile>.generate(
                      5,
                      (int index) {
                        final String item = 'item searching $index';
                        return ListTile(
                          title: Text(item),
                          onTap: () {
                            // setState(() {
                            controller.closeView(item);
                            // FocusScope.of(context).requestFocus(FocusNode());

                            // });
                          },
                        );
                      },
                    );
                  },
                ),
              ),
              verticalSpaceSmall,
              Expanded(
                child: viewModel.tenantList.isEmpty
                    ? Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            LottieBuilder.asset(
                              emptyLottie,
                              height: 180,
                              repeat: false,
                            ),
                            ManropeText.medium(
                                "No Tenants Available", 14, kcDarkGreyColor),
                            verticalSpaceLarge,
                          ],
                        ),
                      )
                    : ListView.separated(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        itemBuilder: (context, index) {
                          return TenantCard(
                            tenant: viewModel.tenantList[index],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return verticalSpaceFifteen;
                        },
                        itemCount: viewModel.tenantList.length,
                      ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "add-tenant",
        onPressed: () => viewModel.navigateToAddListing(),
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  TenantsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      TenantsViewModel();

  @override
  void onViewModelReady(TenantsViewModel viewModel) {
    viewModel.initTenantView();
    super.onViewModelReady(viewModel);
  }
}
