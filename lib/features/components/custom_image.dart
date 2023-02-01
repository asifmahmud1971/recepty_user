import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:receptyUser/core/constants/app_colors.dart';
import 'package:receptyUser/features/components/custom_svg.dart';
import 'package:receptyUser/generated/assets.dart';

class CustomImage extends StatelessWidget {
  final double? width;
  final double? height;
  final double? size;
  final String? baseUrl;
  final String? placeHolder;
  final Color? bgColor;
  final BoxFit? fit;
  final double radius;
  final bool oneSideRadius;
  final bool innerShadow;
  final bool isCircle;

  const CustomImage({
    Key? key,
    this.width,
    this.height,
    this.size,
    this.placeHolder,
    this.fit,
    this.baseUrl,
    this.radius = 0,
    this.oneSideRadius = false,
    this.innerShadow = false,
    this.isCircle = false,
    this.bgColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return baseUrl != null || baseUrl != "null"
        ? Container(
            clipBehavior: Clip.antiAlias,
            width: isCircle ? size : width,
            height: isCircle ? size : height,
            decoration: isCircle
                ? const BoxDecoration(shape: BoxShape.circle)
                : BoxDecoration(
                    color: bgColor ?? AppColors.kWhiteColor,
                    borderRadius: oneSideRadius
                        ? BorderRadius.only(
                            bottomLeft: Radius.circular(radius),
                            topLeft: Radius.circular(radius),
                          )
                        : BorderRadius.circular(radius),
                    //
                    // shape: isCircle!?BoxShape.circle:null
                  ),
            child: CachedNetworkImage(
              imageUrl: baseUrl ?? '',
              fit: fit ?? BoxFit.cover,
              color: innerShadow ? Colors.black.withOpacity(.3) : null,
              colorBlendMode: innerShadow ? BlendMode.darken : null,
              placeholder: (context, url) => Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: bgColor ?? AppColors.kWhiteColor,
                  borderRadius: BorderRadius.circular(radius),
                ),
                child: CustomSvg(
                  icon: placeHolder ?? Assets.iconsProfile,
                  fit: fit ?? BoxFit.fill,
                ),
              ),
              errorWidget: (context, url, error) => isCircle
                  ? Container(
                      height: size,
                      width: size,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: bgColor ?? Colors.white),
                      child: CustomSvg(
                        icon: placeHolder ?? Assets.iconsProfile,
                        fit: fit ?? BoxFit.fill,
                      ),
                    )
                  : CustomSvg(
                      icon: placeHolder ?? Assets.iconsProfile,
                      fit: fit ?? BoxFit.fill,
                    ),
            ),
          )
        : Container(
            clipBehavior: Clip.antiAlias,
            width: isCircle ? size : width,
            height: isCircle ? size : height,
            decoration: isCircle
                ? const BoxDecoration(shape: BoxShape.circle)
                : BoxDecoration(
                    color: AppColors.kGrayIconColor,
                    borderRadius: BorderRadius.circular(radius),
                  ),
            child: CustomSvg(
              icon: placeHolder ?? Assets.iconsProfile,
              fit: fit ?? BoxFit.fill,
            ),
          );
  }
}
