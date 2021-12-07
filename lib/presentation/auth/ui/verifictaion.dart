import 'package:flutter/material.dart';
import 'package:oyinshyq/base/base_provider.dart';
import 'package:oyinshyq/presentation/auth/provider/confirm_sms_provider.dart';
import 'package:oyinshyq/shared/size_config.dart';
import 'package:oyinshyq/shared/theme.dart';
import 'package:oyinshyq/shared/ui_helper.dart';
import 'package:oyinshyq/shared/utils.dart';
import 'package:oyinshyq/widgets/default_button.dart';
import 'package:pinput/pin_put/pin_put.dart';

class VerificationScreen extends StatelessWidget {
  final String? phone;
  VerificationScreen({this.phone});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.systemWhiteColor,
        body: BaseProvider<VerificationProvider>(
          model: VerificationProvider(),
          builder: (context, model, child) {
            return Column(
              children: [
                UIHelper.verticalSpace(
                  getProportionateScreenHeight(190),
                ),
                Text(
                  'Введите код',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    fontSize: getProportionateScreenWidth(24),
                    color: AppColors.systemBlackColor,
                  ),
                ),
                UIHelper.verticalSpace(10),
                Text(
                  'На ваш номер отправлен SMS-код.\nВведите его.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(16),
                    color: AppColors.systemDarkGrayColor,
                  ),
                ),
                UIHelper.verticalSpace(30),
                Container(
                  child: PinPut(
                    fieldsCount: 4,
                    withCursor: true,
                    controller: model.controller,
                    textStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Inter',
                    ),
                    onChanged: (value) {
                      model.checkPin(value);
                    },
                    fieldsAlignment: MainAxisAlignment.center,
                    eachFieldWidth: 40.0,
                    eachFieldHeight: 54.0,
                    eachFieldMargin: EdgeInsets.only(right: 10),
                    submittedFieldDecoration: kPinPutDecoration,
                    selectedFieldDecoration: kPinPutDecoration,
                    followingFieldDecoration: kPinPutDecoration,
                    pinAnimationType: PinAnimationType.fade,
                    onSubmit: (String pin) {
                      print(pin);
                    },
                  ),
                ),
                model.pinError != null
                    ? Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          model.pinError!,
                          style: TextStyle(color: AppColors.systemRedColor),
                        ),
                      )
                    : SizedBox(),
                UIHelper.verticalSpace(16),
                Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(40),
                  ),
                  child: DefaultButton(
                    color: model.isButtonEnabled
                        ? null
                        : AppColors.systemLightGrayColor,
                    width: double.infinity,
                    text: 'Подтвердить',
                    press: model.isButtonEnabled
                        ? () {
                            model.toRegisterCompany(context, phone);
                          }
                        : () {
                            // TODO: Need translate
                            showCustomToast(
                              "Код верификации не может быть пустым",
                            );
                          },
                  ),
                ),
                UIHelper.verticalSpace(40),
              ],
            );
          },
        ),
      ),
    );
  }
}
