import 'package:crud_with_softic/src/services/theme/extensions/color_theme.dart';
import 'package:flutter/material.dart';

class OverlayLoadingIndicator extends StatelessWidget {
  const OverlayLoadingIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).extension<ColorTheme>();
    return Material(
      color: Colors.black26,
      child: Center(
        child: Container(
          height: 125,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: colorTheme?.themeColor,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const CircularProgressIndicator(),
              Text(
                "Loading...",
                style: TextStyle(
                  fontSize: 18,
                  color: colorTheme?.opposite,
                ),
                maxLines: 1,
                overflow: TextOverflow.fade,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
