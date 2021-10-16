import 'dart:math';
import 'dart:ui';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ticket_box/src/common/constants.dart';

class Utils {
  static Image resolveImg(String? url, {double? width, BoxFit? fit}) {
    if (url == null) {
      return Image.asset(Constants.imageErr);
    }
    return Image(
      fit: fit,
      width: width,
      image: NetworkImage(url),
      errorBuilder: (context, error, stackTrace) =>
          Image.asset(Constants.imageErr),
    );
  }

  static ImageProvider<Object> resolveFileImg(String? url, String? altUrl) {
    if ((url == null || url.isEmpty) && (altUrl == null || altUrl.isEmpty)) {
      throw Exception("Required file image or alternative image");
    }
    if (url != null && url.isNotEmpty) {
      return FileImage(File(url));
    }
    return AssetImage(altUrl!);
  }

  static ImageProvider<Object> resolveNetworkImg(String? url, String? altUrl) {
    if ((url == null || url.isEmpty) && (altUrl == null || altUrl.isEmpty)) {
      throw Exception("Required image or alternative image");
    }
    if (url != null && url.isNotEmpty) {
      return NetworkImage(url);
    }
    return AssetImage(altUrl!);
  }

  static DecorationImage resolveDecoImg(String? url,
      {BoxFit? fit = BoxFit.cover}) {
    if (url == null) {
      return DecorationImage(image: AssetImage(Constants.imageErr));
    }
    return DecorationImage(
      onError: (exception, stackTrace) => Image.asset(Constants.imageErr),
      image: NetworkImage(url),
      fit: fit,
    );
  }


}
