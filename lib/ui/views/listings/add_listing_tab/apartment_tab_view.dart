import 'package:aisu_realestate/app/app_exports.dart';
import 'package:aisu_realestate/ui/views/listings/listings_viewmodel.dart';
import 'package:aisu_realestate/ui/widgets/apartment_card.dart';
// import 'package:aisu_realestate/ui/widgets/apartment_card.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
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
              if (viewModel.newApartmentList.isNotEmpty) ...[
                Row(
                  children: [
                    const Icon(Feather.info),
                    horizontalSpaceSmall,
                    ManropeText.semiBold(
                        "Landlord Apartment", 13, kcBlackColor),
                  ],
                ),
                verticalSpaceSmall,
                SizedBox(
                  // height: 120,
                  child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            // print(viewModel.newApartmentList[index].id);
                          },
                          child: ApartmentCard(
                            apartment: viewModel.newApartmentList[index],
                            delete: () {
                              viewModel.deleteApartment(
                                  viewModel.newApartmentList[index].id);
                            },
                          ),
                          // child: Container(
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(10),
                          //     color: Colors.red,
                          //   ),
                          //   height: 70,
                          //   width: 150,
                          //   child: Column(children: [
                          //     ManropeText.semiBold("AP-0001", 14, kcWhiteColor)
                          //   ]),
                          // ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          width: 10,
                        );
                      },
                      itemCount: viewModel.newApartmentList.length),
                ),
                verticalSpaceSmall,
                SizedBox(
                  height: 130,
                  child: ListView.separated(
                      // physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            viewModel.setAnimate();
                            viewModel.setSelectedId(viewModel.selectedId == ""
                                ? viewModel.newApartmentList[index].id
                                : "");
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox(
                                width: 200,
                                child: Row(children: [
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: kcPrimaryColor.withOpacity(.2),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          ManropeText.semiBold(
                                              "Apartment Information",
                                              13,
                                              kcBlackColor)
                                        ],
                                      ),
                                    ),
                                  ),
                                ]),
                              ),
                              if (viewModel.selectedId ==
                                  viewModel.newApartmentList[index].id) ...[
                                Positioned.fill(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color:
                                          const Color.fromARGB(100, 22, 44, 33),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      FadeInLeft(
                                        animate: viewModel.animate,
                                        child: InkWell(
                                          splashColor: Colors.red.shade200,
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          onTap: () {},
                                          child: Container(
                                            padding: const EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              color: kcWhiteColor,
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              border: Border.all(
                                                color: Colors.white,
                                              ),
                                            ),
                                            child: const Icon(
                                              Icons.delete,
                                              size: 18,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ),
                                      ),
                                      horizontalSpaceSmall,
                                      FadeInRight(
                                        animate: viewModel.animate,
                                        child: InkWell(
                                          splashColor: Colors.blue.shade200,
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          onTap: () {},
                                          child: Container(
                                            padding: const EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              color: kcWhiteColor,
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              border: Border.all(
                                                color: Colors.white,
                                              ),
                                            ),
                                            child: const Icon(
                                              Icons.edit,
                                              size: 18,
                                              color: Colors.blue,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ]
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          width: 10,
                        );
                      },
                      itemCount: viewModel.newApartmentList.length),
                ),
                verticalSpaceFifteen
              ],
              Row(
                children: [
                  const Icon(Feather.info),
                  horizontalSpaceSmall,
                  ManropeText.semiBold(
                      "Apartment Information", 13, kcBlackColor),
                  const Spacer(),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: kcVeryLightGrey,
                    ),
                    child: ManropeText.bold(
                      viewModel.currentApartmentId,
                      13,
                      kcBlackColor,
                      spacing: 0.6,
                    ),
                  )
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
              RichText(
                text: TextSpan(
                    text: "+ Add Apartment",
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        viewModel.addApartment();
                      },
                    style: manropeMediumFonts.copyWith(
                      color: kcPrimaryColor,
                      fontSize: 14,
                      decoration: TextDecoration.underline,
                    )),
              ),
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
