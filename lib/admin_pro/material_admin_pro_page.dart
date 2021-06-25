import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutterexamples/admin_pro/admin_pro_constants/admin_pro_constans.dart';
import 'package:flutterexamples/admin_pro/widgets/admin_pro_app_bar.dart';
import 'package:flutterexamples/admin_pro/widgets/admin_pro_body.dart';

//https://startbootstrap.com/previews/material-admin-pro

class AdminProPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //
    var theme = Theme.of(context).copyWith(
        backgroundColor: colorBlack,
        textTheme: Theme.of(context).textTheme.copyWith(
            //For title
            bodyText1: TextStyle(color: colorWhite, fontSize: 16, fontWeight: FontWeight.w600),
            //For sub title
            bodyText2: TextStyle(color: colorWhite)));

    return Theme(
      data: theme,
      child: Scaffold(
        appBar: AdminProAppBar(),
        body: AdminProBody(),
      ),
    );
  }
}
