import 'package:aisu_realestate/app/app_exports.dart';
import 'package:aisu_realestate/models/landlord_model.dart';

import 'package:aisu_realestate/ui/widgets/landlord_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:lottie/lottie.dart';
import 'package:stacked/stacked.dart';

import 'listings_viewmodel.dart';

class ListingsView extends StackedView<ListingsViewModel> {
  const ListingsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ListingsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: kcWhiteColor,
      appBar: AppBar(
        backgroundColor: kcBlueDark,
        leading: const Icon(Feather.users),
        title: ManropeText.bold("Listings", 16, kcWhiteColor),
        actions: [
          IconButton(
              onPressed: () => viewModel.activateSearchFunc(),
              icon: Icon(viewModel.activateSearch
                  ? Ionicons.close_sharp
                  : Feather.search))
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            if (viewModel.activateSearch) ...[
              verticalSpaceFifteen,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SearchAnchor(
                  viewHintText: "Search Landlord...",
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
                      hintText: "Search Landlord...",
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
                  suggestionsBuilder: (BuildContext context,
                      SearchController controller) async {
                    // if (controller.text.isEmpty) {
                    //   return List.generate(
                    //     0,
                    //     (int index) {
                    //       return Container();
                    //     },
                    //   );
                    // }
                    print(controller.text);
                    List<LandlordModel> list =
                        await viewModel.getSuggestions(controller.text);
                    return List<ListTile>.generate(
                      list.length,
                      (int index) {
                        final String item = list[index].name;
                        return ListTile(
                          title: Text(item),
                          onTap: () {
                            // setState(() {
                            controller.closeView(item);
                            // FocusScope.of(context).requestFocus(FocusNode());

                            // });
                          },
                          trailing: const Text("LD-0001"),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
            // verticalSpaceSmall,

            verticalSpaceFifteen,
            Expanded(
              child: viewModel.landlordList.isEmpty
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
                              "No Listings Available", 14, kcDarkGreyColor),
                          verticalSpaceLarge,
                        ],
                      ),
                    )
                  : ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () => viewModel.navigateToinfoListing(
                              viewModel.landlordList[index]),
                          child: LandlordCardWidget(
                            landlord: viewModel.landlordList[index],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        // return const Divider(
                        //   thickness: 1,
                        // );
                        return verticalSpaceFifteen;
                      },
                      itemCount: viewModel.landlordList.length,
                    ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "add-listing",
        onPressed: () => viewModel.navigateToAddListing(),
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  ListingsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ListingsViewModel();

  @override
  void onViewModelReady(ListingsViewModel viewModel) {
    viewModel.initListing();
    super.onViewModelReady(viewModel);
  }
}
