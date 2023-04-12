import 'package:crud_with_softic/global/widgets/pop_ups.dart';
import 'package:crud_with_softic/src/services/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:crud_with_softic/src/features/authentication/view/login_screen.dart';
import 'package:get/get.dart';
import 'choose_language_screen.dart';

class AppMainSettings extends StatefulWidget {
  static const String screen = "AppMainSettings";
  const AppMainSettings({Key? key}) : super(key: key);

  @override
  State<AppMainSettings> createState() => _AppMainSettingsState();
}

class _AppMainSettingsState extends State<AppMainSettings> {
  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).extension<ColorTheme>();
    return Scaffold(
      appBar: AppBar(
        title: Text('settings'.tr),
        backgroundColor: colorTheme?.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            //
            ListTile(
              leading: const Icon(Icons.settings),
              title: Text("change_theme".tr),
              trailing: Tooltip(
                message: "Theme Mode",
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: colorTheme?.extraTextColor,
                ),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: GestureDetector(
                  onTap: () {
                    Get.find<ThemeController>().toggleAppTheme();
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xffFFDB84),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Get.isDarkMode
                        ? const Icon(
                            Icons.dark_mode,
                            size: 20,
                            color: Colors.black,
                          )
                        : const Icon(
                            Icons.light_mode,
                            size: 20,
                            color: Colors.black,
                          ),
                  ),
                ),
              ),
            ),

            ListTile(
              leading: const Icon(Icons.settings),
              title: Text("choose_the_language".tr),
              trailing: IconButton(
                onPressed: () {
                  Get.to(() => const ChooseLanguageScreen());
                },
                icon: const Icon(Icons.arrow_forward_ios),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorTheme?.extraColor,
                  padding: const EdgeInsets.all(14),
                ),
                onPressed: () async {
                  await onWillPopLogout(context);
                },
                child: Text(
                  "logout".tr.toUpperCase(),
                  style: TextStyle(
                    color: colorTheme?.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
