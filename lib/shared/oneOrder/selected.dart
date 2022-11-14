import 'package:elagy_pharmacy_app/shared/widgets/cashed_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

Widget oneOrderItemSelected(
    BuildContext context,
    String imageSrc,
    String orderName,
    String orderItemQuntity,
    String orderItemPrice,
    double? elevation
    ) =>
    Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Card(
        elevation: elevation,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          width: double.infinity,
          child: Row(
            children: <Widget>[
              SizedBox(
                height: 100,
                width: 100,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  child: defaultNetworkImg(
                      context,
                      double.infinity,
                      double.infinity,
                      imageSrc,
                      BoxFit.cover,
                      10
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        orderName,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        "الكمية : $orderItemQuntity",
                        style:
                        TextStyle(fontSize: 16, color: HexColor("#484848")),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        "سعر القطعة : $orderItemPrice",
                        style:
                        TextStyle(fontSize: 16, color: HexColor("#484848")),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

