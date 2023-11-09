import 'package:aisu_realestate/app/app_exports.dart';
import 'package:aisu_realestate/ui/views/listings/listings_viewmodel.dart';
import 'package:aisu_realestate/ui/widgets/document_list_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class LandlordTabView extends StatelessWidget {
  final ListingsViewModel viewModel;

  const LandlordTabView({super.key, required this.viewModel});

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
                      "Landlord Information", 13, kcBlackColor),
                  const Spacer(),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: kcVeryLightGrey,
                    ),
                    child: ManropeText.bold(
                      viewModel.appIdData.landlordNumber,
                      13,
                      kcBlackColor,
                      spacing: 0.6,
                    ),
                  )
                ],
              ),
              verticalSpaceMedium,
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: ManropeText.medium("Name", 12, kcBlackColor),
              ),
              verticalSpaceTiny,
              SizedBox(
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  style: manropeRegularFonts.copyWith(fontSize: 12),
                  initialValue: viewModel.landlordModel.name,
                  validator: (value) => EmptyStringValidator.validate(value!),
                  onChanged: (value) {
                    viewModel.updateLandlordDetails(value, "name");
                  },
                  decoration: InputDecoration(
                    hintText: "Landlord name",
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
              verticalSpaceSmall,
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: ManropeText.medium("Phone", 12, kcBlackColor),
                        ),
                        verticalSpaceTiny,
                        SizedBox(
                          child: TextFormField(
                            initialValue: viewModel.landlordModel.phone,
                            validator: (value) =>
                                EmptyStringValidator.validate(value!),
                            onChanged: (value) {
                              viewModel.updateLandlordDetails(value, "phone");
                            },
                            keyboardType: TextInputType.phone,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp("[0-9]")),
                            ],
                            style: manropeRegularFonts.copyWith(fontSize: 12),
                            decoration: InputDecoration(
                              hintText: "Phone number",
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
                          child: ManropeText.medium("Email", 12, kcBlackColor),
                        ),
                        verticalSpaceTiny,
                        SizedBox(
                          child: TextFormField(
                            initialValue: viewModel.landlordModel.email,
                            validator: (value) =>
                                EmptyStringValidator.validate(value!),
                            onChanged: (value) {
                              viewModel.updateLandlordDetails(value, "email");
                            },
                            keyboardType: TextInputType.emailAddress,
                            style: manropeRegularFonts.copyWith(fontSize: 12),
                            decoration: InputDecoration(
                              hintText: "Email address",
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
              verticalSpaceSmall,
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: ManropeText.medium("ID Number", 12, kcBlackColor),
              ),
              verticalSpaceTiny,
              SizedBox(
                child: TextFormField(
                  initialValue: viewModel.landlordModel.idNumber,
                  validator: (value) => EmptyStringValidator.validate(value!),
                  onChanged: (value) {
                    viewModel.updateLandlordDetails(value, "id_number");
                  },
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                  ],
                  style: manropeRegularFonts.copyWith(fontSize: 12),
                  decoration: InputDecoration(
                    hintText: "ID number",
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
                  ManropeText.semiBold("Landlord Documents", 13, kcBlackColor),
                  const Spacer(),
                  ElevatedButton.icon(
                    onPressed: () => viewModel.pickFile(),
                    icon: const Icon(Icons.add),
                    label: ManropeText.semiBold("Upload", 13, kcWhiteColor),
                  )
                ],
              ),
              verticalSpaceMedium,
              ...List.generate(
                viewModel.documentsList.length,
                (index) => DocumentListCard(
                  name: viewModel.documentsList[index].name,
                  onView: () {
                    viewModel.showBottomSheet(viewModel.documentsList[index]);
                  },
                  onDelete: () {
                    viewModel.deleteDocument(viewModel.documentsList[index].id);
                  },
                ),
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
