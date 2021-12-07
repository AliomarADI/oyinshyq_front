import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';
import 'package:oyinshyq/base/base_provider.dart';
import 'package:oyinshyq/presentation/auth/provider/login_provider.dart';
import 'package:oyinshyq/shared/size_config.dart';
import 'package:oyinshyq/shared/theme.dart';
import 'package:oyinshyq/shared/ui_helper.dart';
import 'package:oyinshyq/shared/utils.dart';
import 'package:oyinshyq/widgets/custom_container.dart';
import 'package:oyinshyq/widgets/default_button.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.systemWhiteColor,
        body: BaseProvider<LoginProvider>(
          model: LoginProvider(),
          builder: (context, model, child) {
            return Column(
              children: [
                UIHelper.verticalSpace(
                  getProportionateScreenHeight(190),
                ),
                Text(
                  'Добро пожавловать',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    fontSize: getProportionateScreenWidth(24),
                    color: AppColors.systemBlackColor,
                  ),
                ),
                UIHelper.verticalSpace(10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    'Введите номер телефона',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: getProportionateScreenWidth(16),
                        color: AppColors.systemDarkGrayColor),
                  ),
                ),
                UIHelper.verticalSpace(30),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(40),
                  ),
                  child: CustomContainer(
                    child: TextField(
                      controller: model.controller,
                      onChanged: (String value) {
                        model.checkPhoneNumber(value);
                      },
                      keyboardType: TextInputType.number,
                      cursorColor: AppColors.systemBlackColor,
                      inputFormatters: [
                        MaskedInputFormatter('000 000 0000'),
                      ],
                      decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(top: 12),
                          child: Text(
                            '+7  ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.systemBlackColor,
                              fontFamily: 'Inter',
                              fontSize: 16,
                            ),
                          ),
                        ),
                        hintText: 'XXX XXX XXXX',
                        hintStyle: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 16,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(40),
                  ),
                  child: DefaultButton(
                    width: double.infinity,
                    color: model.isButtonEnabled
                        ? null
                        : AppColors.systemLightGrayColor,
                    text: 'Дальше',
                    press: model.isButtonEnabled
                        ? () {
                            model.toVerification(context);
                          }
                        : () {
                            // TODO: Need translate
                            showCustomToast(
                              "Номер телефона пустой или не совпадает формату",
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
