import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderTitle extends StatelessWidget {
  String title;
  BuildContext context;
  HeaderTitle({this.title, this.context});

  @override
  Widget build(BuildContext context2) {
    ScreenUtil.instance = ScreenUtil(
      width: 400,
      height: 810,
      allowFontScaling: true,
    )..init(context);

    return Text(
      title,
      style: TextStyle(
          fontSize: ScreenUtil.instance.setSp(17),
          fontWeight: FontWeight.bold,
          color: Theme.of(context).accentColor),
    );
  }
}
