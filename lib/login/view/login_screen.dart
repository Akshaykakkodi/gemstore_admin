import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gemstore_admin/core/app_constants.dart';
import 'package:gemstore_admin/login/controller/login_controller.dart';
import 'package:gemstore_admin/login/model/admin_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<LoginController>(
        builder: (context, controller, child) => 
         SafeArea(
          child: controller.isLoading?const Center(child: CircularProgressIndicator(),) :  Container(
            width: double.infinity,
            height: double.infinity,
            padding:const EdgeInsets.only(right: 32,left: 32,top: 58),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
               
                children: [
                  
                  Text("Login \nto admin panel",style: GoogleFonts.ptSans(fontSize: 24),),
                  const SizedBox(height: 19,),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffD6D6D6))
                      ),
                      enabledBorder:const  UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffD6D6D6))
                      ),
                      hintText: "Email address",
                      hintStyle: AppConstants.hintStyles
                    ),
                  ),
            
                  const SizedBox(height: 20,),
            
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffD6D6D6))
                      ),
                      enabledBorder:const  UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffD6D6D6))
                      ),
                      hintText: "Password",
                      hintStyle: AppConstants.hintStyles
                    ),
                  ),
            
                   const SizedBox(height: 20,),
            
                 
                  CupertinoButton(
                    onPressed: () {
                      Provider.of<LoginController>(context,listen: false).authenticateAdmin(AdminModel(email: emailController.text, password: passwordController.text),context);
                    },
                    padding: EdgeInsets.zero,
                    child: Center(
                      child: Container(
                        height: 51,
                        width: 147,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(26.5),
                          color:const Color(0xff2D201C)
                        ),
                        child:  Center(child: Text("Login",style: GoogleFonts.ptSans(fontSize: 16,fontWeight: FontWeight.w700,color: Colors.white),)),
                      ),
                    ),
                  ),
                  
                
            
                  
              
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}