import 'package:crud_with_softic/src/constants/assets.dart';
import 'package:crud_with_softic/src/features/authentication/controller/auth_controller.dart';
import 'package:crud_with_softic/src/features/settings/views/main_settings.dart';
import 'package:crud_with_softic/src/services/theme/extensions/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).extension<ColorTheme>();
    return GetBuilder<AuthController>(builder: (controller) {
      final profileData = controller.currentUserProfile;
      return Column(
        children: [
          const SizedBox(height: 12),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              Expanded(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: colorTheme?.backgroundColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: CircleAvatar(
                      maxRadius: 80,
                      foregroundImage:
                          NetworkImage(profileData?.imageUrl ?? ''),
                      backgroundImage:
                          const AssetImage(Assets.avatarPlaceholder),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: () {
                      Get.to(() => const AppMainSettings());
                    },
                    icon: Icon(
                      Icons.settings,
                      size: 28,
                      color: colorTheme?.extraTextColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: SafeArea(
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.all(12),
                padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                decoration: BoxDecoration(
                  color: colorTheme?.secoderyAccent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${profileData?.firstName ?? ''} ${profileData?.lastName ?? ''}",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
