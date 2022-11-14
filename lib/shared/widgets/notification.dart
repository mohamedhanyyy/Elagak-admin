import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

Widget notificationUtem(
    String orderNum,
    String orderTime,
    VoidCallback callback
    ) =>
    InkWell(
      onTap: callback,
      child: Padding(
          padding: const EdgeInsets.all(5),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: HexColor("#F9D923"),
                        ),
                        child: const Icon(
                          Icons.notifications_none,
                          color: Colors.white,
                        )),
                    const SizedBox(width: 10),
                    Text("تم وصول طلب جديد برقم $orderNum",
                        style:
                        const TextStyle(fontSize: 12, color: Colors.black)),
                    const Spacer(),
                    Text(orderTime,
                        style:
                        const TextStyle(fontSize: 12, color: Colors.black)),
                  ],
                )),
          )),
    );
