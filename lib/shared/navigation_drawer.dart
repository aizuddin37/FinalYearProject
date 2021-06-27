import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationDrawer extends StatelessWidget{
  final padding = EdgeInsets.symmetric(horizontal:20);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.amber,
        child: ListView(
          children: <Widget>[
            const SizedBox(height:48),
            buildMenuItem(
              text:'Home',
              icon: Icons.home,
              onClicked:() =>Get.toNamed('weather2'),
            ),
            const SizedBox(height:18),
            buildMenuItem(
              text:'Weather prediction',
              icon: CupertinoIcons.sun_max_fill,
              onClicked:() => Get.toNamed('list'),

            ),
            const SizedBox(height:18),
            buildMenuItem(
              text:'Weather History',
              icon: CupertinoIcons.cloud_sun_fill,
              onClicked:() => Get.toNamed('overall'),

            ),
            const SizedBox(height:18),
            buildMenuItem(
              text:'logout',
              icon: CupertinoIcons.xmark_octagon_fill,
              onClicked:() => Get.toNamed(exit(0),),
            ),
            const SizedBox(height:26),
            Divider(color:Colors.white70),
            const SizedBox(height:26),

          ],
        ),
      ),
    );
  }
}

Widget buildMenuItem({
   String text,
   IconData icon,
  VoidCallback onClicked,
}){
  final color =Colors.white;
  final hoverColor = Colors.white70;

  return ListTile(
    leading: Icon(icon,color:color),
    title: Text(text,style:TextStyle(color:color)),
    hoverColor: hoverColor,
    onTap: onClicked,
  );

}