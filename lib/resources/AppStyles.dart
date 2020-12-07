import 'package:candidate_mobile_application/resources/AppColors.dart';
import 'package:candidate_mobile_application/resources/AppDimens.dart';
import 'package:flutter/material.dart';
/// [AppStyles] Styles of the app
class AppStyles{
    static final titleStyle = TextStyle(fontSize: AppDimens.size16Px,color: AppColors.blackColor,fontWeight: FontWeight.w500);

    static final descriptionStyle = TextStyle(fontSize: AppDimens.size14Px,color: AppColors.blackColor,fontWeight: FontWeight.normal);

    static final watchersStyle = TextStyle(fontSize: AppDimens.size12Px,color: AppColors.greyColor,fontWeight: FontWeight.w400);

    static final languageStyle = TextStyle(fontSize: AppDimens.size12Px,color: AppColors.greyColor,fontWeight: FontWeight.normal);
}