import 'package:dropdown_search/dropdown_search.dart';
import 'package:elagy_pharmacy_app/shared/button/button.dart';
import 'package:elagy_pharmacy_app/shared/widgets/text_form_field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../Cubit Folder/my_cubit.dart';
import '../../Cubit Folder/my_states.dart';
import '../../shared/appbar/app_bar.dart';
import '../../shared/constant.dart';
import '../../shared/navigation/navigation.dart';
import '../../shared/widgets/loading_screen.dart';
import '../notification/notification.dart';

var amountController = TextEditingController();
var priceController = TextEditingController();

class AddNewMedicines extends StatelessWidget {
  const AddNewMedicines({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) { 
    return BlocConsumer<PharmacyCubit, PharmacyStates>(
      listener: (context, state) { },
        builder: (context, state) {
    var cubit = PharmacyCubit.get(context); 
    return Directionality(
    textDirection: TextDirection.rtl,
    child: SafeArea(
      child: cubit.allMedicines == null
        ? loadingWidget()
        : Scaffold(
          appBar: myAppBarWithBack("إضافة منتج",() => navigateTo(context, const NotificationScreen()), appBarIconNotification, context),
          body: Stack(
            children: [
              backgroundImage(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                  children: [ 
                    DropdownSearch<String>(
                      showSearchBox: true,
                      // popupShape: ShapeBorder(),
                      items: cubit.itemsName,
                      onChanged: (value){
                        if (kDebugMode) {
                          print("cubit.itemsName.indexOf(value.toString()) ${cubit.itemsName.indexOf(value.toString())}");
                        }
                        cubit.medId= cubit.itemsID[cubit.itemsName.indexOf(value.toString())];
                        debugPrint("medicine id is : ${cubit.medId}");
                      },
                      selectedItem: "إختر المنتج للإضافة",
                    ),
                    const SizedBox(height: 10),
                    myTextFormField(
                      context: context,
                      controller: amountController,
                      inputType: TextInputType.number,
                      label: Text("الكمية المتاحة",style: TextStyle(fontSize: 14, color: HexColor("#A5A5A5"))),
                    ),
                    const SizedBox(height: 10),
                    myTextFormField(
                      context: context,
                      controller: priceController,
                      inputType: TextInputType.number,
                      label: Text("سعر البيع للقطعة",style: TextStyle(fontSize: 14, color: HexColor("#A5A5A5"))),
                    ),
                    const Spacer(),
                    cubit.isLoadingAuth == true
                                  ? CircularProgressIndicator(color: HexColor("#04914F"))
                                  : myButton("إضافة المنتج", "#3193E5", (){
                      cubit.pharmacyAddMedicines(priceController.text,amountController.text,context);
                    })
                  ],
                ),
              ),
            ],
          ),
        ), 
    ),
    );
        }
    );
  } 
}