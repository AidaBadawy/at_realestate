import 'package:aisu_realestate/ui/common/app_colors.dart';
import 'package:aisu_realestate/ui/common/app_images.dart';
import 'package:aisu_realestate/ui/common/box_text.dart';
import 'package:aisu_realestate/ui/common/ui_helpers.dart';
import 'package:aisu_realestate/ui/views/tenants/tenants_viewmodel.dart';
import 'package:aisu_realestate/ui/widgets/home_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class PropertyDetailTab extends StatelessWidget {
  final TenantsViewModel viewModel;
  const PropertyDetailTab({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
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
                value: viewModel.selectedLandlord != ""
                    ? viewModel.selectedLandlord
                    : null,
                items: viewModel.landlords
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: ManropeText.regular(e, 11, kcBlackColor),
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
              ignoring: viewModel.selectedLandlord == "",
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
                  value: viewModel.selectedApartment != ""
                      ? viewModel.selectedApartment
                      : null,
                  items: viewModel.apartment
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: ManropeText.regular(e, 11, kcBlackColor),
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
              ignoring: viewModel.selectedApartment == "",
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
                  value: viewModel.selectedFlat != ""
                      ? viewModel.selectedFlat
                      : null,
                  items: viewModel.flats
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: ManropeText.regular(e, 11, kcBlackColor),
                          ))
                      .toList(),
                  onChanged: (value) {
                    viewModel.setSelectedFlat(value!);
                  },
                ),
              ),
            ),
            verticalSpaceFifteen,
            Row(
              children: [
                Expanded(
                  child: HomeCardWidget(
                    title: "Monthly Rent",
                    data: "99,999",
                    cardColor: kcGreenColor.withOpacity(.1),
                    iconColor: kcGreenColor,
                    textColor: kcBlackColor,
                    icon: coinIcon,
                    top: -15,
                    right: -15,
                    titleFontSize: 12,
                    dataFontSize: 18,
                    isProperty: true,
                  ),
                ),
                horizontalSpaceSmall,
                Expanded(
                  child: HomeCardWidget(
                    title: "Deposit",
                    data: "180,000",
                    cardColor: kcAmberColor.withOpacity(.1),
                    iconColor: kcAmberColor,
                    textColor: kcBlackColor,
                    icon: coinIcon,
                    top: -15,
                    right: -15,
                    titleFontSize: 12,
                    dataFontSize: 18,
                    isProperty: true,
                  ),
                )
              ],
            ),
            verticalSpaceSmall,
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    height: 90,
                    // width: 90,
                    color: kcRedColor,
                  ),
                ),
                horizontalSpaceTiny,
                Expanded(
                  child: Container(
                    height: 90,
                    width: 90,
                    color: kcRedColor,
                  ),
                ),
                horizontalSpaceTiny,
                Expanded(
                  child: Container(
                    height: 90,
                    width: 90,
                    color: kcRedColor,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
