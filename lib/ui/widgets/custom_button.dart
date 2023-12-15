import 'package:flutter/material.dart';
import 'package:todo/config/theme/colors_theme.dart';

class CustomButtom extends StatelessWidget {
  const CustomButtom({
    super.key,
    required this.label,
    this.onPressed,
    this.textStyle,
    this.height = 50,
    this.backgroundColor = ColorsAppTheme.primary,
  });

  final String label;
  final double? height;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith(
          (states) => states.contains(MaterialState.disabled)
              ? ColorsAppTheme.grey
              : backgroundColor,
        ),
      ),
      child: Container(
        width: double.infinity,
        height: height,
        alignment: Alignment.center,
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            color: ColorsAppTheme.content,
          ).merge(textStyle),
        ),
      ),
    );
  }
}
