import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hollo/core/core.dart';
import 'package:hollo/shared/shared.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(18.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Register',
                style: TStyles.h2(),
              ),
              SizedBox(height: 25.w),
              const MyTextField(
                hintText: 'Email',
                textInputType: TextInputType.emailAddress,
              ),
              SizedBox(height: 12.w),
              const MyTextField(
                hintText: 'Password',
              ),
              SizedBox(height: 20.w),
              MyButton(
                text: 'Submit',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
