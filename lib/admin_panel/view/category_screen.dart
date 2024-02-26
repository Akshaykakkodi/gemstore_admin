import 'package:flutter/material.dart';
import 'package:gemstore_admin/admin_panel/controller/admin_controller.dart';
import 'package:gemstore_admin/admin_panel/view/category_product_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 4,
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Center(
              child: TabBar(
                  isScrollable: true,
                  indicatorColor: Colors.black.withOpacity(0.5),
                  tabs: [
                    Text(
                      "women",
                      style: GoogleFonts.ptSans(
                          fontSize: 15, color: Colors.black.withOpacity(0.5)),
                    ),
                    Text(
                      "Men",
                      style: GoogleFonts.ptSans(
                          fontSize: 15, color: Colors.black.withOpacity(0.5)),
                    ),
                    Text(
                      "Accessories",
                      style: GoogleFonts.ptSans(
                          fontSize: 15, color: Colors.black.withOpacity(0.5)),
                    ),
                    Text(
                      "Beauty",
                      style: GoogleFonts.ptSans(
                          fontSize: 15, color: Colors.black.withOpacity(0.5)),
                    )
                  ]),
            ),
            const SizedBox(
              height: 15,
            ),
             Expanded(
                child: SizedBox(
              child: TabBarView(children: [
                CategoryProductScreen(
                    products:Provider.of<AdminController>(context).womensProducts),
                CategoryProductScreen(
                    products:Provider.of<AdminController>(context).mensProducts),
                 CategoryProductScreen(
                    products:Provider.of<AdminController>(context).accessories),
                CategoryProductScreen(
                    products:Provider.of<AdminController>(context).beautyProducts),
              ]),
            )
            )
          ],
        ),
      ),
    );
  }
}
