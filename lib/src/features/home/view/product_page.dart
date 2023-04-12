import 'package:crud_with_softic/src/features/home/controller/product_controller.dart';
import 'package:crud_with_softic/src/features/home/repository/models/product_data/product_data_model.dart';
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
  @override
  void initState() {
    super.initState();
    Get.find<ProductController>().getProductList(0);
  }

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).extension<ColorTheme>();
    return Container(
      color: colorTheme?.backgroundColor,
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
              child: const SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      'Your products',
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GetBuilder<ProductController>(builder: (controller) {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 300,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 9 / 14),
                itemBuilder: (context, index) => SingleProductCard(
                    productData: controller.currentProductList[index]),
                itemCount: controller.currentProductList.length,
              );
            }),
          ),
        ],
      ),
    );
  }
}
