import 'package:aisu_realestate/app/app_exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TenantCard extends StatelessWidget {
  const TenantCard({
    super.key,
  });

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
              color: kcBlueColor.withOpacity(.2),
            ),
            child: SvgPicture.asset(
              personIcon,
              color: kcBlueColor,
            ),
          ),
          horizontalSpaceSmall,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ManropeText.semiBold("INV-001", 14, kcBlackColor),
                Row(
                  children: [
                    RichText(
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
                    const Spacer(),
                    ManropeText.semiBold("TE-0001", 14, kcBlackColor)
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
                          // children: [
                          //   TextSpan(
                          //     text: " - ",
                          //     style: manropeRegularFonts.copyWith(
                          //       color: kcBlackColor,
                          //       fontSize: 14,
                          //     ),
                          //   ),
                          //   TextSpan(
                          //     text: "KSH ",
                          //     style: manropeBoldFonts.copyWith(
                          //       color: kcBlackColor,
                          //       fontSize: 14,
                          //     ),
                          //   ),
                          //   TextSpan(
                          //     text: "mamamama",
                          //     style: manropeBoldFonts.copyWith(
                          //       color: kcBlackColor,
                          //       fontSize: 14,
                          //     ),
                          //   )
                          // ],
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
