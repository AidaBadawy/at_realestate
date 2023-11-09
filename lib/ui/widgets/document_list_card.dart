import 'package:aisu_realestate/ui/common/app_colors.dart';
import 'package:aisu_realestate/ui/common/box_text.dart';
import 'package:flutter/material.dart';

class DocumentListCard extends StatelessWidget {
  final String name;
  final Function onView;
  final Function onDelete;
  const DocumentListCard(
      {super.key,
      required this.name,
      required this.onView,
      required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: kcPrimaryColor.withOpacity(.1),
      ),
      child: Row(
        children: [
          ManropeText.medium(name, 12, kcBlackColor),
          const Spacer(),
          IconButton(
            onPressed: () => onView(),
            icon: const Icon(
              Icons.visibility,
              color: kcPrimaryColor,
            ),
          ),
          IconButton(
            onPressed: () => onDelete(),
            icon: const Icon(
              Icons.delete_outline_rounded,
              color: kcRedColor,
            ),
          )
        ],
      ),
    );
  }
}
