import 'package:aisu_realestate/app/app_exports.dart';
import 'package:aisu_realestate/models/tenant_model.dart';
import 'package:aisu_realestate/ui/views/payment/add_payment/add_payment_view.form.dart';
import 'package:aisu_realestate/ui/views/payment/payment_viewmodel.dart';
import 'package:aisu_realestate/ui/widgets/home_card_widget_copy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

class TenantPayment extends ViewModelWidget<PaymentViewModel>
    with $AddPaymentView {
  const TenantPayment({super.key});

  @override
  Widget build(BuildContext context, PaymentViewModel viewModel) {
    final formatter = NumberFormat.decimalPattern();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ManropeText.semiBold("Select Tenant", 14, kcBlackColor),
        verticalSpaceSmall,
        TypeAheadField<TenantModel>(
          textFieldConfiguration: TextFieldConfiguration(
            controller: landlordController,
            autofocus: false,
            style: manropeRegularFonts.copyWith(fontSize: 13),
            decoration: inputDecorationOne(
              hint: "Search Tenant",
              suffixIcon:
                  landlordController.text.isNotEmpty ? closeSquare : null,
              onTapSuffix: landlordController.text.isNotEmpty
                  ? () {
                      landlordController.clear();
                      viewModel.clearSelection();
                    }
                  : null,
              enabledColor: kcLightGrey,
              focusedColor: kcLightGrey,
              errorColor: kcRedColor,
            ),
          ),
          suggestionsCallback: (pattern) {
            return viewModel.getSearchTenant(pattern);
          },
          noItemsFoundBuilder: (context) {
            return ListTile(
              title: RichText(
                text: TextSpan(
                  text: "Tenant not found",
                  style: manropeRegularFonts.copyWith(
                    color: kcBlackColor,
                    fontSize: 13,
                  ),
                ),
              ),
            );
          },
          itemBuilder: (context, suggestion) {
            return ListTile(
              title: RichText(
                text: TextSpan(
                  text: suggestion.name,
                  style: manropeRegularFonts.copyWith(
                    color: kcBlackColor,
                    fontSize: 13,
                  ),
                  children: [
                    TextSpan(
                      text: " - ${suggestion.tenantNumber}",
                      style: manropeRegularFonts.copyWith(
                        color: kcBlackColor,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          onSuggestionSelected: (suggestion) {
            landlordController.text =
                "${suggestion.name} - ${suggestion.tenantNumber}";
            viewModel.updateTenantSelected(suggestion);
          },
        ),
        if (viewModel.tenantSelected.id != null) ...[
          verticalSpaceFifteen,
          ManropeText.semiBold("Payment Overview", 16, kcBlackColor),
          verticalSpaceFifteen,
          Row(
            children: [
              Expanded(
                child: HomeCardWidgetCopy(
                  title: "Rent Payment",
                  data: formatter.format(viewModel.tenantSelected.rentPayment),
                  cardColor: kcPrimaryColorHighlight,
                  iconColor: kcPrimaryColor,
                  textColor: kcBlackColor,
                  icon: coinIcon,
                  // iconSize: 60,
                  isProperty: true,
                  dataFontSize: 20,
                  titleFontSize: 14,
                ),
              ),
              horizontalSpaceSmall,
              Expanded(
                child: HomeCardWidgetCopy(
                  title: "Deposit Payment",
                  data: formatter.format(viewModel.tenantSelected.deposit!),
                  cardColor: kcPrimaryColorHighlight,
                  iconColor: kcPrimaryColor,
                  textColor: kcBlackColor,
                  icon: coinIcon,
                  isProperty: true,
                  dataFontSize: 20,
                  titleFontSize: 14,
                ),
              )
            ],
          ),
          verticalSpaceFifteen,
          Row(
            children: [
              Expanded(
                child: HomeCardWidgetCopy(
                  title: "Balance Payment",
                  data:
                      formatter.format(viewModel.tenantSelected.balancePayment),
                  cardColor: kcGreenHighlight,
                  iconColor: kcGreenColor,
                  textColor: kcGreenColor,

                  icon: coinIcon,
                  // isProperty: true,
                  dataFontSize: 20,
                  titleFontSize: 14,
                ),
              ),
              horizontalSpaceSmall,
              Expanded(
                child: HomeCardWidgetCopy(
                  title: "Pending Payment",
                  data:
                      formatter.format(viewModel.tenantSelected.pendingPayment),
                  cardColor: kcRedHighlightTwo,
                  iconColor: kcRedColor,
                  textColor: kcRedColor,
                  datatextColor: kcRedColor,
                  icon: coinIcon,
                  // iconSize: 60,
                  isProperty: true,
                  dataFontSize: 20,
                  titleFontSize: 14,
                ),
              ),
            ],
          ),
          verticalSpaceMedium,
          ManropeText.semiBold("Property Overview", 16, kcBlackColor),
          verticalSpaceFifteen,
          Row(
            children: [
              Expanded(
                child: HomeCardWidgetCopy(
                  title: "Landlord",
                  data: viewModel.tenantSelected.landlord!,
                  cardColor: kcPrimaryColorHighlight,
                  iconColor: kcPrimaryColor,
                  textColor: kcBlackColor,
                  icon: landlordTwoIcon,
                  dataFontSize: 16,
                  titleFontSize: 14,
                  iconSize: 55,
                  height: 70,
                ),
              ),
            ],
          ),
          verticalSpaceFifteen,
          Row(
            children: [
              Expanded(
                child: HomeCardWidgetCopy(
                  title: "Apartment",
                  data: viewModel.tenantSelected.apartment!,
                  cardColor: kcPrimaryColorHighlight,
                  iconColor: kcPrimaryColor,
                  textColor: kcBlackColor,
                  icon: buildingTwoIcon,
                  dataFontSize: 16,
                  titleFontSize: 14,
                  iconSize: 55,
                  height: 70,
                ),
              ),
            ],
          ),
          verticalSpaceFifteen,
          Row(
            children: [
              Expanded(
                child: HomeCardWidgetCopy(
                  title: "Property",
                  data: viewModel.tenantSelected.property!,
                  cardColor: kcPrimaryColorHighlight,
                  iconColor: kcPrimaryColor,
                  textColor: kcBlackColor,
                  icon: buildingIcon,
                  dataFontSize: 16,
                  titleFontSize: 14,
                  iconSize: 55,
                  height: 70,
                ),
              ),
            ],
          ),
          verticalSpaceFifteen,
        ],
      ],
    );
  }
}
