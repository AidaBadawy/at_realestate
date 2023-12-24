import 'package:aisu_realestate/models/apartment_model.dart';
import 'package:aisu_realestate/models/landlord_model.dart';
import 'package:aisu_realestate/models/property_model.dart';
import 'package:aisu_realestate/ui/common/app_colors.dart';
import 'package:aisu_realestate/ui/common/app_images.dart';
import 'package:aisu_realestate/ui/common/box_text.dart';
import 'package:aisu_realestate/ui/common/ui_helpers.dart';
import 'package:aisu_realestate/ui/views/tenants/tenants_viewmodel.dart';
import 'package:aisu_realestate/ui/widgets/home_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:intl/intl.dart';

class PropertyDetailTab extends StatelessWidget {
  final TenantsViewModel viewModel;
  const PropertyDetailTab({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat.decimalPattern();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpaceFifteen,
            Row(
              children: [
                const Icon(Feather.info),
                horizontalSpaceSmall,
                ManropeText.semiBold("Property Information", 13, kcBlackColor)
              ],
            ),
            verticalSpaceMedium,
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: ManropeText.medium("Select Landlord", 12, kcBlackColor),
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
                hint: ManropeText.regular("Select landlord", 11, kcLightGrey),
                value: viewModel.selectedLandlord != defaultLanlord
                    ? viewModel.selectedLandlord
                    : null,
                items: viewModel.landlordListVacantSorted
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: ManropeText.regular(
                              "${e.landlordNumber} - ${e.name}",
                              11,
                              kcBlackColor),
                        ))
                    .toList(),
                onChanged: (value) {
                  viewModel.setSelectedLandlord(value!);
                },
              ),
            ),
            verticalSpaceFifteen,
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: ManropeText.medium("Select Apartment", 12, kcBlackColor),
            ),
            verticalSpaceTiny,
            IgnorePointer(
              ignoring: viewModel.selectedLandlord == defaultLanlord,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  border: Border.all(color: kcLightGrey),
                ),
                child: DropdownButton(
                  underline: const SizedBox(),
                  isExpanded: true,
                  borderRadius: BorderRadius.circular(10),
                  hint: ManropeText.regular("Select aparment", 11, kcLightGrey),
                  value: viewModel.selectedApartment != defaultApartmentModel
                      ? viewModel.selectedApartment
                      : null,
                  items: viewModel.apartmentListVacantByLandlordId
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: ManropeText.regular(
                                "${e.apartmentNumber} - ${e.name}",
                                11,
                                kcBlackColor),
                          ))
                      .toList(),
                  onChanged: (value) {
                    viewModel.setSelectedApartment(value!);
                  },
                ),
              ),
            ),
            verticalSpaceFifteen,
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: ManropeText.medium("Select Property", 12, kcBlackColor),
            ),
            verticalSpaceTiny,
            IgnorePointer(
              ignoring: viewModel.selectedApartment == defaultApartmentModel,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  border: Border.all(color: kcLightGrey),
                ),
                child: DropdownButton(
                  underline: const SizedBox(),
                  isExpanded: true,
                  borderRadius: BorderRadius.circular(10),
                  hint: ManropeText.regular("Select property", 11, kcLightGrey),
                  value: viewModel.selectedProperty != defaultProperty
                      ? viewModel.selectedProperty
                      : null,
                  items: viewModel.propertyListForSelectedApartment
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: ManropeText.regular(
                                "${e.propertyNumber} - ${e.flat}",
                                11,
                                kcBlackColor),
                          ))
                      .toList(),
                  onChanged: (value) {
                    viewModel.setSelectedFlat(value!);
                  },
                ),
              ),
            ),
            verticalSpaceFifteen,
            if (viewModel.selectedProperty != defaultProperty) ...[
              Row(
                children: [
                  Expanded(
                    child: HomeCardWidget(
                      title: "Monthly Rent",
                      data: formatter
                          .format(viewModel.selectedProperty.monthlyRent),
                      cardColor: kcGreenColor.withOpacity(.1),
                      iconColor: kcGreenColor,
                      textColor: kcBlackColor,
                      icon: coinIcon,
                      top: -15,
                      right: -15,
                      titleFontSize: 14,
                      dataFontSize: 20,
                      isProperty: true,
                    ),
                  ),
                  horizontalSpaceSmall,
                  Expanded(
                    child: HomeCardWidget(
                      title: "Deposit",
                      data: formatter.format(
                          viewModel.selectedProperty.monthlyRent *
                              viewModel.selectedProperty.deposit),
                      cardColor: kcAmberColor.withOpacity(.1),
                      iconColor: kcAmberColor,
                      textColor: kcBlackColor,
                      icon: coinIcon,
                      top: -15,
                      right: -15,
                      titleFontSize: 14,
                      dataFontSize: 20,
                      isProperty: true,
                    ),
                  )
                ],
              ),
              verticalSpaceSmall,
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Expanded(
                  //   child: Container(
                  //     height: 90,
                  //     // width: 90,
                  //     color: kcRedColor,
                  //   ),
                  // ),
                  Expanded(
                    child: HomeCardWidget(
                      title: "Bed Room",
                      data: viewModel.selectedProperty.room.toString(),
                      cardColor: kcBlueColor.withOpacity(.1),
                      iconColor: kcBlueColor,
                      textColor: kcBlackColor,
                      icon: bedIcon,
                      top: 2,
                      right: 2,
                      titleFontSize: 14,
                      dataFontSize: 24,
                      isProperty: false,
                      iconSize: 40,
                    ),
                  ),
                  // horizontalSpaceTiny,
                  horizontalSpaceSmall,

                  Expanded(
                    child: HomeCardWidget(
                      title: "Bath Room",
                      data: viewModel.selectedProperty.bath.toString(),
                      cardColor: kcBlueColor.withOpacity(.1),
                      iconColor: kcBlueColor,
                      textColor: kcBlackColor,
                      icon: bathIcon,
                      top: 2,
                      right: 2,
                      titleFontSize: 14,
                      dataFontSize: 24,
                      isProperty: false,
                      iconSize: 40,
                    ),
                  ),
                  // horizontalSpaceTiny,
                  horizontalSpaceSmall,

                  Expanded(
                    child: HomeCardWidget(
                      title: "Flat No",
                      data: viewModel.selectedProperty.flat.toString(),
                      cardColor: kcBlueColor.withOpacity(.1),
                      iconColor: kcBlueColor,
                      textColor: kcBlackColor,
                      icon: flatIcon,
                      top: 2,
                      right: 2,
                      titleFontSize: 14,
                      dataFontSize: 24,
                      isProperty: false,
                      iconSize: 40,
                    ),
                  ),
                ],
              )
            ],
          ],
        ),
      ),
    );
  }
}
