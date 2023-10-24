import 'package:flutter/material.dart';
import 'package:flutter_highlight/themes/atom-one-dark.dart';
import 'package:flutter_highlight/themes/dracula.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';
import 'package:flutter_highlight/themes/solarized-dark.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final codeStyleTypeProvider = StateProvider<String>((ref) => "monokai");
final codeStyleProvider = StateProvider<Map<String, TextStyle>>(
    (ref) => styles[ref.watch(codeStyleTypeProvider)]!);

const styles = <String, Map<String, TextStyle>>{
  "monokai": monokaiSublimeTheme,
  "dracula": draculaTheme,
  "solarized": solarizedDarkTheme,
  "one dark": atomOneDarkTheme,
};
