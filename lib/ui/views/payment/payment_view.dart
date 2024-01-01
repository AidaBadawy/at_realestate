import 'package:aisu_realestate/main.dart';
import 'package:aisu_realestate/ui/widgets/payment_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
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
      appBar: AppBar(
        backgroundColor: kcBlueColor.withOpacity(.7),
        leading: const Icon(Feather.credit_card),
        title: ManropeText.bold("Payments", 16, kcWhiteColor),
      ),
      body: SafeArea(
        child: DefaultTabController(
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
                    RefreshIndicator(
                      onRefresh: () async {
                        viewModel.initPayment();
                      },
                      child: ListView.separated(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        itemBuilder: (context, index) {
                          return PaymentCard(
                            paymentModel: viewModel.recentPayment[index],
                            isPending: false,
                          );
                        },
                        separatorBuilder: (context, index) {
                          // return const Divider(
                          //   thickness: 1,
                          // );
                          return verticalSpaceFifteen;
                        },
                        itemCount: viewModel.recentPayment.length,
                      ),
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
                        // return const Divider(
                        //   thickness: 1,
                        // );
                        return verticalSpaceFifteen;
                      },
                      itemCount: viewModel.pendingPayment.length,
                    ),
                  ],
                ),
              )
            ],
          ),
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

  @override
  void onViewModelReady(PaymentViewModel viewModel) {
    viewModel.initPayment();
    super.onViewModelReady(viewModel);
  }
}
