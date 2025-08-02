import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wahsmart/utils/dimensions.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wahsmart/viewmodels/auth_controller.dart';
import 'package:wahsmart/views/widget/custom_button.dart';
import 'package:wahsmart/views/widget/custom_text_field.dart';

import '../data/models/body/signup_body_model.dart';
import '../helper/responsive_helper.dart';
import '../routes/route.dart';
import '../utils/dimensions.dart';
import '../utils/images.dart';


class verifysignup extends StatefulWidget {

  final  phone;
  final  email;
  final  first;
  final  last;
  final  address;
  final  state;
  final  country;
  final  city;
  final  zipcode;
  final  neighborad;
  final  house;
  const verifysignup({super.key, this.phone, this.email, this.first, this.last, this.address, this.state, this.country, this.city, this.zipcode, this.neighborad, this.house});

  @override
  State<verifysignup> createState() => _verifysignupState();
}

class _verifysignupState extends State<verifysignup> {

  String? _countryDialCode;
 late final TextEditingController phone=TextEditingController(text: widget.phone);
  late final TextEditingController email=TextEditingController(text: widget.email);
  late final TextEditingController first=TextEditingController(text: widget.first);
  late final TextEditingController last=TextEditingController(text: widget.last);
  late final TextEditingController address=TextEditingController(text: widget.address);
  late final TextEditingController state=TextEditingController(text: widget.state);
  late  final TextEditingController country=TextEditingController(text: widget.country);
  late final TextEditingController city=TextEditingController(text: widget.city);
  late final TextEditingController zipcode=TextEditingController(text: widget.zipcode);
  late final TextEditingController neighborad=TextEditingController(text: widget.neighborad);
  late final TextEditingController house=TextEditingController(text: widget.house);


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
                child: Image.asset(Images.logo2,scale:20,
                ),
              ),
            ),
            SizedBox(
              height: Get.height/50,
            ),
            Text("Verify Your Profile",
              style: TextStyle(fontSize: Dimensions.fontSizeOverLarge,fontWeight:FontWeight.bold ),),
            const SizedBox(
                height: Dimensions.paddingSizeExtraLarge),

            CustomTextField(
              readOnly: true,
              titleText:  'Enter First Name',
              controller: first,
              inputType: TextInputType.name,
              hintText:'Enter First Name' ,
              isPhone: false,
            ),
            const SizedBox(
                height: Dimensions.paddingSizeExtraLarge),
            CustomTextField(  readOnly: true,
              titleText:  'Enter Last Name',
              controller: last,
              inputType: TextInputType.name,
              hintText:'Enter Last Name' ,
              isPhone: false,
            ),
            const SizedBox(
                height: Dimensions.paddingSizeExtraLarge),


            CustomTextField(  readOnly: true,
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
            CustomTextField(  readOnly: true,
              titleText:  'Enter Email address',
              controller: email,
              inputType: TextInputType.emailAddress,
              hintText:'Enter Email address' ,
              isPhone: false,
            ),
            const SizedBox(
                height: Dimensions.paddingSizeExtraLarge),

            CustomTextField(  readOnly: true,
              titleText:  'Enter Address',
              controller: address,
              inputType: TextInputType.text,
              hintText:'Enter Address' ,
              isPhone: false,
            ),
            const SizedBox(
                height: Dimensions.paddingSizeExtraLarge),
            CustomTextField(  readOnly: true,
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
                  child: CustomTextField(  readOnly: true,
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
                  child: CustomTextField(  readOnly: true,
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
                  child: CustomTextField(  readOnly: true,
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
                  child: CustomTextField(  readOnly: true,
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


            Row(
              children: [
                Checkbox(value: true, onChanged: (value) {

                },),
                SizedBox(width: 50,),
                RichText(
                  text: TextSpan(
                    text: "I accept all the  ",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    children: [
                      TextSpan(
                        text: "T&C and Privacy Policy ",
                        style: TextStyle(
                          color: Get.theme.primaryColor,
                          fontWeight: FontWeight.bold,
                          //  decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {

                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Get.height/50,
            ),
            Obx(() =>
            Get.find<AuthController>().Loading.value?
            Center(child: CircularProgressIndicator(),):

            CustomButton(
              buttonText: "Confirm",
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
                var   _countryDialCodeq = _countryDialCode!=null?_countryDialCode!.startsWith('+')
                    ? _countryDialCode!.substring(1)
                    : _countryDialCode:"";
                print("Dsfsd ${_countryDialCode}");
                // If all validations pass, create body and call API
                Signupbody body = Signupbody(
                  aptNumber: house.text,
                  city: city.text,
                  community: neighborad.text,
                  country: country.text,
                  emailId: email.text,
                  firstName: first.text,
                  lastName: last.text,
                  mobilePhone: "${_countryDialCode!=null?"$_countryDialCodeq":"91"}${phone.text}",
                  state: state.text,
                  street: address.text,
                  zipcode: zipcode.text,
                );

                await Get.find<AuthController>().registerUri(body).then((value) async {
                  var rep = jsonDecode(value.body);
                  if (rep["customer_id"] != null) {
                    showDialog(context: context, builder: (BuildContext context) {
                      return AlertDialog(backgroundColor: Colors.white,

                        content: SizedBox(height: 200,width: 300,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [


                              Image.asset("assets/images/Group.png"),
                              SizedBox(height: 30),
                              Text(
                                "Registration successfully!",
                                style: TextStyle(
                                  fontSize: 18,fontWeight: FontWeight.bold,

                                ),
                              ),
                              SizedBox(height: 15),
                              Text(" You will be redirected to the create\n profile page shortly...",textAlign: TextAlign.center,style: TextStyle(fontSize: 13,color: Colors.grey),)

                            ],
                          ),
                        ),
                      );
                    });
                    await Future.delayed(Duration(seconds: 1),() {});
                    Get.toNamed(RouteHelper
                        .getSignInRoute());
                  //  Get.snackbar("Success", "Signup successful", backgroundColor: Colors.green, colorText: Colors.white);
                  } else {
                  //  Get.snackbar("Error", rep["message"] ?? "Signup failed", backgroundColor: Colors.red, colorText: Colors.white);
                  }
                });
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


                        Get.back();
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
