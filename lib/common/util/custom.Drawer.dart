import 'package:flutter/material.dart';
import 'package:loja_virtual/common/util/custom_drawer_header.dart';
import 'package:loja_virtual/common/util/drawer_tile.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              const Color.fromARGB(255, 203, 236, 254),
              Colors.white
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          ),
          ListView(
            children: <Widget>[
              CustomDrawerHeader(),
              const Divider(),
              DrawerTile(
                iconData: Icons.home,
                title: "Inicio",
                page: 0,
              ),
              DrawerTile(
                iconData: Icons.list,
                title: "Produtos",
                page: 1,
              ),
              DrawerTile(
                iconData: Icons.playlist_add_check,
                title: "Meus Pedidos",
                page: 2,
              ),
              DrawerTile(
                iconData: Icons.location_on,
                title: "Lojas",
                page: 3,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
