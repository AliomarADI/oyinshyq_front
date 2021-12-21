import 'package:flutter/material.dart';
import 'package:oyinshyq/base/base_provider.dart';
import 'package:oyinshyq/presentation/profile/provider/change_profile_provider.dart';
import 'package:oyinshyq/presentation/profile/provider/profile_provider.dart';
import 'package:oyinshyq/presentation/profile/ui/profile.dart';
import 'package:oyinshyq/shared/app_bar_with_back_button.dart';
import 'package:oyinshyq/shared/custom_app_bar.dart';
import 'package:oyinshyq/shared/size_config.dart';
import 'package:oyinshyq/shared/theme.dart';
import 'package:oyinshyq/shared/ui_helper.dart';
import 'package:oyinshyq/widgets/default_button.dart';

class ChangeProfile extends StatelessWidget {
  final String? img;
  final String? name;
  final String? phone;
  final String? about;
  final ProfileProvider profileProvider;

  const ChangeProfile(
      {Key? key,
      this.img,
      this.name,
      this.phone,
      this.about,
      required this.profileProvider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        height: getProportionateScreenHeight(110),
        child: AppBarChildWithBackButton(title: 'Изменить профиль'),
        decoration: kAppBarDecoration,
      ),
      body: BaseProvider<ChangeProfileProvider>(
        model: ChangeProfileProvider(),
        onReady: (value) async => await value.init(name, phone),
        builder: (context, model, child) {
          return SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UIHelper.verticalSpace(30),
                Center(
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    // backgroundImage: model.isImagePicked
                    //     ? FileImage(File(model.pickedImage.path))
                    //     : NetworkImage(widget.imgURL),
                    backgroundImage: AssetImage('$img'),
                  ),
                ),
                UIHelper.verticalSpace(15),
                Center(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.green,
                      padding: EdgeInsets.zero,
                    ),
                    child: Text(
                      'Выбрать фотографию',
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Inter',
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
                UIHelper.verticalSpace(30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                    'Имя',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                UIHelper.verticalSpace(10),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0xffF8F8F8),
                  ),
                  padding: EdgeInsets.only(left: 10),
                  child: TextFormField(
                    controller: model.nameController,
                    style: TextStyle(color: Colors.black),
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {
                      model.checkValues();
                    },
                  ),
                ),
                UIHelper.verticalSpace(30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                    'Телефон',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                UIHelper.verticalSpace(10),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0xffF8F8F8),
                  ),
                  padding: EdgeInsets.only(left: 10),
                  child: TextFormField(
                    controller: model.phoneController,
                    style: TextStyle(color: Colors.black),
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {
                      model.checkValues();
                    },
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: DefaultButton(
                    width: double.infinity,
                    text: 'Сохранить',
                    color:
                        model.isButtonEnabled ? null : AppColors.inactiveColor,
                    press: () async {
                      // model.isButtonEnabled ?
                      // model.changeUserData(context, model.nameController.text, profModel);
                      profileProvider.changeProfile(model.nameController.text,
                          model.phoneController.text);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfileScreen()));
                      // :
                      //   //TODO add alert dialog
                      //   print('Name cant be empty');

                      // if (model.isImagePicked) {
                      //   print("FILE PICKED!");
                      //   await model.sendChanges(context, controller.text,
                      //       File(model.pickedImage.path), true);
                      // } else {
                      //   await model.sendChanges(
                      //       context, controller.text, File(""), false);
                      // }
                    },
                  ),
                ),
                UIHelper.verticalSpace(20),
              ],
            ),
          );
        },
      ),
    );
  }
}
