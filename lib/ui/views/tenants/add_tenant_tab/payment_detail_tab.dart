import 'package:aisu_realestate/app/app_exports.dart';
import 'package:aisu_realestate/models/property_model.dart';
import 'package:aisu_realestate/ui/views/tenants/tenants_viewmodel.dart';
import 'package:aisu_realestate/ui/widgets/home_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:intl/intl.dart';

class PaymentTenantTab extends StatelessWidget {
  final TenantsViewModel viewModel;
  PaymentTenantTab({super.key, required this.viewModel});

  TextEditingController dateController = TextEditingController();

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
                ManropeText.semiBold("Payment Information", 13, kcBlackColor)
              ],
            ),
            verticalSpaceMedium,
            if (viewModel.selectedProperty != defaultProperty) ...[
              Row(
                children: [
                  Expanded(
                    child: HomeCardWidget(
                      title: "Monthly Rent",
                      data:
                          formatter.format(viewModel.tenantPayload.rentPayment),
                      cardColor: kcGreenHighlight,
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
                          viewModel.tenantPayload.rentPayment! *
                              viewModel.selectedProperty.deposit),
                      cardColor: kcPrimaryColorHighlight,
                      iconColor: kcPrimaryColor,
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
              // verticalSpaceSmall,
              verticalSpaceMedium,
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child:
                    ManropeText.medium("Final Monthly Rent", 12, kcBlackColor),
              ),
              verticalSpaceTiny,
              SizedBox(
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  initialValue: viewModel.tenantPayload.rentPayment!.toString(),
                  style: manropeRegularFonts.copyWith(fontSize: 12),
                  validator: (value) => EmptyStringValidator.validate(value!),
                  onChanged: (value) {
                    viewModel.onChangedTenant(value, "rent");
                  },
                  decoration: InputDecoration(
                    hintText: "Monthly Rent",
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
                child: ManropeText.medium("Payment Date", 12, kcBlackColor),
              ),
              verticalSpaceTiny,
              SizedBox(
                child: TextFormField(
                  style: manropeRegularFonts.copyWith(fontSize: 12),
                  initialValue: DateFormat("dd-MMM-yyy")
                      .format(viewModel.tenantPayload.lastPayment!),
                  onTap: () async {
                    DateTime? date = await viewModel.selectDate(context);

                    if (date != null) {
                      viewModel.onChangedTenant(date.toIso8601String(), "date");
                    }
                  },
                  readOnly: true,
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
              verticalSpaceFifteen,
              ManropeText.bold(
                  DateFormat("dd-MMM-yyy")
                      .format(viewModel.tenantPayload.lastPayment!),
                  15,
                  kcBlackColor)
            ],
          ],
        ),
      ),
    );
  }
}
