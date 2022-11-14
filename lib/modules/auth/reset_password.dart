

// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:elagy_pharmacy_app/modules/auth/login_pharmacy.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../Cubit Folder/my_cubit.dart';
import '../../Cubit Folder/my_states.dart';
import '../../shared/constant.dart';
import '../../shared/navigation/navigation.dart';
import '../../shared/button/button.dart';
import '../../shared/widgets/text_form_field.dart';

class ResetPassword extends StatelessWidget {
  ResetPassword({Key? key}) : super(key: key);

  var size, height, width;
  var otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    var cubit = PharmacyCubit.get(context);
    return BlocConsumer<PharmacyCubit, PharmacyStates>(
      listener: (context, state) { },
      builder: (context, state) {
        return SafeArea(
          child: Directionality(
              textDirection: TextDirection.rtl,
              child: Scaffold(
                resizeToAvoidBottomInset: true,
                body: SingleChildScrollView(
                  child: Stack(children: [
                    backgroundImage(width, height),
                    Padding(
                        padding: const EdgeInsets.all(15),
                        child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                logo,
                                const SizedBox(height: 26),
                                const Text("هل نسيت كلمة السر",
                                    style: TextStyle(
                                        fontSize: 24,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700)),
                                const SizedBox(height: 16),
                                Text(
                                    "سيتم إرسال كلمة سر جديدة علي برديك الإلكتروني المسجل لدينا",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 18, color: HexColor("#A5A5A5"))),
                                const SizedBox(height: 51),
                                myTextFormField(
                                  controller: otpController,
                                  context: context,
                                  inputType: TextInputType.emailAddress,
                                  hint: "123456",
                                  label: Text("البريد الحالي المسجل لدينا",
                                      style: TextStyle(
                                          color: HexColor("#A5A5A5"),
                                          fontSize: 14)),
                                ),
                                const SizedBox(height: 16),
                                const SizedBox(height: 10),
                                cubit.isLoadingAuth == true
                                    ? CircularProgressIndicator(color: HexColor("#04914F"))
                                    : myButton("إرسال", "#3193E5", () {cubit.resetPassword(email: otpController.text, context: context);}),
                                const SizedBox(height: 10),
                                Center(
                                    child: RichText(
                                      text: TextSpan(children: [
                                        const TextSpan(
                                          text: 'حساب بالفعل ؟ ',
                                          style: TextStyle(
                                              color: Colors.black, fontSize: 14),
                                        ),
                                        TextSpan(
                                            text: "الدخول",
                                            style: TextStyle(
                                              color: HexColor("#A5A5A5"),
                                            ),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                navigateTo(context, const LoginScreenPharm());
                                              }),
                                      ]),
                                    )),
                              ],
                            )))
                  ]),
                ),
              )),
        );
      },
    );
  }
}
