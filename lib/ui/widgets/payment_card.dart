import 'package:aisu_realestate/app/app_exports.dart';
import 'package:aisu_realestate/models/payment_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class PaymentCard extends StatelessWidget {
  final PaymentModel paymentModel;

  final bool isPending;
  const PaymentCard({
    super.key,
    required this.isPending,
    required this.paymentModel,
  });

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat.decimalPattern();

    Color iconColor = kcPrimaryColor;
    Color bgColor = kcPrimaryColorHighlight;

    switch (paymentModel.type) {
      case "Rent":
        iconColor = kcGreenColor;
        bgColor = kcGreenHighlight;

        break;
      case "Expense":
        iconColor = kcAmberColor;
        bgColor = kcLightAmberColor;

        break;
      case "Deposit":
        iconColor = kcPurpleColor;
        bgColor = kcPurpleColorHighlight;

        break;
      default:
    }

    return Container(
      decoration: BoxDecoration(
          color: isPending ? kcRedHighlightTwo : bgColor,
          borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: isPending
                  ? kcRedColor.withOpacity(.2)
                  : iconColor.withOpacity(.2),
            ),
            child: SvgPicture.asset(
              invoiceIcon,
              color: isPending ? kcRedColor : iconColor,
            ),
          ),
          horizontalSpaceSmall,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ManropeText.semiBold("INV-001", 14, kcBlackColor),
                RichText(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                    text: isPending
                        ? paymentModel.expand!.tenant!.name
                        : paymentModel.invoiceNumber,
                    style: manropeSemiBold.copyWith(
                      color: kcBlackColor,
                      fontSize: 14,
                    ),
                  ),
                ),
                verticalSpaceTiny,
                RichText(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                      text: "${paymentModel.type} Payment",
                      style: manropeMediumFonts.copyWith(
                        color: kcBlackColor,
                        fontSize: 14,
                      ),
                      children: [
                        TextSpan(
                          text: " - ",
                          style: manropeRegularFonts.copyWith(
                            color: kcBlackColor,
                            fontSize: 14,
                          ),
                        ),
                        TextSpan(
                          text: "KSH ",
                          style: manropeBoldFonts.copyWith(
                            color: kcBlackColor,
                            fontSize: 14,
                          ),
                        ),
                        TextSpan(
                          text: formatter.format(paymentModel.amount),
                          style: manropeBoldFonts.copyWith(
                            color: kcBlackColor,
                            fontSize: 14,
                          ),
                        )
                      ]),
                ),
              ],
            ),
          ),
          if (!isPending) ...[
            horizontalSpaceSmall,
            PopupMenuButton<String>(
              onSelected: (value) {
                // Handle the selected option here
                print("Selected: $value");
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: SvgPicture.asset(dotsVertIcon),
              itemBuilder: (BuildContext context) {
                return <PopupMenuEntry<String>>[
                  PopupMenuItem<String>(
                    value: 'Option 1',
                    child: ManropeText.regular("View", 15, kcBlackColor),
                  ),
                  PopupMenuItem<String>(
                    value: 'Option 2',
                    child: ManropeText.regular("Download", 15, kcBlackColor),
                  ),
                  PopupMenuItem<String>(
                    value: 'Option 3',
                    child: ManropeText.regular("Share", 15, kcBlackColor),
                  ),
                ];
              },
            )
          ],
        ],
      ),
    );
  }
}
