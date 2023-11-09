import 'package:aisu_realestate/ui/common/app_images.dart';
import 'package:aisu_realestate/ui/common/box_text.dart';
import 'package:aisu_realestate/ui/common/styles.dart';
import 'package:aisu_realestate/ui/widgets/column_graph_widget.dart';
import 'package:aisu_realestate/ui/widgets/doughnut_widget.dart';
import 'package:aisu_realestate/ui/widgets/home_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:aisu_realestate/ui/common/app_colors.dart';
import 'package:aisu_realestate/ui/common/ui_helpers.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpaceFifteen,
                    const Row(
                      children: [
                        Expanded(
                          child: HomeCardWidget(
                            title: "Properties",
                            data: "24",
                            cardColor: kcPrimaryColorHighlight,
                            iconColor: kcPrimaryColor,
                            textColor: kcBlackColor,
                            icon: buildingIcon,
                            dataFontSize: 24,
                            titleFontSize: 16,
                          ),
                        ),
                        horizontalSpaceSmall,
                        Expanded(
                          child: HomeCardWidget(
                            title: "Tenants",
                            data: "24",
                            cardColor: kcPrimaryColorHighlight,
                            iconColor: kcPrimaryColor,
                            textColor: kcBlackColor,
                            icon: usersTwoIcon,
                            dataFontSize: 24,
                            titleFontSize: 16,
                          ),
                        )
                      ],
                    ),
                    verticalSpaceSmall,
                    Row(
                      children: [
                        const Expanded(
                          child: HomeCardWidget(
                            title: "Landlords",
                            data: "7",
                            cardColor: kcPrimaryColorHighlight,
                            iconColor: kcPrimaryColor,
                            textColor: kcBlackColor,
                            icon: landlordTwoIcon,
                            dataFontSize: 24,
                            titleFontSize: 16,
                          ),
                        ),
                        horizontalSpaceSmall,
                        Expanded(
                          child: HomeCardWidget(
                            title: "Vacant",
                            data: "0",
                            cardColor: kcRedColor.withOpacity(.1),
                            iconColor: kcRedColor,
                            textColor: kcRedColor,
                            icon: buildingIcon,
                            dataFontSize: 24,
                            titleFontSize: 16,
                          ),
                        )
                      ],
                    ),

                    // SfCartesianChart(
                    //     // primaryXAxis: DateTimeAxis(),
                    //     series: <ChartSeries>[
                    //       // Renders line chart
                    //       LineSeries<SalesData, int>(
                    //           dataSource: viewModel.chartData,
                    //           xValueMapper: (SalesData sales, _) => sales.year,
                    //           yValueMapper: (SalesData sales, _) => sales.sales)
                    //     ])
                  ],
                ),
              ),
            ),
            // const SliverToBoxAdapter(
            //   child: verticalSpaceMedium,
            // ),
            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpaceMedium,
                    Row(
                      children: [
                        ManropeText.bold("Earnings", 16, kcBlackColor),
                        const Spacer(),
                        ButtonTheme(
                          alignedDropdown: true,
                          child: DropdownButton(
                            underline: const SizedBox.shrink(),
                            isExpanded: false,
                            padding: EdgeInsets.zero,
                            isDense: true,
                            alignment: Alignment.centerRight,
                            borderRadius: BorderRadius.circular(8),
                            hint: ManropeText.regular(
                                "Select Filter", 11, kcLightGrey),
                            value: viewModel.selectedFilter != ""
                                ? viewModel.selectedFilter
                                : null,
                            items: viewModel.filters
                                .map((e) => DropdownMenuItem(
                                      value: e,
                                      child: ManropeText.black(
                                          e, 14, kcBlackColor),
                                    ))
                                .toList(),
                            onChanged: (value) {
                              viewModel.setSelectedFilter(value!);
                            },
                          ),
                        ),
                      ],
                    ),
                    verticalSpaceSmall,
                    GestureDetector(
                      onTap: () {
                        viewModel.setBarTapped();
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: kcLightGrey),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      ManropeText.semiBold(
                                          "Earning in ", 14, kcBlackColor),
                                      Container(
                                        // color: Colors.red.shade300,
                                        child: ButtonTheme(
                                          alignedDropdown: false,
                                          padding: const EdgeInsets.all(20),
                                          // layoutBehavior:
                                          //     ButtonBarLayoutBehavior
                                          //         .constrained,
                                          child: DropdownButton(
                                            underline: const SizedBox.shrink(),
                                            isExpanded: false,
                                            padding: EdgeInsets.zero,
                                            alignment: Alignment.centerLeft,
                                            isDense: true,
                                            icon: const SizedBox.shrink(),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            hint: ManropeText.regular(
                                                "Select Month",
                                                11,
                                                kcLightGrey),
                                            value: viewModel.selectedMonth != ""
                                                ? viewModel.selectedMonth
                                                : null,
                                            items: viewModel.months
                                                .map((e) => DropdownMenuItem(
                                                      value: e,
                                                      child:
                                                          ManropeText.semiBold(
                                                              e,
                                                              14,
                                                              kcPrimaryColor),
                                                    ))
                                                .toList(),
                                            onChanged: (value) {
                                              viewModel.setSelectedCity(value!);
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  verticalSpaceFifteen,
                                  Hero(
                                    tag: "home-price",
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            text: "KES ",
                                            style: manropeBlackFonts.copyWith(
                                              color: kcBlackColor,
                                              fontSize: 20,
                                            ),
                                            children: [
                                              TextSpan(
                                                text: "28,000",
                                                style:
                                                    manropeBlackFonts.copyWith(
                                                  color: kcBlackColor,
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        horizontalSpaceTiny,
                                        RichText(
                                          text: TextSpan(
                                            text: "+365",
                                            style: manropeBlackFonts.copyWith(
                                              color: kcLightGrey,
                                              fontSize: 13,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 100,
                              height: 80,
                              child: ColumnGraphWidget(
                                data: viewModel.data,
                                showLabel: false,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    verticalSpaceMedium,
                    Row(
                      children: [
                        ManropeText.bold("Rent Payment", 16, kcBlackColor),
                        const Spacer(),
                        ButtonTheme(
                          alignedDropdown: true,
                          child: DropdownButton(
                            underline: const SizedBox.shrink(),
                            isExpanded: false,
                            // padding: EdgeInsets.zero,
                            alignment: Alignment.centerRight,
                            borderRadius: BorderRadius.circular(8),
                            isDense: true,
                            hint: ManropeText.regular(
                                "Select Month", 11, kcLightGrey),
                            value: viewModel.selectedRentMonth != ""
                                ? viewModel.selectedRentMonth
                                : null,
                            items: viewModel.months
                                .map((e) => DropdownMenuItem(
                                      value: e,
                                      child: ManropeText.black(
                                          e, 14, kcBlackColor),
                                    ))
                                .toList(),
                            onChanged: (value) {
                              viewModel.setSelectedRentMonth(value!);
                            },
                          ),
                        ),
                      ],
                    ),
                    verticalSpaceSmall,
                    GestureDetector(
                      onTap: () {
                        viewModel.setDonughtTapped();
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: kcLightGrey),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  verticalSpaceFifteen,
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(top: 5),
                                        height: 10,
                                        width: 10,
                                        color: kcRedColor,
                                      ),
                                      horizontalSpaceSmall,
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          RichText(
                                            text: TextSpan(
                                              text: "Not Paid",
                                              style:
                                                  manropeMediumFonts.copyWith(
                                                color: kcBlackColor,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                          verticalSpaceTiny,
                                          RichText(
                                            text: TextSpan(
                                              text: "KES ",
                                              style: manropeBlackFonts.copyWith(
                                                color: kcBlackColor,
                                                fontSize: 18,
                                              ),
                                              children: [
                                                TextSpan(
                                                  text: "28,000",
                                                  style: manropeBlackFonts
                                                      .copyWith(
                                                    color: kcBlackColor,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  verticalSpaceSmall,
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(top: 5),
                                        height: 10,
                                        width: 10,
                                        color: kcPrimaryColor,
                                      ),
                                      horizontalSpaceSmall,
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          RichText(
                                            text: TextSpan(
                                              text: "Paid",
                                              style:
                                                  manropeMediumFonts.copyWith(
                                                color: kcBlackColor,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                          verticalSpaceTiny,
                                          RichText(
                                            text: TextSpan(
                                              text: "KES ",
                                              style: manropeBlackFonts.copyWith(
                                                color: kcBlackColor,
                                                fontSize: 18,
                                              ),
                                              children: [
                                                TextSpan(
                                                  text: "28,000",
                                                  style: manropeBlackFonts
                                                      .copyWith(
                                                    color: kcBlackColor,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 100,
                              height: 80,
                              child: DoughnutWidget(
                                data: viewModel.chartDataTwo,
                                showLabel: false,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),

        // child: Column(
        //   mainAxisSize: MainAxisSize.max,
        //   mainAxisAlignment: MainAxisAlignment.start,
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     verticalSpaceFifteen,
        //     const Row(
        //       children: [
        //         Expanded(
        //           child: HomeCardWidget(
        //             title: "Properties",
        //             data: "24",
        //             cardColor: kcPrimaryColorHighlight,
        //             iconColor: kcPrimaryColor,
        //             textColor: kcBlackColor,
        //             icon: buildingIcon,
        //           ),
        //         ),
        //         horizontalSpaceSmall,
        //         Expanded(
        //           child: HomeCardWidget(
        //             title: "Tenants",
        //             data: "24",
        //             cardColor: kcPrimaryColorHighlight,
        //             iconColor: kcPrimaryColor,
        //             textColor: kcBlackColor,
        //             icon: usersTwoIcon,
        //           ),
        //         )
        //       ],
        //     ),
        //     verticalSpaceSmall,
        //     Row(
        //       children: [
        //         const Expanded(
        //           child: HomeCardWidget(
        //             title: "Landlords",
        //             data: "7",
        //             cardColor: kcPrimaryColorHighlight,
        //             iconColor: kcPrimaryColor,
        //             textColor: kcBlackColor,
        //             icon: landlordTwoIcon,
        //           ),
        //         ),
        //         horizontalSpaceSmall,
        //         Expanded(
        //           child: HomeCardWidget(
        //             title: "Vacant",
        //             data: "24",
        //             cardColor: kcRedColor.withOpacity(.1),
        //             iconColor: kcRedColor,
        //             textColor: kcRedColor,
        //             icon: buildingIcon,
        //           ),
        //         )
        //       ],
        //     ),
        //     verticalSpaceMedium,
        //     ManropeText.black("Earnings", 20, kcBlackColor),
        //     verticalSpaceSmall,
        //     Container(
        //       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        //       decoration: BoxDecoration(
        //         color: Colors.grey.shade100,
        //         borderRadius: BorderRadius.circular(8),
        //       ),
        //       child: Row(
        //         children: [
        //           Column(
        //             children: [
        //               ManropeText.semiBold(
        //                   "Earning in March", 16, kcBlackColor),
        //               verticalSpaceMedium,
        //             ],
        //           )
        //         ],
        //       ),
        //     )
        //     // SfCartesianChart(
        //     //     // primaryXAxis: DateTimeAxis(),
        //     //     series: <ChartSeries>[
        //     //       // Renders line chart
        //     //       LineSeries<SalesData, int>(
        //     //           dataSource: viewModel.chartData,
        //     //           xValueMapper: (SalesData sales, _) => sales.year,
        //     //           yValueMapper: (SalesData sales, _) => sales.sales)
        //     //     ])
        //   ],
        // ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();

  @override
  void onViewModelReady(HomeViewModel viewModel) {
    viewModel.initHome();
    super.onViewModelReady(viewModel);
  }
}
