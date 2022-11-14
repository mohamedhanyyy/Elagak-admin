import 'package:flutter/material.dart';

Widget orderItem(
    String orderNumber,
    String orderDate,
    GestureTapCallback pressAction,
    int status,
    String statusType,
    ) =>
    Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.grey[200]),
        child: ListTile(
          onTap: pressAction,
          leading: CircleAvatar(
            backgroundColor: Colors.transparent,
            child: SizedBox(
                width: 52,
                height: 52,
                child: ClipOval(
                    child: Image.asset(
                        "assets/images/order/4140048.png"))),
          ),
          title: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Text("الطلب رقم $orderNumber",
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600)),
          ),
          subtitle: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color :
                    status == 1
                    ? Colors.grey
                    : status == 4
                ? Colors.red
                        :Colors.green
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                    status == 1
                        ? "طلب جديد"
                        : status == 4
                        ? "رفض او ازعاج"
                        : statusType,
                    style:
                    const TextStyle(color: Colors.white, fontSize: 16)),
              ),
            ),
          ),
          trailing: Text(
            orderDate,
            style: const TextStyle(fontSize: 14),
          ),
        ),
      ),
    );

