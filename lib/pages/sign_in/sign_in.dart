import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearn_bloc_app/pages/sign_in/widgets/sigin_in_widgets.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: buildAppBar(),
            body: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  buildThirdPartyLoginButton(context),
                  Center(
                      child:
                          reusableText("Or use your email account to login")),
                  Container(
                      margin: EdgeInsets.only(top: 36.h),
                      padding: EdgeInsets.only(left: 25.w, right: 25.w),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            reusableText("Email"),
                            SizedBox(height: 5.h),
                            buildTextField(
                                "Enter your email address", "Email", "user"),
                            reusableText("Password"),
                            SizedBox(height: 5.h),
                            buildTextField(
                                "Enter your password", "Password", "lock"),
                          ])),
                  forgotPassword(),
                  buildLogInAndRegButton("Log In","signIn"),
                  buildLogInAndRegButton("Register","register"),
                ])),
          ),
        ));
  }
}
