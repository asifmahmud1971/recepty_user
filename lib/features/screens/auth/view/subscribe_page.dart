import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:receptyUser/features/components/payment_controller.dart';
import 'package:receptyUser/features/screens/auth/widget/package_card.dart';

import '../../../../core/constants/app_strings.dart';

class SubscribePage extends StatefulWidget {
  const SubscribePage({Key? key}) : super(key: key);

  @override
  State<SubscribePage> createState() => _SubscribePageState();
}

class _SubscribePageState extends State<SubscribePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.package.tr()),
      ),
      body: Center(
        child: ListView(
          children: [
            PackageCard(
              onTap: ()async{
                await PaymentController().makePayment(amount:"6.99",currency: "Eur" ,packageNo: "1");
              },
              title: AppStrings.buyNow.tr(),
              amount: "6.99",
              duration: AppStrings.month.tr(),
            ),
            PackageCard(
              onTap: ()async{
                await PaymentController().makePayment(amount:"19.99",currency: "Eur",packageNo: "2");
              },
              title: AppStrings.buyNow.tr(),
              amount: "19.99",
              duration: "6 ${AppStrings.month.tr()}",
            ),
            PackageCard(
              onTap: ()async{
                await PaymentController().makePayment(amount:"19.99",currency: "Eur" ,packageNo: "3");
              },
              title: AppStrings.buyNow.tr(),
              amount: "19.99",
              duration: "12 ${AppStrings.month.tr()}",
            ),
            PackageCard(
              onTap: ()async{
                await PaymentController().makePayment(amount:"49.99",currency: "Eur" ,packageNo: "4");
              },
              title: AppStrings.buyNow.tr(),
              amount: "49.99",
              duration: AppStrings.lifeTime.tr(),
            ),
          ],
        ),
      ),
    );
  }
}
