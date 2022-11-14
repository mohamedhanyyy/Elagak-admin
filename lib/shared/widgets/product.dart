import 'package:flutter/material.dart';

import 'cashed_network_image.dart';

Widget productItemPharmacyApp(VoidCallback callback, String productName, String productPrice, String imageSrc, BuildContext context) =>
    InkWell(
      onTap: callback,
      child: Container(
        height: 170,
        width: 116,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: Column(
          children: [
            Expanded(
                child: defaultNetworkImg(
                    context, 70, double.infinity, imageSrc, BoxFit.cover, 0)),
            const SizedBox(height: 5),
            Text(productName,
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.black)),
            const SizedBox(height: 4),
            Text(productPrice,
                style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w200,
                    color: Colors.black)),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
