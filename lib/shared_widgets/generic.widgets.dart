import 'package:flutter/material.dart';
import 'package:roqqu_test/styles/roqqu.theme.dart';

PreferredSizeWidget basicAppBar({Widget? title}) {
  return AppBar(
    elevation: 0,
    centerTitle: true,
    title: title,
  );
}

Divider thickDivider(context) {
  return Divider(
    height: 5,
    color: RoqquTheme.of(context).lineColor,
    thickness: 5,
  );
}
