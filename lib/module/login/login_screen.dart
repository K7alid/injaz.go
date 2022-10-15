import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injaz_go/module/login/widgets/build_all_images_with_text.dart';
import 'package:injaz_go/module/login/widgets/build_username_and_password_part.dart';
import 'package:injaz_go/shared/components.dart';
import 'package:injaz_go/shared/constants.dart';
import 'package:injaz_go/shared/widgets/custom_text.dart';

import 'cubit/cubit.dart';
import 'cubit/states.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  var formKey = GlobalKey<FormState>();
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = LoginCubit.get(context);

        return Scaffold(
          backgroundColor: defaultColor,
          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Container(
                  color: Colors.white,
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              color: defaultColor,
                              height: MediaQuery.of(context).size.height * 0.50,
                              width: double.infinity,
                            ),
                            Center(
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.90,
                                height:
                                    MediaQuery.of(context).size.height * 0.95,
                                child: Padding(
                                  padding:
                                      const EdgeInsetsDirectional.only(top: 50),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.white),
                                          borderRadius:
                                              const BorderRadiusDirectional.all(
                                            Radius.circular(15),
                                          ),
                                        ),
                                        height: 150,
                                        width: double.infinity,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 30),
                                        padding: EdgeInsets.all(10),
                                        child: SingleChildScrollView(
                                          child: BuildAllImagesWithText(
                                              cubit: cubit),
                                        ),
                                      ),
                                      spaceInHeight(height: 20),
                                      CustomText(
                                        text: 'Welcome back!',
                                        size: 25,
                                        isBold: true,
                                        color: Colors.white,
                                      ),
                                      spaceInHeight(height: 10),
                                      BuildUsernameAndPasswordPart(
                                        usernameController: usernameController,
                                        passwordController: passwordController,
                                        formKey: formKey,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
