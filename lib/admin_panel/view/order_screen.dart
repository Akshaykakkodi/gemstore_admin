import 'package:flutter/material.dart';
import 'package:gemstore_admin/admin_panel/model/order_model.dart';
import 'package:gemstore_admin/admin_panel/view/order_list_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            Center(
              child: TabBar(
                  isScrollable: true,
                  labelPadding: const EdgeInsets.symmetric(horizontal: 25),
                  indicatorColor: Colors.black.withOpacity(0.5),
                  tabs: [
                    Text(
                      "Pending",
                      style: GoogleFonts.ptSans(
                          fontSize: 15, color: Colors.black.withOpacity(0.5)),
                    ),
                    Text(
                      "Delivered",
                      style: GoogleFonts.ptSans(
                          fontSize: 15, color: Colors.black.withOpacity(0.5)),
                    ),
                    Text(
                      "Cancelled",
                      style: GoogleFonts.ptSans(
                          fontSize: 15, color: Colors.black.withOpacity(0.5)),
                    ),
                  ]),
            ),
            Expanded(
              child: SizedBox(
                child: TabBarView(children: [
                  OrderListScreen(
                    order: OrderModel(
                        orderId: "1523",
                        trackingNumber: "IK287368838",
                        orderDate: "13/05/2022",
                        quantity: "2",
                        status: "PENDING",
                        subTotal: "110"),
                  ),
                  OrderListScreen(
                    order: OrderModel(
                        orderId: "1523",
                        trackingNumber: "IK287368838",
                        orderDate: "13/05/2022",
                        quantity: "2",
                        status: "DELIVERED",
                        subTotal: "110"),
                  ),
                  OrderListScreen(
                    order: OrderModel(
                        orderId: "1523",
                        trackingNumber: "IK287368838",
                        orderDate: "13/05/2022",
                        quantity: "2",
                        status: "CANCELLED",
                        subTotal: "110"),
                  )
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
