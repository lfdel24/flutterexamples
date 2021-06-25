import 'package:flutter/material.dart';
import 'package:flutterexamples/admin_pro/admin_pro_constants/admin_pro_constans.dart';

class AdminProAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: defaultSize),
        color: colorBlack,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.menu,
              color: colorWhite,
              size: defaultSizeIcon,
            ),
            SizedBox(width: defaultSize),
            Text('ADMIN PRO', style: Theme.of(context).textTheme.bodyText1),
            Expanded(child: Container()),
            Text('Overview', style: Theme.of(context).textTheme.bodyText2),
            SizedBox(width: defaultSize),
            Text('Documentation', style: Theme.of(context).textTheme.bodyText2),
            SizedBox(width: defaultSize),
            Icon(
              Icons.mail,
              color: colorWhite,
              size: defaultSizeIcon,
            ),
            SizedBox(width: defaultSize),
            Icon(
              Icons.notifications,
              color: colorWhite,
              size: defaultSizeIcon,
            ),
            SizedBox(width: defaultSize),
            Icon(
              Icons.person,
              color: colorWhite,
              size: defaultSizeIcon,
            )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(75);
}
