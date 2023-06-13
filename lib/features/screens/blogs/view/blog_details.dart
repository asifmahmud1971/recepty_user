import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_translator/google_translator.dart';
import 'package:receptyUser/core/constants/app_colors.dart';
import 'package:receptyUser/core/constants/app_size.dart';
import 'package:receptyUser/features/components/custom_image.dart';
import 'package:receptyUser/features/components/my_context.dart';
import 'package:receptyUser/features/components/time_formatter.dart';
import 'package:receptyUser/features/screens/blogs/model/BlogsModel.dart';
import 'package:receptyUser/generated/assets.dart';

class BlogsDetailPage extends StatefulWidget {
  final dynamic blogs;

  const BlogsDetailPage({super.key, this.blogs});

  @override
  _BlogsDetailPageState createState() => _BlogsDetailPageState();
}

class _BlogsDetailPageState extends State<BlogsDetailPage> {
  //mainImage

  Widget mainImageWidget(height) => Stack(
        children: [
          CustomImage(
            baseUrl: widget.blogs?.image,
            placeHolder: Assets.imagesPhotoPlaceholder,
            height: 0.5.sh,
            width: 1.sw,
          ),
          Positioned(
            top: 40.h,
            left: 10.w,
            child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
                onPressed: () {
                  GetContext.back();
                }),
          )
        ],
      );

  Widget bottomContent(height, width) => Container(
        margin: EdgeInsets.only(top: height / 20),
        width: width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //Category
                Text(
                  widget.blogs?.name ?? "",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ).translate(),

                kHeightBox10,

                //like and duration
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.access_time,
                      color: Colors.white,
                      size: 16,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      DateTime.parse(widget.blogs!.createdAt!)
                              .timeAgo(numericDates: false) ??
                          "",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    kWidthBox20
                  ],
                ),

                kHeightBox20,

                //Paragraph
                Text(
                  widget.blogs?.description ?? "",
                  style: TextStyle(
                      color: Colors.white, fontSize: 16.5, height: 1.4),
                  textAlign: TextAlign.left,
                  maxLines: 8,
                ).translate(),
              ],
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: GoogleTranslatorInit(
        dotenv.env['TRANSLATION_KEY'].toString(),
        translateFrom: Locale("sk"),
        translateTo: Locale(context.locale.toString()),
        automaticDetection: true,
        builder: () => Container(
          child: Stack(
            alignment: Alignment.topCenter,
            clipBehavior: Clip.none,
            children: <Widget>[
              //Main Image
              mainImageWidget(height),

              //Bottom Sheet
              Container(
                //Bottom Sheet Dimensions
                margin: EdgeInsets.only(top: height / 2.3),
                decoration: BoxDecoration(
                  color: AppColors.kPrimaryColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                ),

                child: bottomContent(height, width),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
