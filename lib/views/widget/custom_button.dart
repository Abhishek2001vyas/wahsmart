import 'package:get/get.dart';

import 'package:flutter/material.dart';

import '../../utils/dimensions.dart';

class CustomButton extends StatelessWidget {
  final Function? onPressed;
  final String buttonText;
  final bool transparent;
  final EdgeInsets? margin;
  final double? height;
  final double? width;
  final double? fontSize;
  final double radius;
  final IconData? icon;
  final Color? color;
  final Color? textColor;
  final bool isLoading;
  final bool isBold;

  const CustomButton({
    Key? key,
    this.onPressed,
    required this.buttonText,
    this.transparent = false,
    this.margin,
    this.width,
    this.height,
    this.fontSize,
    this.radius = 10,
    this.icon,
    this.color,
    this.textColor,
    this.isLoading = false,
    this.isBold = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color primary = Theme.of(context).primaryColor;
    final Color secondary = Theme.of(context).secondaryHeaderColor;

    // If color is null, we won't set backgroundColor in ButtonStyle,
    // Instead, use gradient container background.
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      backgroundColor: onPressed == null
          ? Theme.of(context).disabledColor
          : transparent
          ? Colors.transparent
          : color != null
          ? color
          : Colors.transparent, // make transparent if using gradient
      minimumSize: Size(width ?? Dimensions.webMaxWidth, height ?? 50),
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
    );

    Widget buttonChild = isLoading
        ? Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 15,
            width: 15,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              strokeWidth: 2,
            ),
          ),
          const SizedBox(width: Dimensions.paddingSizeSmall),
          Text('loading'.tr, style: const TextStyle(color: Colors.white)),
        ],
      ),
    )
        : Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (icon != null)
          Padding(
            padding: const EdgeInsets.only(right: Dimensions.paddingSizeExtraSmall),
            child: Icon(icon,
                color: transparent ? primary : Theme.of(context).cardColor),
          ),
        Text(
          buttonText,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: textColor ?? (transparent ? primary : Colors.white),
            fontSize: fontSize ?? Dimensions.fontSizeLarge,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );

    Widget decoratedButton = Container(
      height: height ?? 50,
      width: width ?? Dimensions.webMaxWidth,
      margin: margin ?? EdgeInsets.zero,
      decoration: BoxDecoration(
        gradient: color == null && !transparent
            ? LinearGradient(
          colors: [primary, secondary],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        )
            : null,
        color: (color != null || transparent) ? null : null,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Center(child: buttonChild),
    );

    return Center(
      child: SizedBox(
        width: width ?? Dimensions.webMaxWidth,
        child: TextButton(
          onPressed: isLoading ? null : onPressed as void Function()?,
          style: flatButtonStyle,
          child: decoratedButton,
        ),
      ),
    );
  }
}




