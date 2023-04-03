
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:receptyUser/core/app/app_dependency.dart';
import 'package:receptyUser/core/app/app_preference.dart';
import 'package:receptyUser/core/constants/app_colors.dart';
import 'package:receptyUser/core/constants/app_size.dart';
import 'package:receptyUser/core/constants/app_strings.dart';
import 'package:receptyUser/data/network/urls.dart';
import 'package:receptyUser/features/components/custom_progress_loader.dart';
import 'package:receptyUser/features/components/custom_text_field.dart';
import 'package:receptyUser/features/components/default_btn.dart';
import 'package:receptyUser/features/components/my_context.dart';
import 'package:receptyUser/features/screens/auth/cubit/auth_cubit.dart';
import 'package:receptyUser/features/screens/category/function/category_helper.dart';
import 'package:receptyUser/features/screens/category/widget/dotted_button.dart';
import 'package:receptyUser/features/screens/dashboard/view/dashboard_screen.dart';
import 'package:receptyUser/features/screens/home/view/home_screen.dart';
import 'package:receptyUser/features/screens/recipe/function/file_type.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  AppPreferences preferences = instance.get();


  File? selectedImagePath;

  final _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  String? _fileName;
  List<PlatformFile>? _paths;

  String? _image1;
  final picker = ImagePicker();

  String? _extension;
  bool _multiPick = false;
  String? type;
  List fileList = [];
  TextEditingController _controller = TextEditingController();
  TextEditingController? nameController;
  TextEditingController? phoneController;
  TextEditingController? emailController;

  String? base64Image;
  String? base64ImageFormatted;

  DateTime date = DateTime.now();
  late var formattedDate;

  @override
  void initState() {
    // TODO: implement initState
    nameController = TextEditingController(text: preferences.getUserData()?.user?.name);
    phoneController = TextEditingController(text: preferences.getUserData()?.user?.phoneNumber);
    emailController = TextEditingController(text: preferences.getUserData()?.user?.email);
    _image1 = Urls.imageUrl+preferences.getUserData()?.user?.profileInformation?.profilePicture;

    super.initState();
  }

  String getFile(fileName) {
    return fileName.replaceAll('(', '').replaceAll(')', '');
  }

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _image1 = pickedFile.path;
      fileList.add(_image1);
      Uint8List imageBytes =
      await File(pickedFile.path).readAsBytes(); //convert to bytes
      base64Image = base64.encode(imageBytes);
      setState(() {});
      log("selected file type : ${CustomFileType.getType(pickedFile.path)}");
      base64ImageFormatted =
      "data:${CustomFileType.getType(pickedFile.path)};base64,$base64Image";

      type = "image";
      log("camera_photo========> $base64ImageFormatted");
    } else {
      print('No image selected.');
    }
  }

  ScrollController? scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
  listener: (context, state) {
    if(state.status == ProfileUpdate.loading){
      showProgressDialog();
    }else if(state.status == ProfileUpdate.success){
      GetContext.to(DashboardScreen());
      dismissProgressDialog();
    }
    else if(state.status == ProfileUpdate.failure){
      dismissProgressDialog();
    }

  },
  builder: (context, state) {
    return Scaffold(
      appBar: AppBar(
        title: Text(preferences.getUserData()?.user?.name??""),
      ),
      body: SizedBox(
        height: 1.sh,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              kHeightBox10,
              Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    width: 1.sw,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black12, width: 0.5),
                    ),
                    child: ListView(
                      controller: scrollController,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            DottedButton(
                              isUrl: CategoryHelper.isNetworkImage(_image1),
                              fileName: _image1,
                              onTap: () {
                                //_pickFiles();
                                //getImage();
                                getImage();
                              },
                            ),
                          ],
                        ),
                        kHeightBox10,
                        Text(
                          "Name",
                          style: kRegularLine15.copyWith(
                              fontWeight: FontWeight.w600),
                        ),
                        kHeightBox10,
                        CustomTextField(
                          radius: 10,
                          controller: nameController,
                          hint: "name",
                        ),
                        kHeightBox10,
                        Text(
                          "Email",
                          style: kRegularLine15.copyWith(
                              fontWeight: FontWeight.w600),
                        ),
                        kHeightBox10,
                        CustomTextField(
                          isEnable: false,
                          radius: 10,
                          controller: emailController,
                          hint: "email",

                        ),
                        kHeightBox10,
                        Text(
                          "Phone Number",
                          style: kRegularLine15.copyWith(

                              fontWeight: FontWeight.w600),
                        ),
                        kHeightBox10,
                        CustomTextField(
                          radius: 10,
                          controller: phoneController,
                          hint: "phone number",
                        ),


                        kHeightBox50,
                        DefaultBtn(
                          onPress: () {
                            context.read<AuthCubit>().profileUpdate(
                                image: CategoryHelper.isNetworkImage(_image1)
                                    ? null
                                    : base64ImageFormatted,
                                name: nameController?.text,
                                phoneNumber: phoneController?.text);
                          },
                          title: AppStrings.update.tr(),
                          radius: 10,
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  },
);
  }
}
