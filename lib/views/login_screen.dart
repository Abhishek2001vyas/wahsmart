import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wahsmart/viewmodels/auth_controller.dart';
import 'package:wahsmart/views/widget/custom_button.dart';
import 'package:wahsmart/views/widget/custom_text_field.dart';

import '../helper/responsive_helper.dart';
import '../routes/route.dart';
import '../utils/dimensions.dart';
import '../utils/images.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? _countryDialCode;
  final TextEditingController phone=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
        child: Column(
          children: [
            SizedBox(
              height: Get.height/25,
            ),
            Center(
              child: Container(
                child: Image.asset(Images.logo,scale: 3,

                ),
              ),
            ),
            SizedBox(
              height: Get.height/13,
            ),
            Text("Welcome",
            style: TextStyle(fontSize: Dimensions.fontSizeOverLarge),),
            SizedBox(
              height: Get.height/100,
            ),
            Text("Please login and enjoy seamless \naccess to wah!", textAlign: TextAlign.center,style: TextStyle(
              color: Get.theme.hintColor, fontSize: Dimensions.fontSizeLarge),),
            SizedBox(
              height: Get.height/40,
            ),

            Obx(() =>
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          Get.find<AuthController>().phoneoremail.value=true;
                        },
                        child: Container(padding: EdgeInsets.all(Dimensions.paddingSizeSmall),
                          decoration: BoxDecoration(
                              color:
                              Get.find<AuthController>().phoneoremail.value
                                  ?
                              Colors.white:
                              Colors.grey.shade100,
                              border: Border.all(color:
                              Get.find<AuthController>().phoneoremail.value
                                  ?Get.theme.primaryColor:Colors.white
                              ),
                              borderRadius:
                              Get.find<AuthController>().phoneoremail.value
                                  ?
                              BorderRadius.circular(Dimensions.paddingSizeSmall)
                             :
                              BorderRadius.only(
                                topLeft: Radius.circular(Dimensions.paddingSizeSmall),
                                bottomLeft: Radius.circular(Dimensions.paddingSizeSmall),

                              )

                          ),
                          child: Center(child: Text("Phone Number",style: TextStyle(
                              fontWeight: Get.find<AuthController>().phoneoremail.value
                                  ? FontWeight.w500:FontWeight.normal,
                              color:
                          Get.find<AuthController>().phoneoremail.value
                              ?
                          Colors.black:
                          Colors.grey),)),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          Get.find<AuthController>().phoneoremail.value=false;

                        },
                        child: Container(padding: EdgeInsets.all(Dimensions.paddingSizeSmall),
                          decoration: BoxDecoration(
                              color:
                             ! Get.find<AuthController>().phoneoremail.value
                                  ?
                              Colors.white:
                              Colors.grey.shade100,
                              border: Border.all(color:
                              !Get.find<AuthController>().phoneoremail.value
                                  ?Get.theme.primaryColor:Colors.white
                              ),
                              borderRadius:
                              !Get.find<AuthController>().phoneoremail.value
                                  ?
                              BorderRadius.circular(Dimensions.paddingSizeSmall)
                                  :
                              BorderRadius.only(
                                topLeft: Radius.circular(Dimensions.paddingSizeSmall),
                                bottomLeft: Radius.circular(Dimensions.paddingSizeSmall),

                              )

                          ),
                          child: Center(child: Text("Email Address",style: TextStyle(
                            fontWeight: !Get.find<AuthController>().phoneoremail.value
                                ? FontWeight.w500:FontWeight.normal,
                              color:
                              !Get.find<AuthController>().phoneoremail.value
                                  ?
                                  Colors.black:Colors.grey
                             ),)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            SizedBox(
              height: Get.height/40,
            ),
            Obx(
              () =>
              Get.find<AuthController>().phoneoremail.value?
              CustomTextField(
                titleText:  'Enter phone number',
                controller: phone,
                suffixIcon: Icons.document_scanner_outlined,
                inputType: TextInputType.phone,
                hintText:'Enter phone number' ,
                isPhone: true,

                showTitle:
                ResponsiveHelper.isDesktop(context),
                onCountryChanged: (CountryCode countryCode) {
                  _countryDialCode = countryCode.dialCode;
                },
                countryDialCode:_countryDialCode!=null? _countryDialCode: "+91",
              ):
              CustomTextField(
                titleText:  'Enter Email address',
                controller: phone,
                suffixIcon: Icons.document_scanner_outlined,
                inputType: TextInputType.emailAddress,
                hintText:'Enter Email address' ,
                isPhone: false,
              )
            ),


            SizedBox(
              height: Get.height/30,
            ),

            Obx(() =>
            Get.find<AuthController>().Loading.value?
            Center(child: CircularProgressIndicator(),):
            CustomButton(
              buttonText: "Login",

              textColor: Colors.black,
              onPressed: ()async{
                if (phone.text.isEmpty || !GetUtils.isPhoneNumber(phone.text)) {
                  Get.snackbar("Validation Error", "Please enter a valid phone number");
                  return;
                }
             var   _countryDialCodeq = _countryDialCode!=null?_countryDialCode!.startsWith('+')
                    ? _countryDialCode!.substring(1)
                    : _countryDialCode:"";
                print("Dsfsd ${_countryDialCode}");
                await Get.find<AuthController>().login("${_countryDialCode!=null?"$_countryDialCodeq":"91"}${phone.text}").then((value) {

                },);
              },

            )),
            SizedBox(
              height: Get.height/6,
            ),
            RichText(
              text: TextSpan(
                text: "Don't have an account? ",
                style: TextStyle(color: Colors.black, fontSize: 16),
                children: [
                  TextSpan(
                    text: "Register Here",
                    style: TextStyle(
                      color: Get.theme.primaryColor,
                      fontWeight: FontWeight.bold,
                    //  decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {


                        Get.toNamed(RouteHelper
                            .getSignUpRoute());
                      },
                  ),
                ],
              ),
            )

          ],
        ),
      ),

    );
  }
}
