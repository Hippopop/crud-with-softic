import 'package:crud_with_softic/src/global/widgets/loading_indicator.dart';
import 'package:crud_with_softic/src/constants/assets.dart';
import 'package:crud_with_softic/src/global/widgets/toast.dart';
import 'package:crud_with_softic/src/features/home/view/home_screen.dart';
import 'package:crud_with_softic/src/services/theme/extensions/color_theme.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../controller/auth_controller.dart';

class LoginScreen extends StatefulWidget {
  static const screen = 'LoginScreen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool hidepass = true;
  bool isChecked = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).extension<ColorTheme>();
    return Scaffold(
      body: GetBuilder<AuthController>(
        builder: (loginController) {
          return SafeArea(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 980,
                  maxHeight: 1080,
                ),
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ConstrainedBox(
                            constraints: const BoxConstraints(
                              maxWidth: double.infinity,
                              maxHeight: 300,
                            ),
                            child: Image.asset(Assets.login),
                          ),
                          Text(
                            "welcome".tr,
                            style: const TextStyle(fontSize: 32),
                          ),
                          const SizedBox(height: 32),
                          TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              hintText: 'user_hint'.tr,
                              labelText: 'user'.tr,
                              prefixIcon: const Icon(Icons.person),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "empty_user_err".tr;
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: passwordController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: 'password'.tr,
                              hintText: '********',
                              prefixIcon: const Icon(Icons.lock),
                              suffixIcon: IconButton(
                                onPressed: () => setState(() {
                                  hidepass = !hidepass;
                                }),
                                icon: Icon(
                                  hidepass
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'empty_pass_err'.tr;
                              }
                              return null;
                            },
                            obscureText: hidepass,
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: colorTheme?.primaryColor,
                                foregroundColor: colorTheme?.primaryColor,
                                padding: const EdgeInsets.all(18),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  final isSuccess = await Get.showOverlay<bool>(
                                    loadingWidget:
                                        const OverlayLoadingIndicator(),
                                    asyncFunction: () async =>
                                        await loginController.login(
                                      name: emailController.text,
                                      password: passwordController.text,
                                      rememberMe: isChecked,
                                    ),
                                  );
                                  if (isSuccess) {
                                    // TODO: Navigate.
                                    Get.off(() => const HomeScreen());
                                  }
                                }
                              },
                              child: Text(
                                "login".tr.toUpperCase(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: colorTheme?.opposite,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          //
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                    value: isChecked,
                                    onChanged: (value) {
                                      setState(() {
                                        isChecked = value!;
                                      });
                                    },
                                  ),
                                  Text("remember_me".tr),
                                ],
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Text("pass_forgot".tr),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              const Text("Don't have account ? "),
                              GestureDetector(
                                onTap: () {
                                  showToast('Coming soon!');
                                },
                                child: const Text(
                                  "Register now",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
