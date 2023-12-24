import 'package:aisu_realestate/ui/common/app_colors.dart';
import 'package:aisu_realestate/ui/common/box_text.dart';
import 'package:flutter/material.dart';

class SnackbarWidget extends StatelessWidget {
  final String title;
  // final Color color;
  const SnackbarWidget({
    super.key,
    required this.title,
    // required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: ManropeText.medium(title, 16, kcWhiteColor),
      duration: const Duration(seconds: 2),
    );
  }
}
