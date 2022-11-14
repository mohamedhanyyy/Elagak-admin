import 'package:elagy_pharmacy_app/modules/notification/notification.dart';
import 'package:elagy_pharmacy_app/shared/navigation/navigation.dart';
import 'package:elagy_pharmacy_app/shared/widgets/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';




import '../../Cubit Folder/my_cubit.dart';
import '../../Cubit Folder/my_states.dart';
import '../../models/orders/open_image.dart';
import '../../shared/appbar/app_bar.dart';
import '../../shared/constant.dart';
import '../../shared/oneOrder/one_order_item.dart';
import '../../shared/oneOrder/price.dart';
import '../../shared/oneOrder/selected.dart';

var deliveryPriceController = TextEditingController();
var priceController = TextEditingController();

class OneOrderDetailsScreen extends StatelessWidget {
  const OneOrderDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PharmacyCubit, PharmacyStates>(
      listener: (context, state) { },
        builder: (context, state) {
          var cubit = PharmacyCubit.get(context);
          return Directionality(
            textDirection: TextDirection.rtl,
            child: SafeArea(
                child: cubit.oneOrderModel == null
                    ? loadingWidget()
                    : Scaffold(
                  appBar: myAppBarWithBack(
                      "الطلب رقم ${cubit.oneOrderModel!.data!.id.toString()}",() => navigateTo(context, const NotificationScreen()), appBarIconNotification, context),
                  body: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          const Align(
                            alignment: Alignment.centerRight,
                            child: Text("بيانات العميل",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text("العميل : ${cubit.oneOrderModel!.data!.client!.name.toString()}",
                                style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400)),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text("العنوان : ${cubit.oneOrderModel!.data!.address.toString()}",
                                style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400)),
                          ),
                          const SizedBox(height: 20),
                          // map
                          InkWell(
                              onTap: ()=> cubit.launchMap(lat: cubit.oneOrderModel!.data!.latitude.toString(), lng: cubit.oneOrderModel!.data!.longitude.toString()),
                              child: Image.asset("assets/images/order/bg-map.png")),
                          if(cubit.oneOrderModel!.data!.type!.toInt() == 1)
                            ListView.builder(
                              itemCount: cubit.oneOrderModel!.data!.medicines!.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                return oneOrderItemSelected(
                                    context,
                                    cubit.oneOrderModel!.data!.medicines![index].photo.toString(),
                                    cubit.oneOrderModel!.data!.medicines![index].name.toString(),
                                    cubit.oneOrderModel!.data!.medicines![index].pivot!.amount.toString(),
                                    cubit.oneOrderModel!.data!.medicines![index].pivot!.price.toString(),
                                    0
                                );
                              },
                            ),
                          const SizedBox(height: 20),
                          if(cubit.oneOrderModel!.data!.type!.toInt() == 0)
                            const Align(
                              alignment: Alignment.centerRight,
                              child: Text("الأدوية",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600)),
                            ),
                          const SizedBox(height: 20),
                          if(cubit.oneOrderModel!.data!.type!.toInt() == 0)
                            if(cubit.oneOrderModel!.data!.description != null)
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text(cubit.oneOrderModel!.data!.description.toString(),
                                    style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                              ),
                          if(cubit.oneOrderModel!.data!.type!.toInt() == 0)
                            if(cubit.oneOrderModel!.data!.photo != null)
                              ListView.builder(
                                itemCount: 1,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  return oneOrderItems(
                                      context,
                                          () => navigateTo(context, ImageSlideShow(image: cubit.oneOrderModel!.data!.photo.toString())),
                                      cubit.oneOrderModel!.data!.photo.toString(),
                                      index
                                  );
                                },
                              ),
                          priceSumary(
                              cubit.oneOrderModel!.data!.price.toString(),
                              cubit.oneOrderModel!.data!.couponAmount.toString(),
                              cubit.oneOrderModel!.data!.priceAfterOffer.toString()
                          ),
                          const SizedBox(height: 25),
                          if(cubit.oneOrderModel!.data!.status == 1 )
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    var deliveryPrice = TextFormField(
                                      controller: deliveryPriceController,
                                      autofocus: true,
                                      keyboardType: TextInputType.name,
                                      decoration: const InputDecoration(labelText: 'سعر التوصيل'),
                                    );
                                    var price = TextFormField(
                                      controller: priceController,
                                      autofocus: true,
                                      keyboardType: TextInputType.datetime,
                                      decoration: const InputDecoration(labelText: 'سعر الروشتة')
                                    );
                                    var sendBtn = MaterialButton(
                                      child: const Text('ارسال'),
                                      onPressed: () { 
                                        debugPrint("delivery price is : ${deliveryPriceController.text}");
                                        debugPrint("order price is : ${priceController.text}");
                                        cubit.finishOrder(cubit.oneOrderModel!.data!.id.toString(), context,deliveryPriceController.text.toString(),priceController.text.toString());
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
                                                    const Text("ارسال سعر الروشتة و التوصيل",textDirection: TextDirection.rtl,),
                                                    Container( padding: const EdgeInsets.all(20),child: deliveryPrice),
                                                    Container(padding: const EdgeInsets.all(20),child: price),
                                                    cubit.isLoadingAuth? CircularProgressIndicator(color: HexColor("#04914F")) 
                                                      : Row(
                                                        mainAxisSize: MainAxisSize.min,
                                                        children: <Widget>[sendBtn,cancelButton]
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
                                  child: Container(
                                    width: 120,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: HexColor("#EFFCF6"),
                                    ),
                                    child: Center(
                                        child: Text(
                                          "تم التجهيز",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              color: HexColor("#04914F")),
                                        )),
                                  ),
                                ),
                                const SizedBox(width: 15),
                                InkWell(
                                  onTap: () => cubit.reportOrder(cubit.oneOrderModel!.data!.id.toString(),context),
                                  child: Container(
                                    width: 120,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: HexColor("#FCEFEF"),
                                    ),
                                    child: Center(
                                        child: Text(
                                          "رفض او ازعاج",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              color: HexColor("#FF1717")),
                                        )),
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ),
                )),
          );
        });}}
