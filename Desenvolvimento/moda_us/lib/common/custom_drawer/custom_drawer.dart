import 'package:flutter/material.dart';
import 'package:moda_us/common/custom_drawer/drawer_tile.dart';
import 'package:moda_us/common/custom_drawer_header.dart';
import 'package:moda_us/models/user_manager.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Stack(
      children: <Widget>[
        Container(
          
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 255, 255, 255),
              Color(0xffcfcfcf),
              // color: #cfcfcf
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
        ),
        ListView(
          children: <Widget>[
            CustomDrawerHeader(),
            const Divider(),
            const DrawerTile(
              iconData: Icons.home,
              title: 'Inicio',
              page: 0,
            ),
            const DrawerTile(
              iconData: Icons.list,
              title: 'Produtos',
              page: 1,
            ),
            const DrawerTile(
              iconData: Icons.playlist_add_check,
              title: 'Meus Pedidos',
              page: 2,
            ),
            const DrawerTile(
              iconData: Icons.location_on,
              title: 'Lojas',
              page: 3,
            ),
            Consumer<UserManager>(
              builder: (_, userManager, __){
                if(userManager.adminEnabled){
                  return Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: <Widget>[
                    const Divider(),
                    const DrawerTile(
                      iconData: Icons.settings,
                      title: 'Usuários',
                      page: 4,
                    ),
                    const DrawerTile(
                      iconData: Icons.settings,
                      title: 'Pedidos',
                      page: 5,
                    ),
                    ],
                  );
                } else {
                  return Container();
                }
              }
            )
          ],
        ),
      ],
    ));
  }
}
