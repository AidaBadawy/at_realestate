import 'package:aisu_realestate/main.dart';

import 'package:aisu_realestate/models/tenant_model.dart';
import 'package:aisu_realestate/ui/views/payment/add_payment/add_payment_view.form.dart';
import 'package:aisu_realestate/ui/views/payment/payment_viewmodel.dart';
import 'package:aisu_realestate/ui/views/payment/add_payment/tenant_payment.dart';
import 'package:aisu_realestate/ui/widgets/button_widget.dart';
import 'package:aisu_realestate/ui/widgets/input_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

@FormView(fields: [
  FormTextField(
    name: 'landlord',
  ),
  // FormTextField(
  //   name: 'place',
  // ),
  // FormTextField(
  //   name: 'startDate',
  // ),
  // FormTextField(
  //   name: 'endDate',
  // ),
])
class AddPaymentView extends StackedView<PaymentViewModel>
    with $AddPaymentView {
  const AddPaymentView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    PaymentViewModel viewModel,
    Widget? child,
  ) {
    // final formatter = NumberFormat.decimalPattern();

    return Scaffold(
      backgroundColor: kcWhiteColor,
      appBar: AppBar(
        backgroundColor: kcWhiteColor,
        iconTheme: const IconThemeData(color: kcBlackColor),
        title: ManropeText.semiBold("Add New Payment", 16, kcBlackColor),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ExpandedTile(
              leading: const Icon(
                Icons.info_outline,
                color: kcPrimaryColor,
              ),
              theme: const ExpandedTileThemeData(
                headerColor: Colors.white,
                headerRadius: 0.0,
                headerPadding: EdgeInsets.all(0.0),
                leadingPadding: EdgeInsets.all(0),

                // headerSplashColor: Colors.red,
                contentBackgroundColor: Colors.white,
                contentPadding: EdgeInsets.all(0.0),
                contentRadius: 12.0,
              ),
              controller: viewModel.expandedcontroller,
              title: ManropeText.bold("Payment Selection", 14, kcBlackColor),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpaceSmall,
                  ManropeText.semiBold("Select Payment", 14, kcBlackColor),
                  verticalSpaceSmall,
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(color: kcLightGrey),
                    ),
                    child: ButtonTheme(
                      alignedDropdown: false,
                      child: DropdownButton(
                        underline: const SizedBox(),
                        isExpanded: true,
                        borderRadius: BorderRadius.circular(10),
                        hint: ManropeText.regular(
                            "Select payment type", 11, kcLightGrey),
                        value: viewModel.paymentTypeSelected != ""
                            ? viewModel.paymentTypeSelected
                            : null,
                        items: viewModel.paymentType
                            .map((e) => DropdownMenuItem(
                                  value: e,
                                  child:
                                      ManropeText.regular(e, 13, kcBlackColor),
                                ))
                            .toList(),
                        onChanged: (value) {
                          viewModel.setSelectedPaymentType(value!);
                        },
                      ),
                    ),
                  ),
                  verticalSpaceFifteen,
                  if (viewModel.paymentTypeSelected == "Tenant Payment") ...[
                    const TenantPayment(),

                    // if (viewModel.tenantSelected.id != "") ...[
                    //   ManropeText.semiBold(
                    //       "Select Payment Type", 14, kcBlackColor),
                    //   verticalSpaceSmall,
                    //   Container(
                    //     padding: const EdgeInsets.symmetric(horizontal: 10),
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(7),
                    //       border: Border.all(color: kcLightGrey),
                    //     ),
                    //     child: ButtonTheme(
                    //       alignedDropdown: false,
                    //       child: DropdownButton(
                    //         underline: const SizedBox(),
                    //         isExpanded: true,
                    //         borderRadius: BorderRadius.circular(10),
                    //         hint: ManropeText.regular(
                    //             "Select payment type", 11, kcLightGrey),
                    //         value: viewModel.paymentCategorySelected != ""
                    //             ? viewModel.paymentCategorySelected
                    //             : null,
                    //         items: viewModel.paymentCategory
                    //             .map((e) => DropdownMenuItem(
                    //                   value: e,
                    //                   child: ManropeText.regular(
                    //                       e, 13, kcBlackColor),
                    //                 ))
                    //             .toList(),
                    //         onChanged: (value) {
                    //           viewModel.setSelectedPaymentCategory(value!);
                    //         },
                    //       ),
                    //     ),
                    //   ),
                    //   verticalSpaceSmall,
                    //   // ManropeText.semiBold(
                    //   //     "${viewModel.paymentCategorySelected} Summary",
                    //   //     14,
                    //   //     kcBlackColor),
                    // ],
                  ],
                ],
              ),
              onTap: () {
                debugPrint("tapped!!");
              },
              onLongTap: () {
                debugPrint("long tapped!!");
              },
            ),
            verticalSpaceFifteen,
            // if (viewModel.paymentCategorySelected != "") ...[
            //   ExpandedTile(
            //     leading: const Icon(
            //       Icons.info_outline,
            //       color: kcPrimaryColor,
            //     ),
            //     title: ManropeText.bold(
            //         "${viewModel.paymentCategorySelected} Details",
            //         14,
            //         kcBlackColor),
            //     onTap: () {
            //       debugPrint("tapped!!");
            //     },
            //     onLongTap: () {
            //       debugPrint("long tapped!!");
            //     },
            //     theme: const ExpandedTileThemeData(
            //       headerColor: Colors.white,
            //       headerRadius: 0.0,
            //       headerPadding: EdgeInsets.all(0.0),
            //       leadingPadding: EdgeInsets.all(0),
            //       // headerSplashColor: Colors.red,
            //       contentBackgroundColor: Colors.white,
            //       contentPadding: EdgeInsets.all(0.0),
            //       contentRadius: 12.0,
            //     ),
            //     controller: viewModel.expandedcontrollerTwo,
            //     content: Column(
            //       children: [
            //         if (viewModel.paymentCategorySelected == "Deposit") ...[
            //           verticalSpaceSmall,
            //           const Row(
            //             children: [
            //               Expanded(
            //                 child: HomeCardWidget(
            //                   title: "Monthly Rent",
            //                   data: "34,000 KSH",
            //                   cardColor: kcGreenHighlight,
            //                   iconColor: kcGreenColor,
            //                   textColor: kcBlackColor,
            //                   icon: coinIcon,
            //                   dataFontSize: 18,
            //                   titleFontSize: 14,
            //                 ),
            //               ),
            //               horizontalSpaceSmall,
            //               Expanded(
            //                 child: HomeCardWidget(
            //                   title: "Deposit",
            //                   data: "68,000 KSH",
            //                   cardColor: kcPrimaryColorHighlight,
            //                   iconColor: kcPrimaryColor,
            //                   textColor: kcBlackColor,
            //                   icon: coinIcon,
            //                   dataFontSize: 18,
            //                   titleFontSize: 14,
            //                 ),
            //               )
            //             ],
            //           ),
            //           verticalSpaceMedium,
            //           Row(
            //             children: [
            //               const Icon(
            //                 Icons.info_outline,
            //                 color: kcRedColor,
            //               ),
            //               horizontalSpaceTiny,
            //               ManropeText.semiBold(
            //                   "Tenant Unavailable", 14, kcRedColor),
            //             ],
            //           )
            //         ],
            //         if (viewModel.paymentCategorySelected == "Expense") ...[],
            //         if (viewModel.paymentCategorySelected == "Rent") ...[
            //           verticalSpaceSmall,
            //           if (viewModel.propertySelected.tenantModel != null) ...[
            //             Row(
            //               children: [
            //                 Expanded(
            //                   child: HomeCardWidget(
            //                     title: "Monthly Rent",
            //                     data: formatter.format(viewModel
            //                         .propertySelected
            //                         .tenantModel!
            //                         .rentPayment!),
            //                     isProperty: true,
            //                     cardColor: kcGreenHighlight,
            //                     iconColor: kcGreenColor,
            //                     textColor: kcBlackColor,
            //                     icon: coinIcon,
            //                     dataFontSize: 20,
            //                     titleFontSize: 15,
            //                   ),
            //                 ),
            //                 horizontalSpaceSmall,
            //                 Expanded(
            //                   child: HomeCardWidget(
            //                     title: "Balance C/f",
            //                     data: formatter.format(viewModel
            //                         .propertySelected
            //                         .tenantModel!
            //                         .balancePayment!),
            //                     isProperty: true,
            //                     cardColor: kcPrimaryColorHighlight,
            //                     iconColor: kcPrimaryColor,
            //                     textColor: kcBlackColor,
            //                     icon: coinIcon,
            //                     dataFontSize: 20,
            //                     titleFontSize: 15,
            //                   ),
            //                 )
            //               ],
            //             ),
            //             verticalSpaceFifteen,
            //             Row(
            //               children: [
            //                 Expanded(
            //                   child: HomeCardWidget(
            //                     title: "Tenant",
            //                     data: viewModel
            //                         .propertySelected.tenantModel!.name!,
            //                     cardColor: kcGreenHighlight,
            //                     iconColor: kcGreenColor,
            //                     textColor: kcBlackColor,
            //                     icon: personIcon,
            //                     dataFontSize: 16,
            //                     titleFontSize: 15,
            //                   ),
            //                 ),
            //                 horizontalSpaceSmall,
            //                 Expanded(
            //                   child: HomeCardWidget(
            //                     title: "Last Payment",
            //                     data: viewModel.propertySelected.tenantModel!
            //                                 .lastPayment ==
            //                             null
            //                         ? "N/A"
            //                         : DateFormat("dd-MM-yy").format(viewModel
            //                             .propertySelected
            //                             .tenantModel!
            //                             .lastPayment!),
            //                     // data: "08-10-23",
            //                     cardColor: kcPrimaryColorHighlight,
            //                     iconColor: kcPrimaryColor,
            //                     textColor: kcBlackColor,
            //                     icon: calendarIcon,
            //                     dataFontSize: 20,
            //                     titleFontSize: 15,
            //                   ),
            //                 )
            //               ],
            //             ),
            //             verticalSpaceMedium,
            //           ] else
            //             Row(
            //               children: [
            //                 const Icon(
            //                   Icons.info_outline,
            //                   color: kcRedColor,
            //                 ),
            //                 horizontalSpaceTiny,
            //                 ManropeText.semiBold(
            //                     "Tenant Unavailable", 14, kcRedColor),
            //               ],
            //             )
            //         ],
            //       ],
            //     ),
            //   ),
            //   verticalSpaceSmall,
            //   ExpandedTile(
            //     leading: const Icon(
            //       Icons.info_outline,
            //       color: kcPrimaryColor,
            //     ),
            //     title: ManropeText.bold("Make Payment", 14, kcBlackColor),
            //     onTap: () {
            //       debugPrint("tapped!!");
            //     },
            //     onLongTap: () {
            //       debugPrint("long tapped!!");
            //     },
            //     theme: const ExpandedTileThemeData(
            //       headerColor: Colors.white,
            //       headerRadius: 0.0,
            //       headerPadding: EdgeInsets.all(0.0),
            //       leadingPadding: EdgeInsets.all(0),
            //       // headerSplashColor: Colors.red,
            //       contentBackgroundColor: Colors.white,
            //       contentPadding: EdgeInsets.all(0.0),
            //       contentRadius: 12.0,
            //     ),
            //     controller: viewModel.expandedcontrollerThree,
            //     content: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         verticalSpaceSmall,
            //         ManropeText.semiBold("Payment mode", 14, kcBlackColor),
            //         verticalSpaceSmall,
            //         Container(
            //           padding: const EdgeInsets.symmetric(horizontal: 10),
            //           decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(7),
            //             border: Border.all(color: kcLightGrey),
            //           ),
            //           child: ButtonTheme(
            //             alignedDropdown: false,
            //             child: DropdownButton(
            //               underline: const SizedBox(),
            //               isExpanded: true,
            //               borderRadius: BorderRadius.circular(10),
            //               hint: ManropeText.regular(
            //                   "Select payment mode", 11, kcLightGrey),
            //               value: viewModel.selectedPayBy != ""
            //                   ? viewModel.selectedPayBy
            //                   : null,
            //               items: viewModel.payByList
            //                   .map((e) => DropdownMenuItem(
            //                         value: e,
            //                         child: ManropeText.regular(
            //                             e, 13, kcBlackColor),
            //                       ))
            //                   .toList(),
            //               onChanged: (value) {
            //                 viewModel.setSelectedPayBy(value!);
            //               },
            //             ),
            //           ),
            //         ),
            //         if (viewModel.selectedPayBy != "Cash") ...[
            //           verticalSpaceSmall,
            //           ManropeText.semiBold("Reference code", 14, kcBlackColor),
            //           verticalSpaceSmall,
            //           SizedBox(
            //             height: 55,
            //             child: TextFormField(
            //               keyboardType: TextInputType.name,
            //               style: manropeRegularFonts.copyWith(fontSize: 12),
            //               decoration: InputDecoration(
            //                 hintText: "code",
            //                 hintStyle: manropeRegularFonts.copyWith(
            //                     fontSize: 12, color: kcLightGrey),
            //                 contentPadding: const EdgeInsets.symmetric(
            //                     horizontal: 10, vertical: 15),
            //                 border: OutlineInputBorder(
            //                   borderRadius: BorderRadius.circular(5),
            //                   borderSide: const BorderSide(color: kcLightGrey),
            //                 ),
            //                 enabledBorder: OutlineInputBorder(
            //                   borderRadius: BorderRadius.circular(5),
            //                   borderSide: const BorderSide(color: kcLightGrey),
            //                 ),
            //                 focusedBorder: OutlineInputBorder(
            //                   borderRadius: BorderRadius.circular(5),
            //                   borderSide: const BorderSide(color: kcMediumGrey),
            //                 ),
            //               ),
            //             ),
            //           ),
            //         ],
            //         if (viewModel.paymentCategorySelected == "Expense") ...[
            //           verticalSpaceSmall,
            //           ManropeText.semiBold("Description", 14, kcBlackColor),
            //           verticalSpaceSmall,
            //           SizedBox(
            //             height: 55,
            //             child: TextFormField(
            //               keyboardType: TextInputType.name,
            //               style: manropeRegularFonts.copyWith(fontSize: 12),
            //               decoration: InputDecoration(
            //                 hintText: "Description",
            //                 hintStyle: manropeRegularFonts.copyWith(
            //                     fontSize: 12, color: kcLightGrey),
            //                 contentPadding: const EdgeInsets.symmetric(
            //                     horizontal: 10, vertical: 15),
            //                 border: OutlineInputBorder(
            //                   borderRadius: BorderRadius.circular(5),
            //                   borderSide: const BorderSide(color: kcLightGrey),
            //                 ),
            //                 enabledBorder: OutlineInputBorder(
            //                   borderRadius: BorderRadius.circular(5),
            //                   borderSide: const BorderSide(color: kcLightGrey),
            //                 ),
            //                 focusedBorder: OutlineInputBorder(
            //                   borderRadius: BorderRadius.circular(5),
            //                   borderSide: const BorderSide(color: kcMediumGrey),
            //                 ),
            //               ),
            //             ),
            //           ),
            //         ],
            //         verticalSpaceSmall,
            //         ManropeText.semiBold("Paid by", 14, kcBlackColor),
            //         verticalSpaceSmall,
            //         SizedBox(
            //           height: 55,
            //           child: TextFormField(
            //             keyboardType: TextInputType.name,
            //             style: manropeRegularFonts.copyWith(fontSize: 12),
            //             decoration: InputDecoration(
            //               hintText: "Name",
            //               hintStyle: manropeRegularFonts.copyWith(
            //                   fontSize: 12, color: kcLightGrey),
            //               contentPadding: const EdgeInsets.symmetric(
            //                   horizontal: 10, vertical: 15),
            //               border: OutlineInputBorder(
            //                 borderRadius: BorderRadius.circular(5),
            //                 borderSide: const BorderSide(color: kcLightGrey),
            //               ),
            //               enabledBorder: OutlineInputBorder(
            //                 borderRadius: BorderRadius.circular(5),
            //                 borderSide: const BorderSide(color: kcLightGrey),
            //               ),
            //               focusedBorder: OutlineInputBorder(
            //                 borderRadius: BorderRadius.circular(5),
            //                 borderSide: const BorderSide(color: kcMediumGrey),
            //               ),
            //             ),
            //           ),
            //         ),
            //         verticalSpaceSmall,
            //         ManropeText.semiBold("Mobile No", 14, kcBlackColor),
            //         verticalSpaceSmall,
            //         SizedBox(
            //           height: 55,
            //           child: TextFormField(
            //             keyboardType: TextInputType.name,
            //             style: manropeRegularFonts.copyWith(fontSize: 12),
            //             decoration: InputDecoration(
            //               hintText: "Mobile",
            //               hintStyle: manropeRegularFonts.copyWith(
            //                   fontSize: 12, color: kcLightGrey),
            //               contentPadding: const EdgeInsets.symmetric(
            //                   horizontal: 10, vertical: 15),
            //               border: OutlineInputBorder(
            //                 borderRadius: BorderRadius.circular(5),
            //                 borderSide: const BorderSide(color: kcLightGrey),
            //               ),
            //               enabledBorder: OutlineInputBorder(
            //                 borderRadius: BorderRadius.circular(5),
            //                 borderSide: const BorderSide(color: kcLightGrey),
            //               ),
            //               focusedBorder: OutlineInputBorder(
            //                 borderRadius: BorderRadius.circular(5),
            //                 borderSide: const BorderSide(color: kcMediumGrey),
            //               ),
            //             ),
            //           ),
            //         ),
            //         verticalSpaceSmall,
            //         ManropeText.semiBold("Amount", 14, kcBlackColor),
            //         verticalSpaceSmall,
            //         SizedBox(
            //           height: 55,
            //           child: TextFormField(
            //             keyboardType: TextInputType.number,
            //             style: manropeRegularFonts.copyWith(fontSize: 12),
            //             decoration: InputDecoration(
            //               hintText: "Amount",
            //               hintStyle: manropeRegularFonts.copyWith(
            //                   fontSize: 12, color: kcLightGrey),
            //               contentPadding: const EdgeInsets.symmetric(
            //                   horizontal: 10, vertical: 15),
            //               border: OutlineInputBorder(
            //                 borderRadius: BorderRadius.circular(5),
            //                 borderSide: const BorderSide(color: kcLightGrey),
            //               ),
            //               enabledBorder: OutlineInputBorder(
            //                 borderRadius: BorderRadius.circular(5),
            //                 borderSide: const BorderSide(color: kcLightGrey),
            //               ),
            //               focusedBorder: OutlineInputBorder(
            //                 borderRadius: BorderRadius.circular(5),
            //                 borderSide: const BorderSide(color: kcMediumGrey),
            //               ),
            //             ),
            //           ),
            //         ),
            //         verticalSpaceMedium,
            //       ],
            //     ),
            //   ),
            // ],
            verticalSpaceMassive,
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ButtonWidget(
          height: 50,
          text: "Make Payment",
          onTap: () {},
          isBusy: false,
          isDisabled: true,
        ),
      ),
    );
  }

  @override
  PaymentViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      PaymentViewModel();

  @override
  void onViewModelReady(PaymentViewModel viewModel) {
    viewModel.initAddPayment();
    // syncFormWithViewModel(viewModel);

    super.onViewModelReady(viewModel);
  }

  @override
  void onDispose(viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }
}
