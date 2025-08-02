import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:wahsmart/utils/dimensions.dart';
import 'package:wahsmart/views/widget/custom_button.dart';

import '../routes/route.dart';
import '../utils/images.dart';


class Choose extends StatefulWidget {
  const Choose({super.key});

  @override
  State<Choose> createState() => _ChooseState();
}

class _ChooseState extends State<Choose> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
        child: Column(
          children: [
            SizedBox(height: Dimensions.paddingSizeExtremeLarge+7,),
            Center(
              child: Container(
                child: Image.asset(Images.choose,

                ),
              ),
            ),
            SizedBox(height: Get.height/50,),

            Text("Welcome to Wah!",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),)
            ,SizedBox(height: Get.height/50,),
            Text("Unlock volume discounts with your  \ncommunity Wah App.",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18,color: Color(0xff777777)))
            ,SizedBox(height: Dimensions.paddingSizeLarge+15,),
            CustomButton(
              buttonText: "I’m a Customer",
color: Get.theme.secondaryHeaderColor,
              textColor: Colors.black,fontSize: 18,
              onPressed: ()async{
                Get.toNamed(RouteHelper
                    .getSignInRoute());
              },

            )
            ,SizedBox(height: Dimensions.paddingSizeLarge,),
          CustomButton(
              buttonText: "I’m a Vendor",
color: Get.theme.primaryColor,
              textColor: Colors.black,fontSize: 18,
              onPressed: ()async{

                Get.toNamed(RouteHelper
                    .getSignInRoute());

              },

            )

          ],
        ),
      ),
    );
  }
}
