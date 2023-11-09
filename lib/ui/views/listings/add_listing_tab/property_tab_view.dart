import 'package:aisu_realestate/app/app_exports.dart';
import 'package:aisu_realestate/models/apartment_model.dart';
import 'package:aisu_realestate/ui/views/listings/listings_viewmodel.dart';
import 'package:aisu_realestate/ui/widgets/property_card.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class PropertyTabView extends StatelessWidget {
  final ListingsViewModel viewModel;

  const PropertyTabView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: viewModel.formKeys[viewModel.currentIndex],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpaceFifteen,
              if (viewModel.newPropertyList.isNotEmpty) ...[
                Row(
                  children: [
                    const Icon(Feather.info),
                    horizontalSpaceSmall,
                    ManropeText.semiBold("Landlord Property", 13, kcBlackColor),
                  ],
                ),
                verticalSpaceSmall,
                ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          // print(viewModel.newApartmentList[index].id);
                        },
                        child: PropertyCard(
                          apartment: viewModel.newPropertyList[index],
                          delete: () {
                            // viewModel.deleteApartment(
                            //     viewModel.newApartmentList[index].id);
                          },
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 10,
                      );
                    },
                    itemCount: viewModel.newApartmentList.length),
                verticalSpaceFifteen
              ],
              Row(
                children: [
                  const Icon(Feather.info),
                  horizontalSpaceSmall,
                  ManropeText.semiBold("Selected Apartment", 13, kcBlackColor),
                  const Spacer(),
                ],
              ),
              verticalSpaceSmall,
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  border: Border.all(color: kcLightGrey),
                ),
                child: DropdownButton<ApartmentModel>(
                  underline: const SizedBox(),
                  isExpanded: true,
                  borderRadius: BorderRadius.circular(10),
                  hint:
                      ManropeText.regular("Select Apartment", 11, kcLightGrey),
                  value: viewModel.selectedApartment.id == ""
                      ? viewModel.newApartmentList.first
                      : viewModel.selectedApartment,
                  items: viewModel.newApartmentList
                      .map((e) => DropdownMenuItem<ApartmentModel>(
                            value: e,
                            child:
                                ManropeText.regular(e.name, 12, kcBlackColor),
                          ))
                      .toList(),
                  onChanged: (ApartmentModel? value) {
                    viewModel.setSelectedApartment(value!);
                  },
                ),
              ),
              verticalSpaceMedium,
              Row(
                children: [
                  const Icon(Feather.info),
                  horizontalSpaceSmall,
                  ManropeText.semiBold(
                      "Property Information", 13, kcBlackColor),
                  const Spacer(),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: kcVeryLightGrey,
                    ),
                    child: ManropeText.bold(
                      viewModel.currentPropertyId,
                      13,
                      kcBlackColor,
                      spacing: 0.6,
                    ),
                  )
                ],
              ),
              verticalSpaceMedium,
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: ManropeText.medium(
                              "Property Floor", 12, kcBlackColor),
                        ),
                        verticalSpaceTiny,
                        SizedBox(
                          // height: 55,
                          child: TextFormField(
                            keyboardType: TextInputType.name,
                            validator: (value) =>
                                EmptyStringValidator.validate(value!),
                            controller: viewModel.propertyFloorController,
                            style: manropeRegularFonts.copyWith(fontSize: 12),
                            decoration: InputDecoration(
                              hintText: "Floor No.",
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
                  horizontalSpaceSmall,
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: ManropeText.medium(
                            "Property Flat No.", 12, kcBlackColor),
                      ),
                      verticalSpaceTiny,
                      SizedBox(
                        // height: 55,
                        child: TextFormField(
                          keyboardType: TextInputType.name,
                          controller: viewModel.propertyFlatController,
                          validator: (value) =>
                              EmptyStringValidator.validate(value!),
                          style: manropeRegularFonts.copyWith(fontSize: 12),
                          decoration: InputDecoration(
                            hintText: "Flat No.",
                            hintStyle: manropeRegularFonts.copyWith(
                                fontSize: 12, color: kcLightGrey),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 15),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(color: kcLightGrey),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(color: kcLightGrey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(color: kcMediumGrey),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ))
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
                          child: ManropeText.medium("Room", 12, kcBlackColor),
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
                                "Select Room", 11, kcLightGrey),
                            value: viewModel.selectedRoom != ""
                                ? viewModel.selectedRoom
                                : null,
                            items: viewModel.rooms
                                .map((e) => DropdownMenuItem(
                                      value: e,
                                      child: ManropeText.regular(
                                          e, 12, kcBlackColor),
                                    ))
                                .toList(),
                            onChanged: (value) {
                              viewModel.setSelectedRoom(value!);
                            },
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
                          child: ManropeText.medium("Bath", 12, kcBlackColor),
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
                                "Select Bath", 11, kcLightGrey),
                            value: viewModel.selectedBath != ""
                                ? viewModel.selectedBath
                                : null,
                            items: viewModel.rooms
                                .map((e) => DropdownMenuItem(
                                      value: e,
                                      child: ManropeText.regular(
                                          e, 12, kcBlackColor),
                                    ))
                                .toList(),
                            onChanged: (value) {
                              viewModel.setSelectedBath(value!);
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              verticalSpaceSmall,
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: ManropeText.medium(
                    "Property description", 12, kcBlackColor),
              ),
              verticalSpaceTiny,
              SizedBox(
                // height: 55,
                child: TextFormField(
                  maxLines: 3,
                  keyboardType: TextInputType.name,
                  controller: viewModel.propertyDescriptionController,
                  validator: (value) => EmptyStringValidator.validate(value!),
                  style: manropeRegularFonts.copyWith(fontSize: 12),
                  decoration: InputDecoration(
                    hintText: "Enter description",
                    hintStyle: manropeRegularFonts.copyWith(
                        fontSize: 12, color: kcLightGrey),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 15),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: kcLightGrey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: kcLightGrey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: kcMediumGrey),
                    ),
                  ),
                ),
              ),
              verticalSpaceFifteen,
              Row(
                children: [
                  const Icon(Feather.info),
                  horizontalSpaceSmall,
                  ManropeText.semiBold("Payment Information", 13, kcBlackColor)
                ],
              ),
              verticalSpaceMedium,
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: ManropeText.medium(
                              "Monthly Rent", 12, kcBlackColor),
                        ),
                        verticalSpaceTiny,
                        SizedBox(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp("[0-9]")),
                            ],
                            controller: viewModel.propertyRentController,
                            validator: (value) =>
                                EmptyStringValidator.validate(value!),
                            style: manropeRegularFonts.copyWith(fontSize: 12),
                            decoration: InputDecoration(
                              hintText: "Monthly Rent",
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
                          child:
                              ManropeText.medium("Deposit", 12, kcBlackColor),
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
                                "Select Deposit", 11, kcLightGrey),
                            value: viewModel.selectedDeposit != ""
                                ? viewModel.selectedDeposit
                                : null,
                            items: viewModel.depositData
                                .map((e) => DropdownMenuItem(
                                      value: e,
                                      child: ManropeText.regular(
                                          e, 12, kcBlackColor),
                                    ))
                                .toList(),
                            onChanged: (value) {
                              viewModel.setSelectedDeposit(value!);
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              verticalSpaceFifteen,
              RichText(
                text: TextSpan(
                    text: "+ Add Property",
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        viewModel.saveProperty();
                      },
                    style: manropeMediumFonts.copyWith(
                      color: kcPrimaryColor,
                      fontSize: 14,
                      decoration: TextDecoration.underline,
                    )
                    // children: Text("data"),
                    ),
              ),
              verticalSpaceMedium,
              verticalSpaceMedium,
              verticalSpaceMedium,
              verticalSpaceMedium,
            ],
          ),
        ),
      ),
    );
  }
}
