import 'package:flutter/material.dart';
import 'package:blur/blur.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Image.network(
          "https://images.pexels.com/photos/7640904/pexels-photo-7640904.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
          fit: BoxFit.fill,
        )).blurred(
      blur: 8,
      colorOpacity: 0.15,
      blurColor: Colors.black,
    );
  }
}
