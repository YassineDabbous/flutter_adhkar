import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {
  final String url;
  ImageView(this.url);
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      /*progressIndicatorBuilder: (context, url, downloadProgress) => Container(
        color: Colors.red,
        child: Center(
          child: SizedBox(
              width: downloadProgress.progress,
              height: downloadProgress.progress,
              child: SpinKitFadingCircle(
                color: Colors.green,
              )),
        ),
      ),*/
      errorWidget: (context, url, error) => Icon(
        Icons.error,
        size: 80,
      ),
    );
  }
}
