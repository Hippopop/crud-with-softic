import 'package:flutter/material.dart';
import 'package:crud_with_softic/src/services/theme/extensions/color_theme.dart';
import 'package:get/get.dart';

class NavBar extends StatelessWidget {
  NavBar({super.key, required this.controller});
  final PageController controller;
  final currentIndex = ValueNotifier<int>(0);
  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).extension<ColorTheme>();
    return ValueListenableBuilder(
        valueListenable: currentIndex,
        builder: (context, value, child) {
          return BottomAppBar(
            elevation: 0,
            notchMargin: 6,
            clipBehavior: Clip.hardEdge,
            shape: const CircularNotchedRectangle(),
            child: BottomNavigationBar(
              showUnselectedLabels: false,
              backgroundColor: colorTheme?.white,
              selectedItemColor: colorTheme?.primaryColor,
              currentIndex: value,
              unselectedItemColor: colorTheme?.extraTextColor,
              onTap: (value) {
                /* controller.animateTo(
                  value.toDouble(),
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeIn,
                ); */
                controller.jumpToPage(value);
                currentIndex.value = value;
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
        });
  }
}
