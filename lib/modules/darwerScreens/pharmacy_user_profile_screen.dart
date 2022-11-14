

import 'package:elagy_pharmacy_app/shared/appbar/app_bar.dart';
import 'package:elagy_pharmacy_app/shared/constant.dart';
import 'package:elagy_pharmacy_app/shared/navigation/navigation.dart';
import 'package:elagy_pharmacy_app/shared/network/local/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';


import '../../Cubit Folder/my_cubit.dart';
import '../../Cubit Folder/my_states.dart';
import '../../shared/widgets/cashed_network_image.dart';
import '../../shared/widgets/loading_screen.dart';
import '../../shared/widgets/product.dart';
import 'add_medicine.dart';

var newAmountController = TextEditingController();
var newPriceController = TextEditingController();

class PharmacyProfileUser extends StatelessWidget {
  const PharmacyProfileUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PharmacyCubit, PharmacyStates>(
      listener: (context, state) { },
        builder: (context, state) {
          var cubit = PharmacyCubit.get(context);
          return Directionality(
            textDirection: TextDirection.rtl,
            child: cubit.onePharmacyModel == null
            ? loadingWidget()
            : SafeArea(
              child: Scaffold(
                backgroundColor: HexColor("#FBFBFB"),
                appBar: logOutAppBar(cubit.onePharmacyModel!.data!.name.toString(), appBarLogOut, context, cubit),
                body: Stack(
                  children: [
                    backgroundImage(MediaQuery.of(context).size.width,MediaQuery.of(context).size.height),
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              height: 260,
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 100,
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
                                        child: defaultNetworkImg(
                                          context,
                                          double.infinity,
                                          double.infinity,
                                          cubit.onePharmacyModel!.data!.photo.toString(),
                                          BoxFit.fitWidth,
                                          0,
                                        ),
                                    )
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Card( 
                                      shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(10)),
                                      elevation: 5,
                                      child: Container(
                                        padding: const EdgeInsets.all(10),
                                        width: MediaQuery.of(context).size.width *.90,
                                        height: 190,
                                        decoration: BoxDecoration(borderRadius:BorderRadius.circular(8),color: Colors.white),
                                          child: Column(
                                            children: [
                                              Text(
                                                cubit.onePharmacyModel!.data!.name.toString(),
                                                style: const TextStyle(fontSize: 24)
                                              ),
                                              Row(
                                                mainAxisAlignment:MainAxisAlignment.center,
                                                children: [
                                                  Image.asset("assets/images/profile/Iconfeather-map-pin.png"),
                                                  const SizedBox(width: 8),
                                                  InkWell(
                                                    onTap: () {
                                                      cubit.launchMap(
                                                        lat: cubit.onePharmacyModel!.data!.latitude.toString(),
                                                        lng: cubit.onePharmacyModel!.data!.longitude.toString()
                                                      );
                                                    },
                                                    child: Text(
                                                      cubit.onePharmacyModel!.data!.location.toString(),
                                                      maxLines: 1,
                                                      overflow:  TextOverflow.ellipsis,
                                                      style: TextStyle(fontSize: 16,color: HexColor("#484848"))
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 20),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                                child: Row(
                                                  children: [
                                                    Image.asset("assets/images/profile/kkj.png"),
                                                    Text(
                                                      "منطقة\n${cubit.onePharmacyModel!.data!.area!.name.toString()}",
                                                      maxLines: 2,
                                                      overflow:TextOverflow.ellipsis,
                                                      style:const TextStyle(fontSize:16)
                                                    ),
                                                    const Spacer(),
                                                    Image.asset("assets/images/profile/svgexport-6(3).png"),
                                                    const Text(
                                                      "توصيل طلب \n 30 دقيقة",
                                                      maxLines: 2,
                                                      overflow: TextOverflow.ellipsis,
                                                      style: TextStyle(fontSize: 16)
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                      ),
                                    )
                                  )
                                ],
                              ),
                            ),
                            cubit.onePharmacyModel!.data!.activeMedicines!.isEmpty
                              ? const Center(child: Text("لا يوجد منتجات في هذه الصيدلة الآن"))
                              : Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Row(
                                    children: [
                                      const Text(
                                        "المنتجات",
                                        style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                      ),
                                      const Spacer(),
                                      InkWell(
                                        onTap: () {
                                          debugPrint("cubit.getAllMedicines();");
                                          cubit.getAllMedicines();
                                          debugPrint("navigateTo(context, AddNewMedicines());");
                                          navigateTo(context, const AddNewMedicines());
                                        },
                                        child: const Icon(Icons.add_circle_outline),
                                      )
                                    ],
                                  ),
                                ),
                              /*Container(
                                height: 40,
                                color: Colors.transparent,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: cubit.onePharmacyModel!.data!.departments!.length,
                                  itemBuilder: (BuildContext context,int index) {
                                    return categories(
                                      () {
                                        cubit.changeCatIndex(index);
                                      },
                                      cubit.onePharmacyModel!.data!.departments![index].name.toString(),
                                      cubit.selectedCategoryIndex == index
                                    );
                                  },
                                )
                              ),
                              */GridView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 150,
                                    childAspectRatio: 7 / 10,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10
                                  ),
                                  itemCount: cubit.profileMedicines!.paginate!.data!.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return productItemPharmacyApp(
                                      () {
                                        var contentTitle = TextFormField(
                                          controller: newAmountController,
                                          autofocus: true,
                                          keyboardType: TextInputType.name,
                                          decoration: const InputDecoration(labelText: 'الكمية الجديدة'),
                                        );
                                        var contentDate = TextFormField(
                                            controller: newPriceController,
                                            autofocus: true,
                                            keyboardType: TextInputType.datetime,
                                            decoration: const InputDecoration(labelText: 'السعر الجديد')
                                        );
                                        var btn = MaterialButton(
                                          child: const Text('تعديل'),
                                          onPressed: () { 
                                            debugPrint("Proceess editing start");
                                            cubit.pharmacyEditMedicines(cubit.pharmacyMedicinesModel!.paginate!.data![index].id.toString(), newPriceController.text, newAmountController.text, context);
                                            debugPrint("Proceess editing finish");
                                            Navigator.of(context).pop(false);
                                          },
                                        );
                                        var cancelButton = MaterialButton(
                                          child: const Text('إلغاء'),
                                          onPressed: () => Navigator.of(context).pop(false)
                                        );
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) => Dialog(
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
                                                          Text("تعديل المنتج : ${cubit.onePharmacyModel!.data!.activeMedicines![index].name}",textDirection: TextDirection.rtl,),
                                                          Container( padding: const EdgeInsets.all(20),child: contentTitle),
                                                          Container(padding: const EdgeInsets.all(20),child: contentDate),
                                                          cubit.isLoadingAuth
                                                            ? CircularProgressIndicator(color: HexColor("#04914F")) 
                                                            : Row(
                                                              mainAxisSize: MainAxisSize.min,
                                                              children: <Widget>[btn,cancelButton]
                                                            ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                        );
                                      },
                                      cubit.profileMedicines!.paginate!.data![index].name.toString(),
                                      "إضغط للتعديل",
                                      cubit.profileMedicines!.paginate!.data![index].photo.toString(),
                                      context
                                    );
                                  },
                                ),
                              if(cubit.profileMedicines!.paginate!.currentPage!.toInt() < cubit.profileMedicines!.paginate!.lastPage!.toInt())
                                Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () => cubit.getPharmacyProfileMedicines(
                                          (cubit.profileMedicines!.paginate!.currentPage+1).toInt(),
                                          true,
                                          CacheHelper.getData(key: 'id'),
                                        ),
                                        child: Container(
                                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
                                          child: const Icon(Icons.expand_circle_down, size: 35,),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            )
          );
    });}
}