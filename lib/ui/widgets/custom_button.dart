import 'package:flutter/material.dart';
import 'package:todo/config/theme/colors_theme.dart';

class CustomButtom extends StatelessWidget {
  const CustomButtom({
    super.key,
    required this.label,
    this.onPressed,
    this.textStyle,
    this.height = 50,
    this.borderRaidus = 100,
    this.textColor = ColorsAppTheme.content,
    this.backgroundColor = ColorsAppTheme.primary,
  });

  final String label;
  final double? height;
  final Color? textColor;
  final double? borderRaidus;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRaidus!),
      ),
      disabledColor: ColorsAppTheme.grey,
      highlightElevation: 0,
      focusElevation: 0,
      hoverElevation: 0,
      elevation: 0,
      height: height,
      textColor: textColor,
      color: backgroundColor,
      onPressed: onPressed,
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 16,
          ).merge(textStyle),
        ),
      ),
    );
  }
}
