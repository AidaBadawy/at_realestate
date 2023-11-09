import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'reports_viewmodel.dart';

class ReportsView extends StackedView<ReportsViewModel> {
  const ReportsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ReportsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      ),
    );
  }

  @override
  ReportsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ReportsViewModel();
}
