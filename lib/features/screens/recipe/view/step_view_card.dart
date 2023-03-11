import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:receptyUser/core/constants/app_size.dart';

class StepViewCard extends StatelessWidget {
  final String? desc;
  final int? step;
  final VoidCallback? onRemove;

  const StepViewCard({Key? key, this.desc, this.step, this.onRemove})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 1.sw,
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Step - $step",
                style: kRegularLine15.copyWith(fontWeight: FontWeight.w600),
              ),
              kHeightBox5,
              Text(desc ?? "", style: kRegularLine15.copyWith()),
            ],
          ),
        ),
        Positioned(
            top: 0,
            right: 10,
            child: InkWell(
                onTap: onRemove,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.close,
                    color: Colors.red,
                  ),
                )))
      ],
    );
  }
}
