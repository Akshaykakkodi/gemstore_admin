import 'package:flutter/material.dart';
import 'package:gemstore_admin/admin_panel/controller/admin_controller.dart';
import 'package:gemstore_admin/admin_panel/view/category_screen.dart';
import 'package:gemstore_admin/admin_panel/view/dashboard_screen.dart';
import 'package:gemstore_admin/admin_panel/view/order_screen.dart';
import 'package:gemstore_admin/admin_panel/view/search_screen.dart';
import 'package:gemstore_admin/core/app_constants.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    List pages=const [DashboardScreen(),SearchScreen(),CategoryScreen(),OrderScreen()];
    return  Consumer<AdminController>(
      builder: (context, controller, child) => 
       Scaffold(
        appBar: AppBar(
          title: Text("Gemstore Admin",style: AppConstants.headerStyle,),
          centerTitle: true,
        ),
        body: pages.elementAt(controller.selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black,
          currentIndex: controller.selectedIndex,
          onTap: (value) {
            controller.toggleBottomNavigatoinIndex(value);
          },
          items:const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Dashboard"
              ),
              BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Search"
              ),
              BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: "Category"
              ),
              BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined),
              label: "Orders"
              ),
    
          ]
          ),
      ),
    );
  }
}