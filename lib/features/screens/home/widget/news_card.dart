import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_translator/google_translator.dart';
import 'package:receptyUser/core/constants/app_size.dart';
import 'package:receptyUser/features/components/custom_image.dart';
import 'package:receptyUser/generated/assets.dart';

class NewsCard extends StatelessWidget {
  final String? image;
  final String? title;
  final String? description;
  final VoidCallback? onTap;
  const NewsCard(
      {Key? key, this.image, this.title, this.description, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: GoogleTranslatorInit(
        dotenv.env['TRANSLATION_KEY'].toString(),
        translateFrom: Locale("sk"),
        translateTo: Locale(context.locale.toString()),
        automaticDetection: true,
        builder: () => Padding(
          padding: const EdgeInsets.only(top: 10, right: 10),
          child: Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomImage(
                  radius: 10,
                  width: 100.r,
                  height: 100.r,
                  baseUrl: image,
                  placeHolder: Assets.imagesPhotoPlaceholder,
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        title ?? "",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: kRegularLine15.copyWith(
                            fontWeight: FontWeight.w600),
                      ).translate(),
                      kHeightBox10,
                      Text(
                        description ?? "",
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: kRegularLine15.copyWith(
                            fontWeight: FontWeight.w400, color: Colors.grey),
                      ).translate(),
                    ],
                  ),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
