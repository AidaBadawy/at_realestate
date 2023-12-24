import 'package:aisu_realestate/app/app_exports.dart';
import 'package:aisu_realestate/models/apartment_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';

class ApartmentCard extends StatelessWidget {
  final ApartmentModel apartment;
  final Function delete;
  const ApartmentCard(
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
      child: ListTile(
        tileColor: kcPrimaryColorHighlight,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        title: ManropeText.semiBold(apartment.name, 14, kcBlackColor),
        subtitle: RichText(
          maxLines: 1,
          text: TextSpan(
              text: "${apartment.area}, ",
              style: manropeMediumFonts.copyWith(
                  color: kcBlackColor, fontSize: 12),
              children: [
                TextSpan(
                  text: "${apartment.street}, ",
                  style: manropeMediumFonts.copyWith(
                      color: kcBlackColor, fontSize: 12),
                ),
                TextSpan(
                  text: apartment.city,
                  style: manropeMediumFonts.copyWith(
                      color: kcBlackColor, fontSize: 12),
                ),
              ]),
        ),
        leading: CircleAvatar(
          backgroundColor: kcBlueColor,
          child: SvgPicture.asset(
            buildingTwoIcon,
            height: 20,
            color: kcWhiteColor,
          ),
        ),
      ),
    );
  }
}

class SampleCard extends StatelessWidget {
  const SampleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 70,
      color: Colors.red,
    );
  }
}
