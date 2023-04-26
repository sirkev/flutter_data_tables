import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

//dynamic dimensions
class Dimensions {
  getScreenSize() {
    final screenHeight = Get.context!.height;
    final screenWidth = Get.context!.width;
    if (kDebugMode) {
      print("SCREEN SIZE: $screenHeight X $screenWidth");
    }
  }

  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;
//containers
  static double pageView = screenHeight / 2.64;
  static double pageViewerContainer = screenHeight / 3.84;
  static double pageTextContainer = screenHeight / 7.03;

//padding & margins/ heights & widths
  static double height5 = screenHeight / 168.8;
  static double height10 = screenHeight / 84.4;
  static double height15 = screenHeight / 56.27;
  static double height20 = screenHeight / 42.2;
  static double height25 = height20+height5;
  static double height30 = screenHeight / 42.2;
  static double height35 = screenHeight/24;
  static double height40 = screenHeight / 21;
  static double height45 = screenHeight / 18.76;
  static double height80 = screenHeight / 10.5;
  static double height180 = screenHeight / 4.66;
  static double height120 = screenHeight / 7;
  static double height140 = screenHeight / 6;
  static double height112 = screenHeight /7.5;
  static double height200 = screenHeight / 4.2;
  static double height300 = screenHeight / 2.8;
  static double height278 = screenHeight / 3.02;
  static double height434 = screenHeight/1.84;
  static double height322 = screenHeight/2.48;
  static double height550 = screenHeight/1.45;
  static double height206 = screenHeight/3.88;
  static double height358= screenHeight/2.23;
  static double height310= screenHeight/2.58;
  static double height246= screenHeight/3.25;
  static double height165= screenHeight/4.84;
  static double height265= screenHeight/3.01;
  static double height370= screenHeight/3.01;

  static getWidth(double width){
    screenWidth = Dimensions.screenWidth;
    double designWidth = 360;
    double scaleFactor = designWidth/width;
    double newWidth = screenWidth/scaleFactor;
    return newWidth;
  }
  static getHeight(double height){
    screenHeight = Dimensions.screenHeight;
    double designHeight = 800;
    double scaleFactor = designHeight/height;
    double newHeight = screenHeight/scaleFactor;
    return newHeight;
  }





  static double width5 = screenWidth / 72;
  static double width10 = screenWidth / 36;
  static double width15 = screenWidth / 24;
  static double width20 = screenWidth / 18;
  static double width30 = screenWidth /12;
  static double width35= width30+width5;
  static double width45 = screenWidth / 8;
  static double width70 = screenWidth / 5.14;
  static double width112 = screenWidth/3.21;
  static double width390 = screenWidth / 1.39;
  static double width328 = screenWidth / 1.1;
  static double width129= screenWidth / 2.79;

//font size
  static double font12 = screenHeight/60.0;
  static double font14 = screenHeight / 52.5;
  static double font16 = screenHeight / 52.75;
  static double font18 = screenHeight / 46.66;
  static double font20 = screenHeight / 42.2;
  static double font26 = screenHeight / 32.46;

//radius
  static double radius4 = screenHeight / 210;
  static double radius15 = screenHeight / 56.27;
  static double radius20 = screenHeight / 42.2;
  static double radius30 = screenHeight / 28.13;

  //icon Size
  static double iconSize24 = screenHeight / 35.17;
  static double iconSize16 = screenHeight / 52.75;
  static double iconSize32 = iconSize16 * 2;

  //list view size
  static double listViewImgSize = screenWidth / 3.25;
  static double listViewTextContSize = screenWidth / 3.9;


  static double popularFoodImgSize = screenHeight / 2.41;

  //bottom height
  static double bottomHeightBar = screenHeight / 7.03;
}
