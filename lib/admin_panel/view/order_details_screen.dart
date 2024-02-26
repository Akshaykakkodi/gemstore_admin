import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Order#1523",
          style: GoogleFonts.ptSans(
              fontSize: 18, color: Colors.black, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset(
                "assets/images/backButton.png",
                scale: 4,
              )),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ListView(
          children: [
            const SizedBox(height: 15,),
            Container(
              height: 92,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xff575757)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Order is delivered",
                    style: GoogleFonts.ptSans(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  ),
                  Image.asset(
                    "assets/images/orderDelivered.png",
                    scale: 4,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 26,
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 7,
                right: 11,
                top: 16,
                bottom: 12,
              ),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: const Color(0xff0F0F0F).withOpacity(0.2),
                        offset: const Offset(0, 4),
                        blurRadius: 8)
                  ]),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Order number",
                        style: GoogleFonts.ptSans(
                            fontSize: 12,
                            color: const Color(0xff121420).withOpacity(0.5)),
                      ),
                      Text(
                        "#1523",
                        style: GoogleFonts.ptSans(
                            fontSize: 12,
                            color: const Color(0xff23262F),
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Tracking number",
                        style: GoogleFonts.ptSans(
                            fontSize: 12,
                            color: const Color(0xff121420).withOpacity(0.5)),
                      ),
                      Text(
                        "IK987362341",
                        style: GoogleFonts.ptSans(
                            fontSize: 12,
                            color: const Color(0xff23262F),
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Delivery address",
                        style: GoogleFonts.ptSans(
                            fontSize: 12,
                            color: const Color(0xff121420).withOpacity(0.5)),
                      ),
                      Text(
                        "SBI Building, Software Park",
                        style: GoogleFonts.ptSans(
                            fontSize: 12,
                            color: const Color(0xff23262F),
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 26,
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 7,
                right: 11,
                top: 16,
                bottom: 12,
              ),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: const Color(0xff0F0F0F).withOpacity(0.2),
                        offset: const Offset(0, 4),
                        blurRadius: 8)
                  ]),
              child: Column(
                children: [
                 Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Maxi dress",
                        style: GoogleFonts.ptSans(
                            fontSize: 14, color: const Color(0xff000000)),
                      ),
                    const  Spacer(),
                      Text(
                        "X1",
                        style: GoogleFonts.ptSans(
                            fontSize: 14, color: const Color(0xff000000)),
                      ),
                    const  Spacer(),
                      Expanded(
                          child: Text(textAlign: TextAlign.end,
                        "\$60",
                        style: GoogleFonts.ptSans(
                            fontSize: 14,
                            color: const Color(0xff000000),
                            fontWeight: FontWeight.w600),
                      )),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Linen dress",
                        style: GoogleFonts.ptSans(
                            fontSize: 14, color: const Color(0xff000000)),
                      ),
                    const  Spacer(),
                      Text(
                        "X1",
                        style: GoogleFonts.ptSans(
                            fontSize: 14, color: const Color(0xff000000)),
                      ),
                    const  Spacer(),
                      Expanded(
                          child: Text(textAlign: TextAlign.end,
                        "\$120",
                        style: GoogleFonts.ptSans(
                            fontSize: 14,
                            color: const Color(0xff000000),
                            fontWeight: FontWeight.w600),
                      )),
                    ],
                  ),
                  const SizedBox(
                    height: 37,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Sub total",
                        style: GoogleFonts.ptSans(
                            fontSize: 14, color: const Color(0xff000000)),
                      ),
                      Text(
                        "\$180",
                        style: GoogleFonts.ptSans(
                            fontSize: 16,
                            color: const Color(0xff000000),
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Shipping",
                        style: GoogleFonts.ptSans(
                            fontSize: 14, color: const Color(0xff000000)),
                      ),
                      Text(
                        "\$0",
                        style: GoogleFonts.ptSans(
                            fontSize: 16,
                            color: const Color(0xff000000),
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                const  Divider(),
                  const SizedBox(
                    height: 13,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                        style: GoogleFonts.ptSans(
                            fontSize: 14, color: const Color(0xff000000)),
                      ),
                      Text(
                        "\$180",
                        style: GoogleFonts.ptSans(
                            fontSize: 16,
                            color: const Color(0xff000000),
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 44,
                  width: 168,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color:const Color(0xff777E90))
                  ),
                  child: Center(
                    child: Text(
                              "Return to home",
                              style: GoogleFonts.ptSans(
                                  fontSize: 16,
                                  color: const Color(0xff777E90),
                                  ),
                            ),
                  ) ,
                ),

                Container(
                  height: 44,
                  width: 119,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    
                    color:const Color(0xff343434)
                  ),
                  child: Center(
                    child: Text(
                              "Rate",
                              style: GoogleFonts.ptSans(
                                  fontSize: 16,
                                  color:  Colors.white,
                                  ),
                            ),
                  ) ,
                ),
               
              ],
            ),
             const SizedBox(height: 35,)
          ],
        ),
      ),
    );
  }
}
