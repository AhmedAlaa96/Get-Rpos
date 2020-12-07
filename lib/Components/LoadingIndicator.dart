import 'package:candidate_mobile_application/resources/AppColors.dart';
import 'package:candidate_mobile_application/resources/AppDimens.dart';
import 'package:flutter/material.dart';

/// [LoadingIndicator] StatelessWidget class contains loading indicator until data came from network call
class LoadingIndicator extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final _windowSize = MediaQuery.of(context).size;

    return Container(
      width: _windowSize.width,
      height: _windowSize.height,
      color: AppColors.loadingIndicatorBackground,
      child: Center(
        child: SizedBox(
          width: AppDimens.size24Px,
          height: AppDimens.size24Px,
          child: CircularProgressIndicator(
            strokeWidth: 3.0,
            valueColor:
            AlwaysStoppedAnimation<Color>(AppColors.whiteColor),
          ),
        ),
      ),
    );
  }
}
