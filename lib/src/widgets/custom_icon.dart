import 'package:flutter/material.dart';
import 'package:ticket_box/src/common/themes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget createCustomIcon(icon) {
  return Container(
      decoration: BoxDecoration(
          color: accent_green,
          borderRadius: BorderRadius.all(Radius.circular(7))),
      padding: EdgeInsets.all(7),
      child: Icon(
        icon,
        size: 25,
        color: Colors.white,
      ));
}
