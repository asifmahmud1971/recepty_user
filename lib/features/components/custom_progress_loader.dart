import 'package:flutter_easyloading/flutter_easyloading.dart';

showProgressDialog() {
  if (!EasyLoading.isShow) {
    EasyLoading.show(
      dismissOnTap: false,
    );
  }
}

dismissProgressDialog() {
  if (EasyLoading.isShow) {
    EasyLoading.dismiss();
  }
}
