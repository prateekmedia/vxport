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

Hi, I'm **Prateek Sunal**. I'm a *Flutter Developer* and **Open Source enthusiast** based in Haldwani, India.
- Working in Flutter since 2020. I have worked on 20+ commercial Flutter apps.
- Participated in **Google Summer of Code '23 & '24** for CCExtractor Organization.
- Also worked with Rust, React JS, Python, Django
- I use arch btw, but using all kinds of OS'es for work.

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

If you have a project in mind that you want to discuss with me, then you can click on sidebar links to contact me.

PS: You can also click on the settings icon to change the theme, wallpaper and other things of this website.
""";

const allProjects = """
# Live Projects

This is the collection of some of the projects that I have worked on.

If you want to hire me for your next project, you can contact me from the links in the sidebar.

Overall I have worked on 20+ Commercial Flutter apps but here are some notable ones.

// Copilot generate me a nice table, pls
| Project Name | Description | Store Link |
| ------------ | ----------- | ---- |
| Datsme | Merge Social with Psychology | [Android](https://play.google.com/store/apps/details?id=me.dats.com.datsme&hl=en_IN&gl=US&pli=1) & [iOS](https://apps.apple.com/in/app/datsme-social-wellness-app/id1673755666) |
| Dayhee | Help Parenting Child with Consulation | [Android](https://play.google.com/store/apps/details?id=com.dayhee.id) & [iOS](https://apps.apple.com/in/app/dayhee/id6471941584) |
| FlashSend | Send payment in a flash | [Android](https://play.google.com/store/apps/details?id=net.flashsd.flashsend&hl=en&gl=US) & [iOS](https://apps.apple.com/us/app/flashsend/id6446861546) |
| Ava | Women's Fitness and Yoga | [Android](https://play.google.com/store/apps/details?id=com.avafitness.app&hl=en&gl=US) |
| Select Tube | Reduce Time Waster, Watch selected channels | [Android](https://play.google.com/store/apps/details?id=com.selectTube) & [iOS](https://apps.apple.com/in/app/select-tube-reduce-time-waste/id1624409170) |
| Nemnem | Story App for children's | [Android](https://play.google.com/store/apps/details?id=com.nemnem.lite) |
| Persona App | Make your Persona easily | [Android](https://play.google.com/store/apps/details?id=com.persona_app) |
| BSG | Be Somethind Great, Stories that inspire | [Android](https://play.google.com/store/apps/details?id=ca.besomethinggreat.app) |
| Magzee | Create & Manage E-Sports tournaments | [Android](https://play.google.com/store/apps/details?id=live.magzee.app) |
| Arenda | Rent Home easily | - |
| JE Connect | Slack Alternative with Supabase | Internal App |
| Paint App | Draw, Erase, Snapshot, Share | [Android](https://play.google.com/store/apps/details?id=com.SimpleDrawPaint) |
| Text Generator | Generate fancy Text | [Android](https://play.google.com/store/apps/details?id=com.text_gen_app) |

To view the source code of these proprietary apps, [Click here](https://www.youtube.com/watch?v=dQw4w9WgXcQ)
""";
