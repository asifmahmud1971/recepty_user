import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:receptyUser/core/constants/app_colors.dart';
import 'package:receptyUser/core/constants/app_size.dart';

class PackageCard extends StatefulWidget {
  final String? title;
  final String? amount;
  final String? waiter;
  final String? duration;
  final String? chef;
  final String? order;
  final String? branch;
  final Color? customColor;
  final String? status;
  final String? btn;
  final VoidCallback? onTap;

  const PackageCard({
    Key? key,
    this.title,
    this.amount,
    this.waiter,
    this.chef,
    this.order,
    this.branch,
    this.btn,
    this.customColor,
    this.status, this.duration, this.onTap,
  }) : super(key: key);

  @override
  _PackageCardState createState() => _PackageCardState();
}

class _PackageCardState extends State<PackageCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Card(
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: new BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            gradient: new LinearGradient(
                colors: [Colors.black87, AppColors.kPrimaryColor],
                begin: const FractionalOffset(0.2, 0.2),
                end: const FractionalOffset(1.0, 1.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                child: Text(
                  widget.title ?? "Test",
                  style: TextStyle(
                      color: Colors.white70, fontWeight: FontWeight.w700),
                ),
              ),
              Container(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${widget.amount}€",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "/${widget.duration}",
                        style: TextStyle(
                          color: Colors.white70,
                          fontFamily: "Poppins",
                        ),
                      ),
                    ],
                  )),

            ],
          ),
        ),
      ),
    );
  }
}
