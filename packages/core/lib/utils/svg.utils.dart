import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'extensions/color_hex.extension.dart';

Future<String> customizeSVG({required String path, Color? fromColor, Color? toColor}) async {
  final svgFile = await rootBundle.loadString(path);
  String rawSvg = svgFile.toString();
  if (fromColor != null && toColor != null) {
     rawSvg = svgFile.toString().replaceAll(fromColor.toHex(), toColor.toHex());
  }
  return rawSvg;
}
