import 'package:aisu_realestate/main.dart';
import 'package:aisu_realestate/ui/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'login_viewmodel.dart';

@FormView(fields: [
  FormTextField(
    name: 'email',
  ),
  FormTextField(
    name: 'password',
  ),
])
class LoginView extends StackedView<LoginViewModel> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.6),
                BlendMode.colorBurn,
              ),
              child: Image.asset(
                loginBg,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            width: size.width,
            height: size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  cursorColor: kcWhiteColor,
                  style: manropeMediumFonts.copyWith(
                      color: kcWhiteColor, fontSize: 14),
                  decoration: InputDecoration(
                    hintText: "Email address",
                    hintStyle: manropeRegularFonts.copyWith(
                        color: kcVeryLightGrey, fontSize: 14),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: const BorderSide(
                        color: kcWhiteColor,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: const BorderSide(
                        color: kcWhiteColor,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: const BorderSide(
                        color: kcWhiteColor,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: const BorderSide(
                        color: kcRedColor,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: const BorderSide(
                        color: kcRedColor,
                      ),
                    ),
                  ),
                ),
                verticalSpaceFifteen,
                TextFormField(
                  cursorColor: kcWhiteColor,
                  style: manropeMediumFonts.copyWith(
                      color: kcWhiteColor, fontSize: 14),
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle: manropeRegularFonts.copyWith(
                        color: kcVeryLightGrey, fontSize: 14),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: const BorderSide(
                        color: kcWhiteColor,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: const BorderSide(
                        color: kcWhiteColor,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: const BorderSide(
                        color: kcWhiteColor,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 15,
            child: Image.asset(
              logoImage,
              height: 180,
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ButtonWidget(
          isBusy: false,
          height: 60,
          fontSize: 16,
          isDisabled: false,
          text: "Login",
          onTap: () {},
        ),
      ),
    );
  }

  @override
  LoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginViewModel();
}
