
import 'package:elagy_pharmacy_app/modules/auth/reset_password.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';


import '../../Cubit Folder/my_cubit.dart';
import '../../Cubit Folder/my_states.dart';
import '../../shared/constant.dart';
import '../../shared/navigation/navigation.dart';
import '../../shared/button/button.dart';
import '../../shared/widgets/text_form_field.dart';


var phoneController = TextEditingController();
var passwordControllr = TextEditingController();

class LoginScreenPharm extends StatelessWidget {
  const LoginScreenPharm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var cubit = PharmacyCubit.get(context);
    return BlocConsumer<PharmacyCubit, PharmacyStates>(
      listener: (context, state) { },
        builder: (context, state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: SafeArea(
              child: Scaffold(
                resizeToAvoidBottomInset: true,
                body: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Stack(children: [
                    backgroundImage(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height),
                    SingleChildScrollView(
                        child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                logo,
                                const SizedBox(height: 26),
                                const Text("تسجيل الدخول",
                                    style: TextStyle(
                                        fontSize: 24,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700)),
                                const SizedBox(height: 16),
                                Text("برجاء قم بتسجيل الدخول",
                                    style: TextStyle(
                                        fontSize: 18, color: HexColor("#A5A5A5"))),
                                const SizedBox(height: 51),
                                myTextFormField(
                                  controller: phoneController,
                                  context: context,
                                  inputType: TextInputType.emailAddress,
                                  hint: "account@example.com",
                                  label: Text("اسم المستخدم",
                                      style: TextStyle(
                                          color: HexColor("#A5A5A5"), fontSize: 14)),
                                ),
                                const SizedBox(height: 26),
                                myTextFormField(
                                  controller: passwordControllr,
                                  context: context,
                                  inputType: TextInputType.visiblePassword,
                                  obsecure: true,
                                  lines: 1,
                                  hint: "****************",
                                  label: Text("كلمة المرور",
                                      style: TextStyle(
                                          color: HexColor("#A5A5A5"), fontSize: 14)),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: TextButton(
                                      onPressed: () {
                                        navigateTo(context, ResetPassword());
                                      },
                                      child: Text(
                                        "نسيت كلمة المرور",
                                        style: TextStyle(
                                            fontSize: 14, color: HexColor("#E2C520")),
                                      )),
                                ),
                                const SizedBox(height: 10),
                                cubit.isLoadingAuth == true
                                    ? CircularProgressIndicator(color: HexColor("#04914F"))
                                    : myButton("تسجيل الدخول", "#3193E5", () {
                                        if (kDebugMode) {
                                          print("Password is : ${passwordControllr.text}\nEmail is : ${phoneController.text}" );
                                        }
                                        cubit.login(password: passwordControllr.text, email: phoneController.text, context: context);
                                        }),
                              ],
                            )) ),
                  ]),

                ),
              )),
        );
      },
    );
  }
}
