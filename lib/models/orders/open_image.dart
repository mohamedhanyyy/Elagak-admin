import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';



import '../../shared/widgets/cashed_network_image.dart';

class ImageSlideShow extends StatelessWidget {
  const ImageSlideShow({Key? key, required this.image}) : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    return Directionality(
            textDirection: TextDirection.rtl,
            child: SafeArea(
              child: Scaffold(
                body: ImageSlideshow(
                  width: double.infinity,
                  height: double.infinity,
                  initialPage: 0,
                  indicatorBackgroundColor: Colors.grey,
                  onPageChanged: (value) {},
                  isLoop: false,
                  children: [
                    defaultNetworkImg(context, double.infinity, double.infinity, image, BoxFit.cover, 5)
                  ],
                ),
              ),
            ),
    );
  }
}


Widget getImageWidget(String image) {
  return Center(
    child: InteractiveViewer(
      minScale: 0.1,
      maxScale: 2.0,
      child: Container(
        margin: const EdgeInsets.only(left: 1.0, right: 1.0),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          image: DecorationImage(
            image: NetworkImage(image),
            fit: BoxFit.fill,
          ),
        ),
      ),
    ),
  );
}