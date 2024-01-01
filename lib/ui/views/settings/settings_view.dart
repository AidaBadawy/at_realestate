import 'package:aisu_realestate/app/app_exports.dart';
import 'package:aisu_realestate/ui/common/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:stacked/stacked.dart';

import 'settings_viewmodel.dart';

class SettingsView extends StackedView<SettingsViewModel> {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SettingsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                leading: const Icon(
                  Feather.log_out,
                  size: 22,
                  color: kcRedColor,
                ),
                title: ManropeText.bold(ksLogout, 12, kcRedColor),
                minLeadingWidth: 0,
                selectedTileColor: kcRedColor.withOpacity(.1),
                selectedColor: kcPrimaryColor,
                selected: true,
                onTap: () => viewModel.logout(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  SettingsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SettingsViewModel();
}
