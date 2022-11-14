import 'package:elagy_pharmacy_app/shared/widgets/cashed_network_image.dart';
import 'package:flutter/material.dart';

Widget oneOrderItems(
    BuildContext context,
    VoidCallback callback,
    String imagesrc,
    int index
    ) =>
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Align(
            alignment: Alignment.center,
            child: TextButton(
              onPressed: callback,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * .5,
                height: 200,
                child: defaultNetworkImg(context, double.infinity, double.infinity, imagesrc, BoxFit.cover, 5),
              )
            ),
          ),
        ],
      ),
    );