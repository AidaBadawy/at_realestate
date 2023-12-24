import 'package:aisu_realestate/app/app_exports.dart';
import 'package:aisu_realestate/ui/views/listings/listings_viewmodel.dart';
import 'package:aisu_realestate/ui/widgets/apartment_card.dart';
import 'package:aisu_realestate/ui/widgets/button_widget.dart';
import 'package:aisu_realestate/ui/widgets/property_card.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class ApartmentTabView extends StatelessWidget {
  final ListingsViewModel viewModel;

  const ApartmentTabView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: viewModel.formKeys[viewModel.currentIndex],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpaceFifteen,

              Row(
                children: [
                  const Icon(Feather.info),
                  horizontalSpaceSmall,
                  ManropeText.semiBold(
                      "Apartment Information", 13, kcBlackColor),
                ],
              ),
              verticalSpaceMedium,
              // verticalSpaceSmall,
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: ManropeText.medium(
                              "Apartment Name", 12, kcBlackColor),
                        ),
                        verticalSpaceTiny,
                        SizedBox(
                          child: TextFormField(
                            controller: viewModel.apartmentNameController,
                            validator: (value) =>
                                EmptyStringValidator.validate(value!),
                            keyboardType: TextInputType.name,
                            style: manropeRegularFonts.copyWith(fontSize: 12),
                            decoration: InputDecoration(
                              hintText: "Apartment name",
                              hintStyle: manropeRegularFonts.copyWith(
                                  fontSize: 12, color: kcLightGrey),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 15),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide:
                                    const BorderSide(color: kcLightGrey),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide:
                                    const BorderSide(color: kcLightGrey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide:
                                    const BorderSide(color: kcMediumGrey),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  horizontalSpaceTiny,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: ManropeText.medium(
                              "Apartment City", 12, kcBlackColor),
                        ),
                        verticalSpaceTiny,
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            border: Border.all(color: kcLightGrey),
                          ),
                          child: DropdownButton(
                            underline: const SizedBox(),
                            isExpanded: true,
                            borderRadius: BorderRadius.circular(10),
                            hint: ManropeText.regular(
                                "Select City", 11, kcLightGrey),
                            value: viewModel.selectedCity != ""
                                ? viewModel.selectedCity
                                : null,
                            items: viewModel.city
                                .map((e) => DropdownMenuItem(
                                      value: e,
                                      child: ManropeText.regular(
                                          e, 12, kcBlackColor),
                                    ))
                                .toList(),
                            onChanged: (value) {
                              viewModel.setSelectedCity(value!);
                              // viewModel.updateApartmentDetails(value, "city");
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              verticalSpaceSmall,
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: ManropeText.medium(
                              "Apartment Area", 12, kcBlackColor),
                        ),
                        verticalSpaceTiny,
                        SizedBox(
                          child: TextFormField(
                            controller: viewModel.apartmentAreaController,
                            validator: (value) =>
                                EmptyStringValidator.validate(value!),
                            keyboardType: TextInputType.name,
                            style: manropeRegularFonts.copyWith(fontSize: 12),
                            decoration: InputDecoration(
                              hintText: "Apartment Area",
                              hintStyle: manropeRegularFonts.copyWith(
                                  fontSize: 12, color: kcLightGrey),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 15),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide:
                                    const BorderSide(color: kcLightGrey),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide:
                                    const BorderSide(color: kcLightGrey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide:
                                    const BorderSide(color: kcMediumGrey),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  horizontalSpaceTiny,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: ManropeText.medium(
                              "Apartment Street", 12, kcBlackColor),
                        ),
                        verticalSpaceTiny,
                        SizedBox(
                          child: TextFormField(
                            controller: viewModel.apartmentStreetController,
                            validator: (value) =>
                                EmptyStringValidator.validate(value!),
                            keyboardType: TextInputType.name,
                            style: manropeRegularFonts.copyWith(fontSize: 12),
                            decoration: InputDecoration(
                              hintText: "Apartment Street",
                              hintStyle: manropeRegularFonts.copyWith(
                                  fontSize: 12, color: kcLightGrey),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 15),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide:
                                    const BorderSide(color: kcLightGrey),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide:
                                    const BorderSide(color: kcLightGrey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide:
                                    const BorderSide(color: kcMediumGrey),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              verticalSpaceFifteen,
              ButtonWidget(
                height: 50,
                isBusy: false,
                isDisabled: false,
                text: "Add Apartment",
                onTap: () => viewModel.addApartment(),
              ),
              // RichText(
              //   text: TextSpan(
              //       text: "+ Add Apartment",
              //       recognizer: TapGestureRecognizer()
              //         ..onTap = () {
              //           viewModel.addApartment();
              //         },
              //       style: manropeMediumFonts.copyWith(
              //         color: kcPrimaryColor,
              //         fontSize: 14,
              //         decoration: TextDecoration.underline,
              //       )),
              // ),
              verticalSpaceMedium,
              if (viewModel.newApartmentList.isNotEmpty) ...[
                Row(
                  children: [
                    const Icon(Feather.info),
                    horizontalSpaceSmall,
                    ManropeText.semiBold("Apartment List", 13, kcBlackColor),
                  ],
                ),
                verticalSpaceMedium,
                ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ApartmentCard(
                        apartment: viewModel.newApartmentList[index],
                        delete: () {},
                      );
                    },
                    separatorBuilder: (context, index) => verticalSpaceSmall,
                    itemCount: viewModel.newApartmentList.length),
                // ExpandedTileList.separated(
                //   separatorBuilder: (context, index) {
                //     return verticalSpaceSmall;
                //   },
                //   itemCount: viewModel.newApartmentList.length,
                //   maxOpened: 1,
                //   reverse: true,
                //   itemBuilder: (context, index, controller) {
                //     return ExpandedTile(
                //       theme: const ExpandedTileThemeData(
                //         headerColor: kcPrimaryColorHighlight,
                //         headerRadius: 10.0,
                //         headerPadding: EdgeInsets.all(24.0),
                //         headerSplashColor: kcBlueColor,
                //         contentBackgroundColor: kcWhiteColor,
                //         contentPadding: EdgeInsets.symmetric(vertical: 10),
                //         contentRadius: 10.0,
                //       ),
                //       contentseparator: 10,
                //       controller: controller.copyWith(),
                //       title: RichText(
                //         maxLines: 1,
                //         overflow: TextOverflow.ellipsis,
                //         text: TextSpan(
                //           text: viewModel.newApartmentList[index].name,
                //           style: manropeBoldFonts.copyWith(
                //             color: kcBlackColor,
                //             fontSize: 16,
                //           ),
                //         ),
                //       ),
                //       content: Container(
                //         padding: const EdgeInsets.symmetric(
                //             vertical: 10, horizontal: 10),
                //         decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(10),
                //           border: Border.all(
                //             color: kcLightGrey,
                //           ),
                //         ),
                //       ),
                //     );
                //   },
                // ),
                verticalSpaceSmall,
              ],
              verticalSpaceMedium,
              verticalSpaceMedium,
            ],
          ),
        ),
      ),
    );
  }
}
