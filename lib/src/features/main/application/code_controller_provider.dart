import 'package:flutter_code_editor/flutter_code_editor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:highlight/languages/markdown.dart';

final codeControllerProvider = Provider<CodeController>(
  (_) => CodeController(
    // Initial code
    text: code,
    language: markdown,
  ),
);

const code = """
# Introduction

Hello there! I'm Prateek Sunal, a student and open-source enthusiast based in Uttarakhand, India. I have a passion for coding and love to give back to the community. I am comfortable with various programming languages including Dart, Python, QML, and C++.

## About Me

I have a strong presence on GitHub where I contribute to numerous projects. Some of my popular open-source projects include:

- [AppimagePool](https://github.com/prateekmedia/appimagepool)
- [PsTube](https://github.com/prateekmedia/pstube)
- [NetSpeedSimplified](https://github.com/prateekmedia/netspeedsimplified)
- [Libadwaita for Flutter](https://github.com/gtk-flutter/libadwaita)
- [Flutter Speed Dial](https://github.com/darioielardi/flutter_speed_dial)

These projects reflect my skills and dedication to the open-source community. I have made over **1,369** contributions in the last year.

## Connect with Me

For more details about my social links and projects, you can click on the Links / Git Projects tab on the left sidebar.

## Sponsorship

Your sponsorship will encourage me to dedicate more time to open-source projects. Your issues would be prioritized. If you have benefited from one of my projects and would like to show your support, you can sponsor me on [GitHub](https://github.com/sponsors/prateekmedia).

You can find the links from the Links tab in the Sidebar.

## Get in Touch

I am available for freelance work. Check the links from the Sidebar Links tab for more details.

PS: You can also click on the settings icon to change the theme, wallpaper and other things of this website.
""";
