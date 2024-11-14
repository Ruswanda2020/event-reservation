import 'package:flutter/material.dart';

const Color primaryColor = Color(0xFF3A3089);
const Color secoundaryColor = Color(0xFFF7669D);
const Color tertiaryColor = Color(0xFF2E266F);

const sizeBoxWidth5 = SizedBox(width: 5);
const sizeBoxWidth20 = SizedBox(width: 20);

const sizeBoxHight5 = SizedBox(height: 5);
const sizeBoxHight10 = SizedBox(height: 10);
const sizeBoxHight20 = SizedBox(height: 20);
const sizeBoxHight30 = SizedBox(height: 30);
const sizeBoxHight40 = SizedBox(height: 40);
const sizeBoxHight60 = SizedBox(height: 60);

const blueProgressIndicator = SizedBox(
  height: 20,
  width: 25,
  child: CircularProgressIndicator(
    color: primaryColor,
  ),
);

const pingProgressIndicator = SizedBox(
  height: 20,
  width: 25,
  child: CircularProgressIndicator(
    color: secoundaryColor,
  ),
);
