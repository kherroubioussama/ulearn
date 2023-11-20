import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearn_bloc_app/common/values/colors.dart';

AppBar buildAppBar() {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1.0),
      child: Container(
        color: AppColors.primarySecondaryBackground,
        //height defines the thickness of the line
        height: 1.0,
      ),
    ),
    centerTitle: true,
    title: Text(
      "Log In",
      style: TextStyle(
        color: AppColors.primaryText,
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
      ),
    ),
  );
}

Widget buildThirdPartyLoginButton(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 40.h, bottom: 20.h),
    padding: EdgeInsets.only(left: 25.w, right: 25.w),
    child: Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          _reusableIcon("facebook"),
          _reusableIcon("google"),
          _reusableIcon("apple"),
        ]),
      ],
    ),
  );
}

Widget _reusableIcon(String iconName) {
  return GestureDetector(
      onTap: () {},
      child: SizedBox(
        width: 40.w,
        height: 40.h,
        child: Image.asset("assets/icons/$iconName.png"),
      ));
}

Widget reusableText(String text) {
  return Container(
    margin: EdgeInsets.only(bottom: 5.h),
    child: Text(text,
        style: TextStyle(
          color: Colors.grey.withOpacity(0.5),
          fontSize: 14.sp,
          fontWeight: FontWeight.normal,
        )),
  );
}

Widget buildTextField(String hintText, String textType, String iconName) {
  return Container(
    height: 50.h,
    width: 325.w,
    margin: EdgeInsets.only(bottom: 20.h),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15.w),
      border: Border.all(color: AppColors.primaryFourElementText),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 1,
          blurRadius: 2,
          offset: const Offset(0, 1),
        )
      ],
    ),
    child: Row(
      children: [
        Container(
          width: 16.w,
          height: 16.h,
          margin: EdgeInsets.only(left: 15.w),
          child: Image.asset("assets/icons/$iconName.png"),
        ),
        SizedBox(
          width: 270.w,
          height: 50.h,
          child: TextField(
            keyboardType: TextInputType.multiline,
            style: TextStyle(
              color: AppColors.primaryText,
              fontSize: 14.sp,
              fontWeight: FontWeight.normal,
              fontFamily: "Avenir",
            ),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                color: AppColors.primarySecondaryElementText,
                fontSize: 14.sp,
                fontWeight: FontWeight.normal,
              ),
              border: const OutlineInputBorder(
                  borderSide: BorderSide(
                color: Colors.transparent,
              )),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                color: Colors.transparent,
              )),
              disabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                color: Colors.transparent,
              )),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                color: Colors.transparent,
              )),
            ),
            autocorrect: false,
            obscureText: textType == "Password" ? true : false,
          ),
        )
      ],
    ),
  );
}

Widget forgotPassword() {
  return GestureDetector(
    onTap: () {},
    child: Container(
      height: 44.h,
      width: 260.w,
      margin: EdgeInsets.only(left: 25.w),
      child: Text(
        "Forgot Password?",
        style: TextStyle(
          color: AppColors.primaryText,
          fontSize: 12.sp,
          fontWeight: FontWeight.normal,
          decoration: TextDecoration.underline,
          decorationColor: AppColors.primaryText,
        ),
      ),
    ),
  );
}

Widget buildLogInAndRegButton(String buttonName, String buttonType) {
  return Container(
    margin: EdgeInsets.only(
        left: 25.w, right: 25.w, top: buttonType == "signIn" ? 40.h : 20.h),
    width: 325.w,
    height: 50.h,
    decoration: BoxDecoration(
      color: buttonType == "signIn"
          ? AppColors.primaryElement
          : AppColors.primaryBackground,
      borderRadius: BorderRadius.circular(15.w),
      border: Border.all(
          color: buttonType == "signIn"
              ? Colors.transparent
              : AppColors.primaryFourElementText),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          spreadRadius: 1,
          blurRadius: 2,
          offset: const Offset(0, 1),
        )
      ],
    ),
    child: Center(
      child: Text(
        buttonName,
        style: TextStyle(
          color: buttonType == "signIn"
              ? AppColors.primaryBackground
              : AppColors.primaryText,
          fontSize: 16.sp,
          fontWeight: FontWeight.normal,
        ),
      ),
    ),
  );
}
