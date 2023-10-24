import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vxport/src/common_widgets/background_image.dart';
import 'package:vxport/src/features/main/application/flash_provider.dart';
import 'package:vxport/src/features/main/presentation/main_window_area.dart';
import 'package:google_fonts/google_fonts.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        textTheme: GoogleFonts.latoTextTheme(ThemeData().textTheme),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        textTheme: GoogleFonts.latoTextTheme(ThemeData.dark().textTheme),
      ),
      themeMode: ThemeMode.dark,
      home: const AppFrame(),
    );
  }
}

class AppFrame extends ConsumerWidget {
  const AppFrame({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    final flash = ref.watch(flashProvider);

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          const SizedBox(
            width: double.infinity,
            child: BackgroundImage(),
          ),
          // BlurBackdrop(),
          const Positioned.fill(child: MainWindowArea()),
          IgnorePointer(
            ignoring: !flash,
            child: AnimatedContainer(
              color: flash ? const Color(0xFFFFFFFF) : const Color(0x00000000),
              duration: const Duration(milliseconds: 300),
            ),
          ),
        ],
      ),
    );
  }
}
