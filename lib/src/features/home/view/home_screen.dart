import 'package:crud_with_softic/src/features/home/view/widgets/navbar.dart';
import 'package:crud_with_softic/src/services/theme/extensions/color_theme.dart';
import 'package:flutter/material.dart';

import 'product_page.dart';
import 'profile_page.dart';

class HomeScreen extends StatefulWidget {
  static const screen = 'LoginScreen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController controller = PageController(
    initialPage: 0,
  );
  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).extension<ColorTheme>();
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: controller,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            ProductPage(),
            ProfilePage(),
          ],
        ),
      ),
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: colorTheme?.primaryColor,
        elevation: 0,
        child: Icon(
          Icons.add,
          color: colorTheme?.white,
        ),
      ),
      bottomNavigationBar: NavBar(controller: controller),
    );
  }
}
