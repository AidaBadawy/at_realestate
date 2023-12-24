import 'package:aisu_realestate/app/app_exports.dart';
import 'package:aisu_realestate/models/property_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class PropertyCard extends StatelessWidget {
  final PropertyModel property;
  final Function delete;
  const PropertyCard({super.key, required this.property, required this.delete});

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat.decimalPattern();

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
      child: ListTile(
        tileColor: kcPrimaryColorHighlight,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        title: ManropeText.semiBold(property.flat, 14, kcBlackColor),
        subtitle:
            // Row(
            //   children: [
            //     SvgPicture.asset(
            //       bedIcon,
            //       height: 16,
            //       // color: kcBlueColor,
            //     ),
            //     horizontalSpaceTiny,
            //     ManropeText.semiBold(property.room, 14, kcBlackColor),
            //   ],
            // ),
            RichText(
          maxLines: 1,
          text: TextSpan(
              text: "${property.room} Room, ",
              style: manropeMediumFonts.copyWith(
                  color: kcBlackColor, fontSize: 13),
              children: [
                TextSpan(
                  text: "${property.bath} Bath, ",
                  style: manropeMediumFonts.copyWith(
                      color: kcBlackColor, fontSize: 13),
                ),
                // TextSpan(
                //   text: property.description,
                //   style: manropeMediumFonts.copyWith(
                //       color: kcBlackColor, fontSize: 12),
                // ),
              ]),
        ),
        leading: CircleAvatar(
          backgroundColor: kcBlueColor,
          child: SvgPicture.asset(
            buildingIcon,
            height: 20,
            color: kcWhiteColor,
          ),
        ),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          decoration: BoxDecoration(
            color: kcBlueColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: ManropeText.semiBold(
              formatter.format(property.monthlyRent), 14, kcWhiteColor),
        ),
      ),
    );
  }
}
