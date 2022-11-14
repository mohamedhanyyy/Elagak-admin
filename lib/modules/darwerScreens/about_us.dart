import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../Cubit Folder/my_cubit.dart';
import '../../Cubit Folder/my_states.dart';
import '../../shared/aboutUsSceen/about_us.dart';
import '../../shared/appbar/app_bar.dart';
import '../../shared/constant.dart';
import '../../shared/widgets/loading_screen.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PharmacyCubit, PharmacyStates>(

      listener: (context, state) { },
      builder: (context, state) {
        var cubit = PharmacyCubit.get(context);
        return Directionality(
            textDirection: TextDirection.rtl,
            child: SafeArea(
              child: Scaffold(
                appBar: fixxedAppBar("عن التطبيق"),
                body: cubit.aboutUsModel == null
                    ? loadingWidget()
                    : Stack(
                  children: [
                    backgroundImage(MediaQuery.of(context).size.width,
                        MediaQuery.of(context).size.height),
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            aboutUSTitle(
                                "assets/images/about_us/info(1).png",
                                "من نحن"),
                            defaultSizedBoxSmall(),
                            aboutUsText(cubit.aboutUsModel!.data!.aboutUs
                                .toString()),
                            defaultSizedBoxBig(),
                            aboutUSTitle(
                                "assets/images/about_us/visibility.png",
                                "روئيتنا"),
                            defaultSizedBoxSmall(),
                            aboutUsText(cubit.aboutUsModel!.data!.ourVision
                                .toString()),
                            defaultSizedBoxBig(),
                            aboutUSTitle(
                                "assets/images/about_us/refresh.png",
                                "الاصدار"),
                            defaultSizedBoxSmall(),
                            Text(
                              "1.0.0",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: HexColor("#5F5F5F")),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }

  SizedBox defaultSizedBoxBig() {
    return const SizedBox(
      height: 40,
    );
  }

  SizedBox defaultSizedBoxSmall() {
    return const SizedBox(
      height: 20,
    );
  }
}
