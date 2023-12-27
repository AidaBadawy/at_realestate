import 'package:aisu_realestate/app/app_exports.dart';
import 'package:aisu_realestate/ui/common/app_colors.dart';
import 'package:aisu_realestate/ui/common/box_text.dart';
import 'package:aisu_realestate/ui/common/styles.dart';
import 'package:aisu_realestate/ui/common/ui_helpers.dart';
import 'package:aisu_realestate/ui/views/tenants/tenants_viewmodel.dart';
import 'package:aisu_realestate/ui/widgets/document_list_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class TenantDetailTab extends StatelessWidget {
  final TenantsViewModel viewModel;
  const TenantDetailTab({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SingleChildScrollView(
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
                  ManropeText.semiBold("Tenant Information", 13, kcBlackColor)
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
                  validator: (value) => EmptyStringValidator.validate(value!),
                  onChanged: (value) {
                    viewModel.onChangedTenant(value, "name");
                  },
                  decoration: InputDecoration(
                    hintText: "Tenant name",
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
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: ManropeText.medium("Phone", 12, kcBlackColor),
              ),
              verticalSpaceTiny,
              SizedBox(
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  style: manropeRegularFonts.copyWith(fontSize: 12),
                  validator: (value) => EmptyStringValidator.validate(value!),
                  onChanged: (value) {
                    viewModel.onChangedTenant(value, "phone");
                  },
                  decoration: InputDecoration(
                    hintText: "Phone number",
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
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: ManropeText.medium("Email", 12, kcBlackColor),
              ),
              verticalSpaceTiny,
              SizedBox(
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  style: manropeRegularFonts.copyWith(fontSize: 12),
                  validator: (value) =>
                      EmptyStringValidator.validateEmail(value!),
                  onChanged: (value) {
                    viewModel.onChangedTenant(value, "email");
                  },
                  decoration: InputDecoration(
                    hintText: "Email address",
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
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: ManropeText.medium("ID Number", 12, kcBlackColor),
              ),
              verticalSpaceTiny,
              SizedBox(
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  style: manropeRegularFonts.copyWith(fontSize: 12),
                  validator: (value) => EmptyStringValidator.validate(value!),
                  onChanged: (value) {
                    viewModel.onChangedTenant(value, "id_number");
                  },
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
                  ManropeText.semiBold("Tenant Documents", 13, kcBlackColor),
                  const Spacer(),
                  ElevatedButton.icon(
                    onPressed: () => viewModel.pickFile(),
                    icon: const Icon(Icons.add),
                    label: ManropeText.semiBold("Add", 13, kcWhiteColor),
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

              // Padding(
              //     padding: EdgeInsets.only(
              //         bottom: MediaQuery.of(context).viewInsets.bottom))
            ],
          ),
        ),
      ),
    );
  }
}
