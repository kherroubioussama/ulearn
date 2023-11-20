import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearn_bloc_app/common/values/colors.dart';
import 'package:ulearn_bloc_app/pages/welcome/bloc/welcome_bloc.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Scaffold(
          body: BlocBuilder<WelcomeBloc, WelcomeState>(
            builder: (context, state) {
              return Container(
                margin: EdgeInsets.only(top: 34.h),
                width: 375.w,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    PageView(
                      controller: pageController,
                      onPageChanged: (index) {
                        state.page = index;
                        BlocProvider.of<WelcomeBloc>(context)
                            .add(WelcomeEvent());
                      },
                      children: [
                        _page(
                            1,
                            context,
                            "Next",
                            "First See Learning",
                            "Forgot about a for paper all knowledge in one learning place.",
                            "assets/images/reading.png"),
                        _page(
                            2,
                            context,
                            "Next",
                            "Connect With Everyone",
                            "Always keep in touch with your tutors and friends.Lets get connected.",
                            "assets/images/boy.png"),
                        _page(
                            3,
                            context,
                            "Get Started",
                            "Always Fascinated Learning",
                            "Anytime. Anywhere.The time is at our discretion.So study whenever you can.",
                            "assets/images/man.png"),
                      ],
                    ),
                    Positioned(
                      bottom: 100.h,
                      child: DotsIndicator(
                        mainAxisAlignment: MainAxisAlignment.center,
                        position: state.page,
                        dotsCount: 3,
                        decorator: DotsDecorator(
                            color: AppColors.primaryThreeElementText,
                            activeColor: AppColors.primaryElement,
                            size: const Size.square(9.0),
                            activeSize: const Size(18.0, 9.0),
                            activeShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            )),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ));
  }

  Widget _page(int index, BuildContext context, String buttonName, String title,
      String subtitle, String imagePath) {
    return Column(
      children: [
        SizedBox(
          height: 345.h,
          width: 345.w,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          child: Text(title,
              style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.normal,
                  color: AppColors.primaryText)),
        ),
        Container(
          width: 375.w,
          margin: EdgeInsets.only(left: 30.w, right: 30.w),
          child: Text(
            "Forgot about a for paper all knowledge in one learning place.",
            style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.normal,
                color: AppColors.primarySecondaryElementText),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (index < 3) {
              pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            } else {
              Navigator.pushNamedAndRemoveUntil(
                  context, "signIn", (route) => false);
            }
          },
          child: Container(
            width: 325.w,
            height: 50.h,
            margin: EdgeInsets.only(top: 50.h, left: 25.w, right: 25.w),
            decoration: BoxDecoration(
                color: AppColors.primaryElement,
                borderRadius: BorderRadius.circular(15.w),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: const Offset(0, 1),
                  )
                ]),
            child: Center(
              child: Text(
                buttonName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.normal),
              ),
            ),
          ),
        )
      ],
    );
  }
}
