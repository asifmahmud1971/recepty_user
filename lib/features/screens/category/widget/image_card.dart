import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:receptyUser/core/constants/app_size.dart';

class ImageCard extends StatelessWidget {
  final String? fileName;
  final VoidCallback? onDelete;
  final bool? isNetworkImage;

  const ImageCard(
      {Key? key, this.fileName, this.onDelete, this.isNetworkImage = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 5),
      child: Stack(
        children: [
          Container(
              clipBehavior: Clip.antiAlias,
              height: 150.r,
              width: 150.r,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.black12),
              child: isNetworkImage!
                  ? Image.network(
                      fileName!,
                      fit: BoxFit.cover,
                    )
                  : Image.file(
                      File(fileName ?? ""),
                      fit: BoxFit.cover,
                    )),
          Positioned(
              bottom: 2,
              right: 2,
              child: InkWell(
                onTap: onDelete ?? () {},
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  padding: EdgeInsets.all(2),
                  child: Icon(
                    Icons.delete_forever,
                    color: Colors.red,
                    size: AppCommonSize.s20,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
