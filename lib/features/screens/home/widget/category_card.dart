import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_translator/google_translator.dart';
import 'package:receptyUser/core/constants/app_colors.dart';
import 'package:receptyUser/core/constants/app_size.dart';
import 'package:receptyUser/features/components/custom_image.dart';
import 'package:receptyUser/generated/assets.dart';

class CategoryCard extends StatefulWidget {
  final String? image;
  final String? name;
  final VoidCallback? onTap;
  const CategoryCard({Key? key, this.image, this.name, this.onTap})
      : super(key: key);

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: GoogleTranslatorInit(
        dotenv.env['TRANSLATION_KEY'].toString(),
        translateFrom: Locale("sk"),
        translateTo: Locale(context.locale.toString()),
        automaticDetection: true,
        builder: () => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              CustomImage(
                radius: 10,
                width: 100.r,
                height: 100.r,
                baseUrl: widget.image,
                placeHolder: Assets.imagesPhotoPlaceholder,
              ),
              kHeightBox10,
              Text(widget.name ?? "",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: kRegularLine14.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColors.kSecondaryColor))
                  .translate()
            ],
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
