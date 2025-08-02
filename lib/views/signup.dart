import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wahsmart/utils/dimensions.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wahsmart/viewmodels/auth_controller.dart';
import 'package:wahsmart/views/verify_signup.dart';
import 'package:wahsmart/views/widget/custom_button.dart';
import 'package:wahsmart/views/widget/custom_text_field.dart';

import '../data/models/body/signup_body_model.dart';
import '../helper/responsive_helper.dart';
import '../routes/route.dart';
import '../utils/dimensions.dart';
import '../utils/images.dart';
import 'choose.dart';


class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  String? _countryDialCode;
  final TextEditingController phone=TextEditingController();
  final TextEditingController email=TextEditingController();
  final TextEditingController first=TextEditingController();
  final TextEditingController last=TextEditingController();
  final TextEditingController address=TextEditingController();
  final TextEditingController state=TextEditingController();
  final TextEditingController country=TextEditingController();
  final TextEditingController city=TextEditingController();
  final TextEditingController zipcode=TextEditingController();
  final TextEditingController neighborad=TextEditingController();
  final TextEditingController house=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(Dimensions.paddingSizeLarge),
        child: Column(
          children: [
            Center(
              child: Container(
                child: Image.asset(Images.logo2,scale:23,
                ),
              ),
            ),
            SizedBox(
              height: Get.height/50,
            ),
            Text("Customer Profile",
              style: TextStyle(fontSize: Dimensions.fontSizeOverLarge,fontWeight:FontWeight.bold ),),
            const SizedBox(
                height: Dimensions.paddingSizeExtraLarge),

            CustomTextField(
              titleText:  'Enter First Name',
              controller: first,
              inputType: TextInputType.name,
              hintText:'Enter First Name' ,
              isPhone: false,
            ),
            const SizedBox(
                height: Dimensions.paddingSizeExtraLarge),
            CustomTextField(
              titleText:  'Enter Last Name',
              controller: last,
              inputType: TextInputType.name,
              hintText:'Enter Last Name' ,
              isPhone: false,
            ),
            const SizedBox(
                height: Dimensions.paddingSizeExtraLarge),


            CustomTextField(
              titleText:  'Enter phone number',
              controller: phone,
              inputType: TextInputType.phone,
              hintText:'Enter phone number' ,
              isPhone: true,

              showTitle:
              ResponsiveHelper.isDesktop(context),
              onCountryChanged: (CountryCode countryCode) {
                _countryDialCode = countryCode.dialCode;
              },
              countryDialCode:_countryDialCode!=null? _countryDialCode: "+91",
            ),
            const SizedBox(
                height: Dimensions.paddingSizeExtraLarge),
            CustomTextField(
              titleText:  'Enter Email address',
              controller: email,
              inputType: TextInputType.emailAddress,
              hintText:'Enter Email address' ,
              isPhone: false,
            ),
            const SizedBox(
                height: Dimensions.paddingSizeExtraLarge),

            CustomTextField(
              titleText:  'Enter Address',
              controller: address,
              inputType: TextInputType.text,
              hintText:'Enter Address' ,
              isPhone: false,
            ),
            const SizedBox(
                height: Dimensions.paddingSizeExtraLarge),
            CustomTextField(
              titleText:  'Enter House Number',
              controller: house,
              inputType: TextInputType.name,
              hintText:'Enter House Number' ,
              isPhone: false,
            ),
            const SizedBox(
                height: Dimensions.paddingSizeExtraLarge),
            Row(
  children: [
    Expanded(
      child: CustomTextField(
        titleText:  'Enter City',
        controller: city,
        inputType: TextInputType.name,
        hintText:'Enter Cityr' ,
        isPhone: false,
      ),
    ),
    const SizedBox(
        width: Dimensions.paddingSizeDefault),

    Expanded(
      child: CustomTextField(
        titleText:  'Enter Zip Code',
        controller: zipcode,
        inputType: TextInputType.name,
        hintText:'Enter Zip Code' ,
        isPhone: false,
      ),
    ),
  ],
),
            const SizedBox(
                height: Dimensions.paddingSizeExtraLarge),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    titleText:  'Enter State',
                    controller: state,
                    inputType: TextInputType.name,
                    hintText:'Enter State' ,
                    isPhone: false,
                  ),
                ),
                const SizedBox(
                    width: Dimensions.paddingSizeDefault),

                Expanded(
                  child: CustomTextField(
                    titleText:  'Enter Country',
                    controller: country,
                    inputType: TextInputType.name,
                    hintText:'Enter Country' ,
                    isPhone: false,
                  ),
                ),
              ],
            ),
            const SizedBox(
                height: Dimensions.paddingSizeExtraLarge),
            CustomTextField(
              titleText:  'Enter Neighborhood Community',
              controller: neighborad,
              inputType: TextInputType.name,
              hintText:'Enter Neighborhood Community' ,
              isPhone: false,
            ),

            SizedBox(
              height: Get.height/30,
            ),

            Obx(() =>
              Get.find<AuthController>().Loading.value?
                  Center(child: CircularProgressIndicator(),):

              CustomButton(
                buttonText: "Signup",
                textColor: Colors.black,
                onPressed: () async {
                  // Basic validation checks:

                  if (house.text.isEmpty) {
                    Get.snackbar("Validation Error", "Please enter your house number");
                    return;
                  }
                  if (city.text.isEmpty) {
                    Get.snackbar("Validation Error", "Please enter your city");
                    return;
                  }
                  if (neighborad.text.isEmpty) {
                    Get.snackbar("Validation Error", "Please enter your community");
                    return;
                  }
                  if (country.text.isEmpty) {
                    Get.snackbar("Validation Error", "Please enter your country");
                    return;
                  }
                  if (email.text.isEmpty || !GetUtils.isEmail(email.text)) {
                    Get.snackbar("Validation Error", "Please enter a valid email address");
                    return;
                  }
                  if (first.text.isEmpty) {
                    Get.snackbar("Validation Error", "Please enter your first name");
                    return;
                  }
                  if (last.text.isEmpty) {
                    Get.snackbar("Validation Error", "Please enter your last name");
                    return;
                  }
                  if (phone.text.isEmpty || !GetUtils.isPhoneNumber(phone.text)) {
                    Get.snackbar("Validation Error", "Please enter a valid phone number");
                    return;
                  }
                  if (state.text.isEmpty) {
                    Get.snackbar("Validation Error", "Please enter your state");
                    return;
                  }
                  if (address.text.isEmpty) {
                    Get.snackbar("Validation Error", "Please enter your street address");
                    return;
                  }
                  if (zipcode.text.isEmpty) {
                    Get.snackbar("Validation Error", "Please enter your zipcode");
                    return;
                  }
                 Get.to(verifysignup(
                   house: house.text,
                   city: city.text,
                   neighborad: neighborad.text,
                   country: country.text,
                   email: email.text,
                   first: first.text,
                   last: last.text,
                   phone: "${phone.text}",
                   state: state.text,
                   zipcode: zipcode.text,
                   address: address.text,

                 ));
                },
              )

            )
           ,
            SizedBox(
              height: Get.height/50,
            ),

            RichText(
              text: TextSpan(
                text: "You have Already account? ",
                style: TextStyle(color: Colors.black, fontSize: 16),
                children: [
                  TextSpan(
                    text: "Login",
                    style: TextStyle(
                      color: Get.theme.primaryColor,
                      fontWeight: FontWeight.bold,
                      //  decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {


                        Get.toNamed(RouteHelper
                            .getSignInRoute());
                      },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Get.height/38,
            ),

          ],
        ),
      ),
    );
  }
}
