

import 'package:device_preview/device_preview.dart';
import 'package:elagy_pharmacy_app/modules/notification/notification.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';


import 'Cubit Folder/my_cubit.dart';
import 'modules/opening/offline_widget.dart';
import 'modules/opening/splash_screen.dart';
import 'shared/key/global_key.dart';
import 'shared/network/local/cache_helper.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  BuildContext globalContext = Global.materialKey.currentContext!;
    Navigator.of(globalContext).pushNamed("notification");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: HexColor("#04914F")));

  // foreground fcm
  FirebaseMessaging.onMessage.listen((event) {
    Fluttertoast.showToast(
      msg: "there is an update of Notification go and check it",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
    );
  });

  // when click on notification to open app
  FirebaseMessaging.onMessageOpenedApp.listen((event) {
    BuildContext globalContext = Global.materialKey.currentContext!;
    Navigator.of(globalContext).pushNamed("notification");
  });

  // background fcm
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  await CacheHelper.init();
  runApp(DevicePreview(
      enabled: !kReleaseMode, builder: (context) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PharmacyCubit()..getAboutUs(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        theme: ThemeData(fontFamily: 'DIN Next LT Arabic'),
        title: "3elagk pharmacy - علاجك لصيدليات",
        color: HexColor("#04914F"), 
        routes: {
          "notification" : (_) => const NotificationScreen(),
        },
        home: OfflineBuilder(
          connectivityBuilder: (
              BuildContext context,
              ConnectivityResult connectivity,
              Widget child,
              ) {
            final bool connected = connectivity != ConnectivityResult.none;
            if (connected) {
              return const SplashScreen();
            } else {
              return const OfflineWidget();
            }
          },
          child: const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
