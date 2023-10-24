import 'package:flutter/material.dart';
import 'package:blur/blur.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vxport/src/features/main/application/bg_state_provider.dart';

class BackgroundImage extends ConsumerWidget {
  const BackgroundImage({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    final bgState = ref.watch(bgStateProvider);

    return SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Image.network(
          "$bgState&w=1260&h=750",
          fit: BoxFit.fill,
        )).blurred(
      blur: 8,
      colorOpacity: 0.4,
      blurColor: Colors.black,
    );
  }
}
