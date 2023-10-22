import 'package:flutter/material.dart';
import 'package:vxport/src/common_widgets/background_image.dart';
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

class AppFrame extends StatelessWidget {
  const AppFrame({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SizedBox(
            width: double.infinity,
            child: BackgroundImage(),
          ),
          // BlurBackdrop(),
          Positioned.fill(child: MainWindowArea())
        ],
      ),
    );
  }
}
