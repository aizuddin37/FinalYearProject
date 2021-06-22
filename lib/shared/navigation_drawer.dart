






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
              onClicked:() =>Get.toNamed('weather'),
            ),
            const SizedBox(height:18),
            buildMenuItem(
              text:'Weather prediction',
              icon: CupertinoIcons.sun_max_fill,
              onClicked:() => Get.toNamed('chart'),

            ),
            const SizedBox(height:18),
            buildMenuItem(
              text:'logout',
              icon: CupertinoIcons.xmark_octagon_fill,

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