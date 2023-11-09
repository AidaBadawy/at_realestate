import 'package:aisu_realestate/app/app_exports.dart';
import 'package:aisu_realestate/models/property_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';

class PropertyCard extends StatelessWidget {
  final PropertyModel apartment;
  final Function delete;
  const PropertyCard(
      {super.key, required this.apartment, required this.delete});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (value) => delete(),
            backgroundColor: const Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
          SlidableAction(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
            onPressed: (value) {},
            backgroundColor: const Color(0xFF21B7CA),
            foregroundColor: Colors.white,
            icon: Icons.edit,
            label: 'Edit',
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: kcPrimaryColor.withOpacity(.2),
        ),
        height: 100,
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: kcPrimaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                  )),
              width: 10,
              height: double.infinity,
            ),
            horizontalSpaceSmall,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpaceSmall,
                  RichText(
                    maxLines: 2,
                    text: TextSpan(
                      text: apartment.flat,
                      style: manropeBoldFonts.copyWith(
                          color: kcBlackColor, fontSize: 16),
                    ),
                  ),
                  const Spacer(),
                  // Row(
                  //   children: [
                  //     SvgPicture.asset(
                  //       locationIcon,
                  //       height: 18,
                  //     ),
                  //     horizontalSpaceTiny,
                  //     ManropeText.medium("Mombasa", 14, kcBlackColor)
                  //   ],
                  // ),
                  verticalSpaceTiny,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: SvgPicture.asset(
                          mapPinIcon,
                          height: 18,
                        ),
                      ),
                      horizontalSpaceSmall,
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ManropeText.medium(apartment.floor, 14, kcBlackColor),
                          verticalSpaceTiny,
                          ManropeText.medium(
                              "${apartment.room}, ${apartment.bath}",
                              14,
                              kcBlackColor)
                        ],
                      ))
                    ],
                  ),
                  verticalSpaceSmall,
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: kcWhiteColor,
              ),
              child: ManropeText.bold(
                apartment.propertyNumber,
                13,
                kcBlackColor,
                spacing: 0.6,
              ),
            ),
            horizontalSpaceSmall,
          ],
        ),
      ),
    );
  }
}
