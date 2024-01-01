import 'package:aisu_realestate/main.dart';
import 'package:aisu_realestate/ui/common/enums.dart';
import 'package:aisu_realestate/ui/views/login/login_view.form.dart';
import 'package:aisu_realestate/ui/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
class LoginView extends StackedView<LoginViewModel> with $LoginView {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    viewModel.setIsKeyboardOpen(MediaQuery.of(context).viewInsets.bottom != 0);
    return Scaffold(
      backgroundColor: kcBlueColor,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  kcBlueColor
                      .withOpacity(0.5), // Adjust the opacity of the color
                  BlendMode.srcOver,
                ),
                child: Image.asset(
                  bgHome,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                verticalSpaceLarge,
                Image.asset(
                  logoWhite,
                  height: 80,
                ),
                verticalSpaceLarge,
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: const BoxDecoration(
                      color: kcWhiteColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Form(
                        key: viewModel.loginKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            verticalSpaceLarge,
                            ManropeText.black("Login", 36, kcBlueColor),

                            verticalSpaceLarge,
                            TextFormField(
                              cursorColor: kcPrimaryColor,
                              controller: emailController,
                              focusNode: emailFocusNode,
                              keyboardType: TextInputType.emailAddress,
                              style: manropeMediumFonts.copyWith(
                                  color: kcMediumGrey, fontSize: 14),
                              decoration: InputDecoration(
                                hintText: "Email address",
                                hintStyle: manropeRegularFonts.copyWith(
                                    color: kcLightGrey, fontSize: 14),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7),
                                  borderSide: const BorderSide(
                                    color: kcLightGrey,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7),
                                  borderSide: const BorderSide(
                                    color: kcLightGrey,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7),
                                  borderSide: const BorderSide(
                                    color: kcLightGrey,
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
                              onTapOutside: (val) {
                                emailFocusNode.unfocus();
                              },
                              validator: (value) =>
                                  viewModel.validateEmail(value!),
                            ),
                            verticalSpaceFifteen,
                            TextFormField(
                              cursorColor: kcPrimaryColor,
                              controller: passwordController,
                              focusNode: passwordFocusNode,
                              style: manropeMediumFonts.copyWith(
                                  color: kcMediumGrey, fontSize: 14),
                              obscureText: viewModel.showPassword,
                              decoration: InputDecoration(
                                hintText: "Password",
                                suffixIcon: InkWell(
                                  onTap: () => viewModel.setShowPassword(),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: SvgPicture.asset(
                                      !viewModel.showPassword ? eyeOff : eye,
                                      color: kcGreyOne,
                                    ),
                                  ),
                                ),
                                hintStyle: manropeRegularFonts.copyWith(
                                    color: kcLightGrey, fontSize: 14),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7),
                                  borderSide: const BorderSide(
                                    color: kcLightGrey,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7),
                                  borderSide: const BorderSide(
                                    color: kcLightGrey,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7),
                                  borderSide: const BorderSide(
                                    color: kcLightGrey,
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
                              onTapOutside: (val) {
                                emailFocusNode.unfocus();
                              },
                              validator: (value) =>
                                  viewModel.validatePassword(value!),
                            ),
                            verticalSpaceSmall,
                            Align(
                              alignment: Alignment.centerRight,
                              child: ManropeText.bold(
                                  "Forgot Password?", 14, kcBlueColor),
                            ),
                            // const Spacer(),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      bottomSheet: viewModel.isKeyboardOpen
          ? null
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ButtonWidget(
                    isBusy: viewModel.status == StatusEnum.busy,
                    height: 60,
                    fontSize: 16,
                    isDisabled: false,
                    text: "Login",
                    onTap: () => viewModel.loginFunc(),
                  ),
                  verticalSpaceFifteen,
                  ManropeText.bold("Request demo account", 14, kcBlueColor)
                ],
              ),
            ),
    );
  }

  @override
  LoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginViewModel();

  @override
  void onViewModelReady(LoginViewModel viewModel) {
    syncFormWithViewModel(viewModel);
    emailController.text = "aidarusbadawy@gmail.com";
    passwordController.text = "Badawy@123";
    super.onViewModelReady(viewModel);
  }

  @override
  void onDispose(LoginViewModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }
}
