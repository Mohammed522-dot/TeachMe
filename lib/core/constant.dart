import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

const primaryColor = Color.fromRGBO(34, 178, 222, 1.0);

const mPrimaryTextColor = Color(0xFFDB9E82);
const mTitleTextColor = Color(0xFF25257E);
const mBackgroundColor = Color(0xFFFDFCFF);
const mSecondBackgroundColor = Color(0xFFBCCBF3);
const mButtonColor = Color(0xFF5063FF);
const mYellowColor = Color(0xFFFB7B11);
BorderRadius kBorderRadius = BorderRadius.circular(5.5);
 EdgeInsets kHPadding = const EdgeInsets.symmetric(horizontal: 20.00);
EdgeInsets kVPadding = const EdgeInsets.symmetric(horizontal: 20.00);
double kSpacing = 15.00;


const textColor = Color(0xFF35364F);
const backgroundColor = Color(0xFFE6EFF9);
const redColor = Color(0xFFE85050);

const defaultPadding = 16.0;

OutlineInputBorder textFieldBorder = OutlineInputBorder(
 borderSide: BorderSide(
  color: primaryColor.withOpacity(0.1),
 ),
);

// I will explain it later

const emailError = 'Enter a valid email address';
const requiredField = "This field is required";

final passwordValidator = MultiValidator(
 [
  RequiredValidator(errorText: 'password is required'),
  MinLengthValidator(8, errorText: 'password must be at least 8 digits long'),
  PatternValidator(r'(?=.*?[#?!@$%^&*-])',
      errorText: 'passwords must have at least one special character')
 ],
);