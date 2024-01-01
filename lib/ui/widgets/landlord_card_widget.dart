import 'package:aisu_realestate/app/app_exports.dart';
import 'package:aisu_realestate/models/landlord_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LandlordCardWidget extends StatelessWidget {
  final LandlordModel landlord;
  const LandlordCardWidget({super.key, required this.landlord});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      decoration: BoxDecoration(
          color: kcPrimaryColorHighlight,
          borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: kcBlueColor.withOpacity(.2),
            ),
            child: SvgPicture.asset(
              landlordTwoIcon,
              color: kcBlueColor,
              height: 25,
            ),
          ),
          horizontalSpaceSmall,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: RichText(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                          text: landlord.name,
                          style: manropeSemiBold.copyWith(
                            color: kcBlackColor,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    ManropeText.bold(landlord.landlordNumber, 14, kcBlackColor)
                  ],
                ),
                verticalSpaceTiny,
                Row(
                  children: [
                    Expanded(
                      child: RichText(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                          text: landlord.phone,
                          style: manropeMediumFonts.copyWith(
                            color: kcBlackColor,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.error_outline,
                      color: kcAmberColor,
                    )
                  ],
                ),
              ],
            ),
          ),
          // if (!isPending) ...[
          //   horizontalSpaceSmall,
          //   PopupMenuButton<String>(
          //     onSelected: (value) {
          //       // Handle the selected option here
          //       print("Selected: $value");
          //     },
          //     shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(10)),
          //     child: SvgPicture.asset(dotsVertIcon),
          //     itemBuilder: (BuildContext context) {
          //       return <PopupMenuEntry<String>>[
          //         PopupMenuItem<String>(
          //           value: 'Option 1',
          //           child: ManropeText.regular("View", 15, kcBlackColor),
          //         ),
          //         PopupMenuItem<String>(
          //           value: 'Option 2',
          //           child: ManropeText.regular("Download", 15, kcBlackColor),
          //         ),
          //         PopupMenuItem<String>(
          //           value: 'Option 3',
          //           child: ManropeText.regular("Share", 15, kcBlackColor),
          //         ),
          //       ];
          //     },
          //   )
          // ],
        ],
      ),
    );
  }
}
