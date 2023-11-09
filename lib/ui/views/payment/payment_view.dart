import 'package:aisu_realestate/main.dart';
import 'package:aisu_realestate/ui/common/app_colors.dart';
import 'package:aisu_realestate/ui/widgets/payment_card.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'payment_viewmodel.dart';

class PaymentView extends StackedView<PaymentViewModel> {
  const PaymentView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    PaymentViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: kcWhiteColor,
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
              labelColor: kcBlackColor,
              labelStyle: manropeMediumFonts.copyWith(color: kcBlackColor),
              tabs: const [
                Tab(
                  text: "Recent Payments",
                ),
                Tab(
                  text: "Pending Payments",
                )
              ],
            ),
            verticalSpaceSmall,
            Expanded(
              child: TabBarView(
                children: [
                  ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    itemBuilder: (context, index) {
                      return PaymentCard(
                        paymentModel: viewModel.recentPayment[index],
                        isPending: false,
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider(
                        thickness: 1,
                      );
                    },
                    itemCount: viewModel.recentPayment.length,
                  ),
                  ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    itemBuilder: (context, index) {
                      return PaymentCard(
                        paymentModel: viewModel.pendingPayment[index],
                        isPending: true,
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider(
                        thickness: 1,
                      );
                    },
                    itemCount: viewModel.pendingPayment.length,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => viewModel.navigateToAddPayment(),
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  PaymentViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      PaymentViewModel();
}
