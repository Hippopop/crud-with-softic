import 'dart:io';

import 'package:crud_with_softic/src/constants/assets.dart';
import 'package:crud_with_softic/src/features/home/repository/models/product_data/product_data_model.dart';
import 'package:crud_with_softic/src/services/theme/extensions/color_theme.dart';
import 'package:flutter/material.dart';

class SingleProductCard extends StatelessWidget {
  const SingleProductCard({
    super.key,
    required this.productData,
  });

  final ProductDataModel productData;

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).extension<ColorTheme>();
    return Container(
      constraints: const BoxConstraints(
        minWidth: 200,
      ),
      decoration: BoxDecoration(
        color: colorTheme?.secoderyAccent,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(8),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 120,
              width: double.infinity,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: colorTheme?.primaryAccent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image.file(
                File.fromUri(
                  Uri.file(
                    productData.image ?? '',
                    windows: Platform.isWindows,
                  ),
                ),
                errorBuilder: (context, error, stackTrace) => Image.asset(
                  Assets.horizonPlaceholder,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "\$${productData.productPrice?.mrp ?? ''}",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 18,
                color: colorTheme?.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 18),
            Text(
              productData.name ?? 'Product Name',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 16,
                color: colorTheme?.extraTextColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              productData.description ?? 'Product Name',
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 16,
                color: colorTheme?.extraTextColor,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: colorTheme?.white,
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(
                        Assets.avatarPlaceholder,
                      ),
                      foregroundImage: NetworkImage(
                        productData.brand?.image ?? '',
                      ),
                    ),
                  ),
                ),
                Text(
                  "by ${productData.brand?.name ?? ''}",
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    color: colorTheme?.extraTextColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
