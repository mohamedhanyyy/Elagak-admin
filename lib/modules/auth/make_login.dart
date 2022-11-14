
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../shared/appbar/app_bar.dart';
import '../../shared/navigation/navigation.dart';
import '../../shared/button/button.dart';
import 'login_pharmacy.dart';

class MakeLogInScreen extends StatelessWidget {
  MakeLogInScreen({required this.title, Key? key}) : super(key: key);
  String title;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: noramlAppBar(title),
            body: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: Image.asset(
                        'assets/images/splash/للوجو.png',
                      ),
                    ),
                    FittedBox(
                      child: Text(
                        'يرجى تسجيل الدخول للوصول لكامل مزايا التطبيق',
                        maxLines: 3,
                        textAlign: TextAlign.center,
                        style:
                        TextStyle(fontSize: 25, color: HexColor('#616363')),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    myButton('تسجيل الدخول الآن', '#0029e7', () {
                      navigateTo(context, const LoginScreenPharm());
                    })
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
