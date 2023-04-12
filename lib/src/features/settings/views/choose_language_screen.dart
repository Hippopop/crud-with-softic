import 'package:flutter/material.dart';
import 'package:crud_with_softic/src/constants/app_constants.dart';
import 'package:crud_with_softic/src/features/settings/controllers/language_controller.dart';
import 'package:crud_with_softic/src/services/localization/localization_controller.dart';
import 'package:crud_with_softic/src/constants/assets.dart';
import 'package:crud_with_softic/src/services/localization/language_model.dart';
import 'package:get/get.dart';

class ChooseLanguageScreen extends StatelessWidget {
  static const String screen = "ChooseLanguageScreen";

  const ChooseLanguageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<LanguageController>(
          builder: (languageController) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                const Padding(
                    padding: EdgeInsets.only(left: 20, top: 10),
                    child: Text(
                      "Select your prefered language",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),
                const SizedBox(height: 20),
                const SizedBox(height: 20),
                Expanded(
                    child: ListView.builder(
                        itemCount: languageController.languages.length,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) => _languageWidget(
                            context: context,
                            languageModel: languageController.languages[index],
                            languageController: languageController,
                            index: index))),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 12),
                        child: SizedBox(
                          height: 40,
                          child: ElevatedButton.icon(
                              label: Text('continue'.tr),
                              icon: const Icon(Icons.save),
                              onPressed: () {
                                if (languageController.languages.isNotEmpty &&
                                    languageController.selectIndex != -1) {
                                  Get.find<LocalizationController>()
                                      .setLanguage(Locale(
                                    AppConstants
                                        .languages[
                                            languageController.selectIndex]
                                        .languageCode!,
                                    AppConstants
                                        .languages[
                                            languageController.selectIndex]
                                        .countryCode,
                                  ));
                                  Navigator.pop(context);
                                }
                              }),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _languageWidget(
      {required BuildContext context,
      required LanguageModel languageModel,
      required LanguageController languageController,
      required int index}) {
    return InkWell(
      onTap: () {
        languageController.setSelectIndex(index);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: languageController.selectIndex == index
              ? Theme.of(context).primaryColor.withOpacity(.15)
              : null,
          border: Border(
              top: BorderSide(
                  width: languageController.selectIndex == index ? 1.0 : 0.0,
                  color: languageController.selectIndex == index
                      ? Theme.of(context).primaryColor
                      : Colors.transparent),
              bottom: BorderSide(
                  width: languageController.selectIndex == index ? 1.0 : 0.0,
                  color: languageController.selectIndex == index
                      ? Theme.of(context).primaryColor
                      : Colors.transparent)),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15),
          decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: 1.0,
                    color: languageController.selectIndex == index
                        ? Colors.transparent
                        : (languageController.selectIndex - 1) == (index - 1)
                            ? Colors.transparent
                            : Theme.of(context).dividerColor.withOpacity(.2))),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const SizedBox(width: 30),
                  Text(
                    languageModel.languageName ?? 'English',
                  ),
                ],
              ),
              languageController.selectIndex == index
                  ? Image.asset(
                      Assets.done,
                      width: 17,
                      height: 17,
                      color: Theme.of(context).primaryColorLight,
                    )
                  : Image.asset(
                      languageModel.imageUrl!,
                      width: 24,
                      height: 24,
                    )
            ],
          ),
        ),
      ),
    );
  }
}
