import 'package:crud_with_softic/src/features/home/controller/product_controller.dart';
import 'package:crud_with_softic/src/services/theme/extensions/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/single_product_card.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({
    super.key,
  });

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  late final ScrollController _scrollController;
  late ProductController controller;
  @override
  void initState() {
    super.initState();
    controller = Get.find<ProductController>();
    _scrollController = ScrollController(keepScrollOffset: true);
    controller.getProductList(0);
    _scrollController.addListener(scrollListenerCallback);
  }

  scrollListenerCallback() {
    if (_scrollController.hasClients) {
      final triggerPoint = 0.85 * _scrollController.position.maxScrollExtent;
      if (_scrollController.position.pixels > triggerPoint) {
        controller.getProductList();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).extension<ColorTheme>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: colorTheme?.extraColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      'your_product'.tr,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GetBuilder<ProductController>(builder: (controller) {
              return GridView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.symmetric(vertical: 8),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  maxCrossAxisExtent: 300,
                  childAspectRatio: 9 / 16,
                ),
                itemBuilder: (context, index) => SingleProductCard(
                  productData: controller.currentProductList[index],
                ),
                itemCount: controller.currentProductList.length,
              );
            }),
          ),
        ],
      ),
    );
  }
}
