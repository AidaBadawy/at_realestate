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
    var colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
        body: Stack(
      alignment: Alignment.center,
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                kcBlueColor,
                kcBlueDark,
                kcBlackColor,
              ],
            ),
          ),
        ),
        Opacity(
          opacity: .1,
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(bgSplash), fit: BoxFit.cover),
            ),
          ),
        ),
        Positioned(
          child: Image.asset(
            logoWhite,
            height: 120,
          ),
        ),
        Positioned(
            bottom: 20,
            // right: 20,
            child: SizedBox(
              height: 25,
              width: 25,
              child: Platform.isIOS
                  ? const CupertinoActivityIndicator(
                      color: kcWhiteColor,
                    )
                  : const CircularProgressIndicator(
                      color: kcWhiteColor,
                      strokeWidth: 4,
                    ),
            )
            // RichText(
            //   text: TextSpan(
            //     text: "Loading...",
            //     style: manropeLightFonts.copyWith(
            //       color: kcWhiteColor,
            //       fontSize: 22,
            //     ),
            //     // children: [
            //     //   TextSpan(
            //     //     text: "Real Estate",
            //     //     style: manropeBlackFonts.copyWith(
            //     //       color: kcWhiteColor,
            //     //       fontSize: 28,
            //     //     ),
            //     //   ),
            //     // ],
            //   ),
            // ),
            )
      ],
    )
        // Center(
        //   child: Column(
        //     mainAxisSize: MainAxisSize.min,
        //     children: [
        //       // Padding(
        //       //   padding: const EdgeInsets.symmetric(horizontal: 70),
        //       //   child: Image.asset(logoIcon),
        //       // ),
        //       // verticalSpaceLarge,
        //       // SizedBox(
        //       //   width: 24,
        //       //   height: 24,
        //       //   child: Platform.isIOS
        //       //       ? const CupertinoActivityIndicator(
        //       //           color: kcPrimaryColor,
        //       //         )
        //       //       : const CircularProgressIndicator(
        //       //           color: kcPrimaryColor,
        //       //           strokeWidth: 5,
        //       //         ),
        //       // )
        //     ],
        //   ),
        // ),
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
