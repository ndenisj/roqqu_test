import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:roqqu_test/styles/roqqu.colors.dart';

class RoqquButton extends StatelessWidget {
  final Function? onTap;
  final Color color;
  final Color disabledColor;
  final Color? textColor;
  final String? text;
  final bool? isLoading;
  final bool hasIcon;
  final Widget? iconWidget;
  final TextStyle? textStyle;
  final bool isSmall;
  final bool hasBorder;
  final double? borderRadius;
  final bool isDisabled;
  final double? height;
  final double? width;
  final Color? borderColor;
  const RoqquButton(
      {Key? key,
      this.onTap,
      this.color = positiveColor,
      this.disabledColor = const Color(0xff828282),
      this.textColor,
      this.text,
      this.isLoading = false,
      this.hasIcon = false,
      this.iconWidget,
      this.textStyle,
      this.borderRadius,
      this.isSmall = false,
      this.hasBorder = false,
      this.isDisabled = false,
      this.height = 54,
      this.width = 250,
      this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTapDown: isDisabled ? null : (_) => HapticFeedback.lightImpact(),
      onTap: isDisabled ? null : () => onTap!(),
      borderRadius: BorderRadius.circular(borderRadius ?? 50),
      child: Container(
        height: height,
        width: isSmall ? 150 : width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 50),
          color: isDisabled
              ? disabledColor
              : isLoading!
                  ? color.withOpacity(.5)
                  : color,
          border: hasBorder
              ? Border.all(color: borderColor!)
              : Border.all(width: 0, color: color),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            hasIcon ? iconWidget! : SizedBox.shrink(),
            hasIcon
                ? SizedBox(
                    width: 15,
                  )
                : SizedBox.shrink(),
            Center(
              child: Text(
                isLoading! ? "" : text ?? "",
                overflow: TextOverflow.ellipsis,
                style: textStyle ??
                    Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            isLoading!
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 1,
                      valueColor: AlwaysStoppedAnimation(Colors.white),
                    ),
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
