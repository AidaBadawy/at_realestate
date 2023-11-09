import 'package:aisu_realestate/app/app_exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LandlordCardWidget extends StatelessWidget {
  const LandlordCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: kcPrimaryColor.withOpacity(.2),
            ),
            child: SvgPicture.asset(
              landlordTwoIcon,
              color: kcPrimaryColor,
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
                          text: "Aidarus Badawy",
                          style: manropeSemiBold.copyWith(
                            color: kcBlackColor,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    ManropeText.bold("LD-0001", 14, kcBlackColor)
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
                          text: "0701998881",
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
