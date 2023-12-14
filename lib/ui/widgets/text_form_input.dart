import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:todo/config/theme/colors_theme.dart';

class TextFormInput extends StatefulWidget {
  final IconData? icon;
  final String hintText;
  final String? labelText;
  final Color? iconColor;
  final bool? obscureText;
  final bool? enabled;
  final IconData? iconSuffix;
  final double? sizeIconSuffix;
  final Function? handleIconsuffix;
  final TextInputType? keyBoardType;
  final TextInputAction? textInputAction;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextCapitalization? textCapitalization;
  final void Function(String)? onFieldSubmitted;
  final int? maxLines;

  const TextFormInput({
    Key? key,
    required this.hintText,
    this.icon,
    this.validator,
    this.onChanged,
    this.controller,
    this.iconSuffix,
    this.obscureText,
    this.keyBoardType,
    this.handleIconsuffix,
    this.onFieldSubmitted,
    this.sizeIconSuffix = 24,
    this.labelText,
    this.iconColor = ColorsAppTheme.content,
    this.enabled = true,
    this.textInputAction = TextInputAction.next,
    this.textCapitalization = TextCapitalization.none,
    this.maxLines,
  }) : super(key: key);

  @override
  State<TextFormInput> createState() => _TextFormInputState();
}

class _TextFormInputState extends State<TextFormInput> {
  static const OutlineInputBorder inputBorder = OutlineInputBorder(
    borderSide: BorderSide(
      color: ColorsAppTheme.content,
      width: 1,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(12),
    ),
  );

  static const TextStyle textStyle = TextStyle(
    fontSize: 16,
    color: ColorsAppTheme.content,
  );

  bool obscureText = false;

  @override
  void initState() {
    obscureText = widget.obscureText ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: widget.controller,
      keyboardType: widget.keyBoardType,
      textInputAction: widget.textInputAction,
      textCapitalization: widget.textCapitalization!,
      enabled: widget.enabled!,
      style: textStyle,
      maxLines: widget.maxLines ?? 1,
      decoration: InputDecoration(
        enabledBorder: inputBorder,
        focusedBorder: inputBorder.copyWith(
          borderSide: const BorderSide(color: ColorsAppTheme.primary),
        ),
        errorBorder: inputBorder.copyWith(
          borderSide: const BorderSide(
            color: ColorsAppTheme.error,
          ),
        ),
        border: inputBorder,
        hintText: widget.hintText,
        labelText: widget.labelText,
        errorStyle: textStyle.copyWith(
          color: ColorsAppTheme.error,
        ),
        hintStyle: textStyle,
        icon: widget.icon != null
            ? Icon(
                widget.icon,
                color: widget.iconColor,
              )
            : null,
        suffixIcon: _getSuffixIcon(),
      ),
      onChanged: widget.onChanged,
      validator: widget.validator,
      onFieldSubmitted: widget.onFieldSubmitted,
    );
  }

  Widget? _getSuffixIcon() {
    if (widget.obscureText != null) {
      return IconButton(
        onPressed: () {
          setState(() {
            obscureText = !obscureText;
          });
        },
        icon: Icon(
          obscureText ? Feather.eye : Feather.eye_off,
          color: widget.iconColor,
          size: widget.sizeIconSuffix,
        ),
      );
    } else if (widget.iconSuffix != null) {
      return IconButton(
        onPressed: () {
          widget.handleIconsuffix?.call();
        },
        icon: Icon(
          widget.iconSuffix,
          // color: widget.iconColor,
          size: widget.sizeIconSuffix,
        ),
      );
    }
    return null;
  }
}
