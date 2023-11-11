import 'dart:io';

import 'package:aisu_realestate/app/app_exports.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stacked/stacked.dart';

import 'startup_viewmodel.dart';

class StartupView extends StackedView<StartupViewModel> {
  const StartupView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    StartupViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70),
              child: Image.asset(logoNoBg),
            ),
            verticalSpaceLarge,
            SizedBox(
                width: 24,
                height: 24,
                child: Platform.isIOS
                    ? const CupertinoActivityIndicator(
                        color: kcPrimaryColor,
                      )
                    : const CircularProgressIndicator(
                        color: kcPrimaryColor,
                        strokeWidth: 5,
                      ))
          ],
        ),
      ),
    );
  }

  @override
  StartupViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      StartupViewModel();

  @override
  void onViewModelReady(StartupViewModel viewModel) => SchedulerBinding.instance
      .addPostFrameCallback((timeStamp) => viewModel.runStartupLogic());
}
