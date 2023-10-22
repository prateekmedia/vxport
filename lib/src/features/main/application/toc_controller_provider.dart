import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:markdown_widget/markdown_widget.dart';

final tocControllerProvider = Provider<TocController>(
  (_) => TocController(),
);
