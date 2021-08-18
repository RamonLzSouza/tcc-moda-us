import 'package:flutter/material.dart';
import 'package:moda_us/common/custom_drawer/custom_drawer.dart';
import 'package:moda_us/models/home_manager.dart';
import 'package:moda_us/screens/home/components/section_list.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [                  
                  Color.fromARGB(255, 0, 0, 0),
                  Color.fromARGB(255, 0, 0, 0)
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter
              )
            ),
          ),
          CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                snap: true,
                floating: true,
                elevation: 0,
                backgroundColor: Colors.transparent,
                flexibleSpace: const FlexibleSpaceBar(
                  title: Text('Moda \'Us'),
                  centerTitle: true,
                ),
                actions: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.shopping_cart),
                    color: Colors.white,
                    onPressed: () => Navigator.of(context).pushNamed('/cart'),
                  ),
                ],
              ),
              Consumer<HomeManager>(
                builder: (_, homeManager, __){
                  final List<Widget> children = homeManager.sections.map<Widget>(
                    (section){
                      switch(section.type){
                        case 'List':
                          return SectionList(section);
                        case 'Staggered':
                          return Container();
                        default:
                          return Container();
                      }
                    }
                  ).toList();


                  return SliverList(
                    delegate: SliverChildListDelegate(children),
                  );
                },
              )    
            ],
          ),
        ],
      ),
    );
  }
}