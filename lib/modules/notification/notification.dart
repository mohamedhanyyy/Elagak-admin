
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Cubit Folder/my_cubit.dart';
import '../../Cubit Folder/my_states.dart';
import '../../shared/appbar/app_bar.dart';
import '../../shared/navigation/navigation.dart';
import '../../shared/widgets/notification.dart';
import '../Home/one_order_details_screen.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

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
                appBar: noramlAppBar("التنبيهات"),
                body: SingleChildScrollView( 
                  child: ListView.builder(
                  itemCount: cubit.pharmacyOrdersModel!.data!.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return notificationUtem(
                      cubit.pharmacyOrdersModel!.data![index].id.toString(),
                      cubit.pharmacyOrdersModel!.data![index].date.toString(),
                      (){
                        cubit.getCategories();
                        cubit.getOneOrder(cubit.pharmacyOrdersModel!.data![index].id.toString());
                        navigateTo(context, const OneOrderDetailsScreen());
                      },
                      );
                  },
                ),
              ),
              )
            ));
      },
    );
  }
}
