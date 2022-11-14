

// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Cubit Folder/my_cubit.dart';
import '../../Cubit Folder/my_states.dart';
import '../../shared/appbar/app_bar.dart';
import '../../shared/constant.dart';
import '../../shared/navigation/navigation.dart';
import '../../shared/widgets/loading_screen.dart';
import '../../shared/oneOrder/order_item.dart';
import '../notification/notification.dart';
import 'one_order_details_screen.dart';

class AllOrders extends StatelessWidget {
  AllOrders({Key? key}) : super(key: key);
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PharmacyCubit, PharmacyStates>(
      listener: (context, state) { },
      builder: (context, state) {
        var cubit = PharmacyCubit.get(context);
        return Directionality(
            textDirection: TextDirection.rtl,
            child: SafeArea(
                child: cubit.pharmacyOrdersModel == null
                    ? loadingWidget()
                    : RefreshIndicator(
                      onRefresh: () => cubit.getAboutUs(),
                      child: Scaffold(
                                      appBar: myAppBar("الطلبات", () {
                      navigateTo(context, const NotificationScreen());
                                      }, appBarIconNotification, context),
                                      body: Stack(
                      children: [
                        backgroundImage(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height),
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              ListView.builder(
                                itemCount: cubit.pharmacyOrdersModel!.data!.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  return orderItem(
                                      cubit.pharmacyOrdersModel!.data![index].id.toString(),
                                      cubit.pharmacyOrdersModel!.data![index].date.toString(),
                                      (){
                                        cubit.getCategories();
                                        cubit.getOneOrder(cubit.pharmacyOrdersModel!.data![index].id.toString());
                                        navigateTo(context, const OneOrderDetailsScreen());
                                      },
                                    cubit.pharmacyOrdersModel!.data![index].status!.toInt(),
                                    cubit.pharmacyOrdersModel!.data![index].status == 2 ?"جاهز للتوصيل"
                                    : cubit.pharmacyOrdersModel!.data![index].status == 3 ? "تم التسليم"
                                    : cubit.pharmacyOrdersModel!.data![index].status == 5 ? "جاري التسليم"
                                    : "غير محدد"
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                                      ),
                                    ),
                    )));
      },
    );
  }
}
