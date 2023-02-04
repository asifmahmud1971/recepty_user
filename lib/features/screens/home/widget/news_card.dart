import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:receptyUser/core/constants/app_size.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10,right: 10),
      child: Container(
        child: Row(
          children: [
            Container(
              height: 100.r,
              width: 100.r,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          "https://properfoodie.com/wp-content/uploads/2021/04/square-Steak-and-chips-8.jpg"))),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  Text(
                    "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: kRegularLine15.copyWith(fontWeight: FontWeight.w600),
                  ),
                  kHeightBox5,
                  Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: kRegularLine15.copyWith(
                        fontWeight: FontWeight.w400, color: Colors.grey),
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
