import 'package:flutter/material.dart';
import 'package:crud_with_softic/src/services/theme/extensions/color_theme.dart';
import 'package:get/get.dart';

class NavBar extends StatelessWidget {
  NavBar({super.key, required this.controller});
  final PageController controller;
  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).extension<ColorTheme>();
    return BottomAppBar(
      color: Colors.transparent,
      elevation: 0,
      notchMargin: 6,
      clipBehavior: Clip.hardEdge,
      shape: const CircularNotchedRectangle(),
      child: BottomNavigationBar(
        currentIndex: ((controller.hasClients? controller.page : controller.initialPage) ?? 0).toInt(),
        showUnselectedLabels: false,
        backgroundColor: colorTheme?.backgroundColor,
        selectedItemColor: colorTheme?.primaryColor,
        unselectedItemColor: colorTheme?.extraTextColor,
        onTap: (value) {
          controller.jumpToPage(value);
        },
        selectedLabelStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: colorTheme?.primaryColor,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: colorTheme?.extraTextColor,
        ),
        items: [
          BottomNavigationBarItem(
            activeIcon: const Icon(Icons.home),
            icon: const Icon(Icons.home),
            label: 'home'.tr,
          ),
          BottomNavigationBarItem(
            activeIcon: const Icon(Icons.person),
            icon: const Icon(Icons.person),
            label: 'profile'.tr,
          ),
        ],
      ),
    );
  }
}
