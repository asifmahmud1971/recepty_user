import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:receptyUser/core/constants/app_colors.dart';
import 'package:receptyUser/features/components/custom_svg.dart';
import 'package:receptyUser/generated/assets.dart';

class CustomImage extends StatefulWidget {
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
  State<CustomImage> createState() => _CustomImageState();
}

class _CustomImageState extends State<CustomImage> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    return widget.baseUrl != null || widget.baseUrl != "null"
        ? Container(
            clipBehavior: Clip.antiAlias,
            width: widget.isCircle ? widget.size : widget.width,
            height: widget.isCircle ? widget.size : widget.height,
            decoration: widget.isCircle
                ? const BoxDecoration(shape: BoxShape.circle)
                : BoxDecoration(
                    color: widget.bgColor ?? AppColors.kWhiteColor,
                    borderRadius: widget.oneSideRadius
                        ? BorderRadius.only(
                            bottomLeft: Radius.circular(widget.radius),
                            topLeft: Radius.circular(widget.radius),
                          )
                        : BorderRadius.circular(widget.radius),
                    //
                    // shape: isCircle!?BoxShape.circle:null
                  ),
            child: CachedNetworkImage(
              useOldImageOnUrlChange: true,
              imageUrl: widget.baseUrl!,
              fit: widget.fit ?? BoxFit.cover,
              color: widget.innerShadow ? Colors.black.withOpacity(.3) : null,
              colorBlendMode: widget.innerShadow ? BlendMode.darken : null,
              placeholder: (context, url) => Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: widget.bgColor ?? AppColors.kWhiteColor,
                  borderRadius: BorderRadius.circular(widget.radius),
                ),
                child: CustomSvg(
                  icon: widget.placeHolder ?? Assets.iconsProfile,
                  fit: widget.fit ?? BoxFit.fill,
                ),
              ),
              errorWidget: (context, url, error) => widget.isCircle
                  ? Container(
                      height: widget.size,
                      width: widget.size,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: widget.bgColor ?? Colors.white),
                      child: CustomSvg(
                        icon: widget.placeHolder ?? Assets.iconsProfile,
                        fit: widget.fit ?? BoxFit.fill,
                      ),
                    )
                  : CustomSvg(
                      icon: widget.placeHolder ?? Assets.iconsProfile,
                      fit: widget.fit ?? BoxFit.fill,
                    ),
            ),
          )
        : Container(
            clipBehavior: Clip.antiAlias,
            width: widget.isCircle ? widget.size : widget.width,
            height: widget.isCircle ? widget.size : widget.height,
            decoration: widget.isCircle
                ? const BoxDecoration(shape: BoxShape.circle)
                : BoxDecoration(
                    color: AppColors.kGrayIconColor,
                    borderRadius: BorderRadius.circular(widget.radius),
                  ),
            child: CustomSvg(
              icon: widget.placeHolder ?? Assets.iconsProfile,
              fit: widget.fit ?? BoxFit.fill,
            ),
          );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
