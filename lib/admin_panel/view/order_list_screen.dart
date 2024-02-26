import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gemstore_admin/admin_panel/model/order_model.dart';
import 'package:gemstore_admin/admin_panel/view/order_details_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderListScreen extends StatelessWidget {
  final OrderModel order;
  const OrderListScreen({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: ListView.builder(
          itemCount: 10,
          itemBuilder:   (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top:20.0),
            child: Container(

              padding:const EdgeInsets.only(top: 18,left: 25,bottom: 22,right: 12),
              height: 182,
              width: double.infinity,
              
              decoration: BoxDecoration(
                boxShadow:[
                  BoxShadow(color:const Color(0xff0F0F0F).withOpacity(.2),
                  offset:const Offset(0, 8),
                  blurStyle: BlurStyle.normal,
                  blurRadius: 10

                  )
                ] ,
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                
                border: Border.all(color:const Color(0xffF9F9F9),width: 1)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [ 
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Text("Order#${order.orderId}",style: GoogleFonts.ptSans(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w700),),
                      Text(order.orderDate,style: GoogleFonts.ptSans(fontSize: 14,color:const Color(0xff777E90),fontWeight: FontWeight.w500),),
                  ],
                ),
                Row(
                  
                  children: [
                     Text("Tracking number: ",style: GoogleFonts.ptSans(fontSize: 14,color:const Color(0xff777E90),fontWeight: FontWeight.w500),),
                      Text(order.trackingNumber,style: GoogleFonts.ptSans(fontSize: 14,color:const Color(0xff000000),fontWeight: FontWeight.w500),),
                  ],
                ),
                 Row(
                  
                  children: [
                     Text("Quantity: ",style: GoogleFonts.ptSans(fontSize: 14,color:const Color(0xff777E90),fontWeight: FontWeight.w500),),
                      Text(order.quantity,style: GoogleFonts.ptSans(fontSize: 14,color:const Color(0xff000000),fontWeight: FontWeight.w500),),
                     const Spacer(),
                       Text("Subtotal: ",style: GoogleFonts.ptSans(fontSize: 14,color:const Color(0xff777E90),fontWeight: FontWeight.w500),),
                      Text("\$${order.subTotal}",style: GoogleFonts.ptSans(fontSize: 14,color:const Color(0xff000000),fontWeight: FontWeight.w500),),
                  ],
                ),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Text(order.status,style: GoogleFonts.ptSans(fontSize: 14,color:order.status=="PENDING"?const Color(0xffCF6212):order.status=="DELIVERED"?const Color(0xff009254):const Color(0xffC50000),fontWeight: FontWeight.w500),),
                      CupertinoButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>const OrderDetailsScreen(),));
                        },
                        padding: EdgeInsets.zero,
                        child: Container(
                          height: 35,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(17.5),
                            border: Border.all(color: Colors.black)
                          ),
                          child: Center(child: Text("Details",style: GoogleFonts.ptSans(fontSize: 14,color:const Color(0xff000000),fontWeight: FontWeight.w500),)),
                        ),
                      )
                  ],
                )
              ]),
            ),
          );
        },),
      ),
    );
  }
}