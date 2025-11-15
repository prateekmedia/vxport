import 'package:flutter_riverpod/flutter_riverpod.dart';

final projectsProvider = Provider((ref) => _projects);

final _projects = {
  "appimage pool": (
    [
      "The Universal App Store for Linux",
      "No dependency hell, easy one click portable app",
      "Integrate apps direcltly to your system, hassle-free",
    ],
    "https://github.com/prateekmedia/appimagepool"
  ),
  "pstube": (
    [
      "PsTube is a free and open-source YouTube client",
      " It offers a beautiful user interface and allows users to watch and download videos without ads",
      "The application supports playlists, keeps track of your liked videos and comments, and does not require login.",
    ],
    "https://github.com/prateekmedia/pstube",
  ),
  "netspeedsimplified": (
    [
      "NetSpeedSimplified is a Net Speed extension for GNOME shell with a plethora of customization options",
      "It features a clean user interface, an adjustable refresh rate, and vertical alignment support",
      "The extension also offers advanced position options to pinpoint where to place the indicator on the Panel",
    ],
    "https://github.com/prateekmedia/netspeedsimplified",
  ),
  "libadwaita flutter": (
    [
      "Libadwaita is a Flutter library that provides Libadwaita's widgets",
      "It follows the Gnome Human Interface Guidelines (HIG) and is available on all platforms",
      "The library offers various Libadwaita widgets ported to Flutter, some new widgets, and is compatible with various packages",
    ],
    "https://github.com/gtk-flutter/libadwaita"
  ),
};
