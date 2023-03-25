import 'package:flutter/material.dart';
import 'package:receptyUser/features/components/payment_controller.dart';
import 'package:receptyUser/features/screens/auth/widget/package_card.dart';

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
        title: Text("Packages"),
      ),
      body: Center(
        child: ListView(
          children: [
            PackageCard(
              onTap: ()async{
                await PaymentController().makePayment(amount:"6.99",currency: "Eur" ,packageNo: "1");
              },
              title: "Buy Now",
              amount: "6.99",
              duration: "Month",
            ),
            PackageCard(
              onTap: ()async{
                await PaymentController().makePayment(amount:"19.99",currency: "Eur",packageNo: "2");
              },
              title: "Buy Now",
              amount: "19.99",
              duration: "6 Months",
            ),
            PackageCard(
              onTap: ()async{
                await PaymentController().makePayment(amount:"19.99",currency: "Eur" ,packageNo: "3");
              },
              title: "Buy Now",
              amount: "19.99",
              duration: "12 Months",
            ),
            PackageCard(
              onTap: ()async{
                await PaymentController().makePayment(amount:"49.99",currency: "Eur" ,packageNo: "4");
              },
              title: "Buy Now",
              amount: "49.99",
              duration: "Lifetime",
            ),
          ],
        ),
      ),
    );
  }
}
