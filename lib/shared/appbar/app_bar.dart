import 'package:elagy_pharmacy_app/Cubit%20Folder/my_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../modules/auth/make_login.dart';
import '../drawer/menu_widget.dart';
import '../navigation/navigation.dart';
import '../network/local/cache_helper.dart';

PreferredSizeWidget myAppBar(String title, Function()? buttonAction, Widget widget, BuildContext context) => AppBar(
      iconTheme: const IconThemeData(color: Colors.black),
      title: Text(title,
          style: TextStyle(
              fontSize: 22,
              color: HexColor("#000000"),
              fontWeight: FontWeight.w500)),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: true,
      actions: [
        Padding(
          padding: const EdgeInsets.all(5),
          child: InkWell(
            onTap: CacheHelper.getData(key: 'token') == null
                ? () {
              navigateTo(
                  context,
                  MakeLogInScreen(
                    title: 'الشراء',
                  ));
            }
                : buttonAction,
            child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    color: HexColor("#FFFFFF"),
                    border: Border.all(color: HexColor("#F2F3F8"), width: 1),
                    borderRadius: BorderRadius.circular(15)),
                child: widget),
          ),
        ),
      ],
      leading: const MenuWidget(),
    );


PreferredSizeWidget myAppBarWithBack(String title, Function()? buttonAction,
    Widget widget, BuildContext context) =>
    AppBar(
      iconTheme: const IconThemeData(color: Colors.black),
      title: Text(title,
          style: TextStyle(
              fontSize: 22,
              color: HexColor("#000000"),
              fontWeight: FontWeight.w500)),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: true,
      actions: [
        Padding(
          padding: const EdgeInsets.all(5),
          child: InkWell(
            onTap: CacheHelper.getData(key: 'token') == null
                ? () {
              navigateTo(
                  context,
                  MakeLogInScreen(
                    title: 'الشراء',
                  ));
            }
                : buttonAction,
            child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    color: HexColor("#FFFFFF"),
                    border: Border.all(color: HexColor("#F2F3F8"), width: 1),
                    borderRadius: BorderRadius.circular(15)),
                child: widget),
          ),
        ),
      ],
    );


PreferredSizeWidget noramlAppBar(String title) => AppBar(
  iconTheme: const IconThemeData(color: Colors.black),
  title: Text(title,
      style: TextStyle(
          fontSize: 22,
          color: HexColor("#000000"),
          fontWeight: FontWeight.w500)),
  centerTitle: true,
  backgroundColor: Colors.transparent,
  elevation: 0,
  automaticallyImplyLeading: true,
);



PreferredSizeWidget fixxedAppBar(String title) => AppBar(
  iconTheme: const IconThemeData(color: Colors.black),
  title: Text(title,
      style: TextStyle(
          fontSize: 22,
          color: HexColor("#000000"),
          fontWeight: FontWeight.w500)),
  centerTitle: true,
  backgroundColor: Colors.transparent,
  elevation: 0,
  automaticallyImplyLeading: true,
  leading: const MenuWidget(),
);


PreferredSizeWidget logOutAppBar(String title, Widget widget, BuildContext context, PharmacyCubit cubit) => AppBar(
  iconTheme: const IconThemeData(color: Colors.black),
  title: Text(title,
      style: TextStyle(
          fontSize: 22,
          color: HexColor("#000000"),
          fontWeight: FontWeight.w600)),
  centerTitle: true,
  backgroundColor: Colors.transparent,
  elevation: 0,
  automaticallyImplyLeading: true,
  actions: [
    Padding(
      padding: const EdgeInsets.all(5),
      child: InkWell(
        onTap:  () {
          var btn = MaterialButton(
          child: const Text('تسجيل الخروج'),
          onPressed: () { 
            if (kDebugMode) {
              print("Logout start");
            }
            cubit.logOutAccount(context);
            if (kDebugMode) {
              print("logout finish");
            }
            Navigator.of(context).pop(false);
          },
        );
          var cancelButton = MaterialButton(
            child: const Text('إلغاء'),
            onPressed: () =>Navigator.of(context).pop(false));
          showDialog(
          context: context,
          builder: (
              BuildContext context) =>
              Center(
                child: Dialog(
                  insetPadding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * .2, vertical:  MediaQuery.of(context).size.height * .3),
                  clipBehavior: Clip.none,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                  elevation: 0.0,
                  backgroundColor: Colors.transparent,
                  child: Stack(
                    children: < Widget>[
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(6),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10.0,
                              offset: Offset(0.0,10.0),
                            ),
                          ],
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              const SizedBox(height: 5.0),
                              const Text("هل انت متأكد من تسجيل الخروج"),
                              cubit.isLoadingAuth? CircularProgressIndicator(color: HexColor("#04914F")) : Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[btn,cancelButton]),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
        );
        },
        child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                color: HexColor("#FFFFFF"),
                border: Border.all(color: HexColor("#F2F3F8"), width: 1),
                borderRadius: BorderRadius.circular(15)),
            child: widget),
      ),
    ),
  ],
  leading: const MenuWidget(),
);