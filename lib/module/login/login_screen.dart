import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injaz_go/module/home_screen/home_screen.dart';
import 'package:injaz_go/module/login/widgets/build_all_images_with_text.dart';
import 'package:injaz_go/shared/components.dart';
import 'package:injaz_go/shared/constants.dart';
import 'package:injaz_go/shared/network/local/cache_helper.dart';
import 'package:injaz_go/shared/widgets/custom_button.dart';
import 'package:injaz_go/shared/widgets/custom_text.dart';
import 'package:injaz_go/shared/widgets/custom_text_form_field.dart';

import 'cubit/cubit.dart';
import 'cubit/states.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is AppLoginErrorState) {
            showToast(
              text:
                  'Make sure that ur data is right or u are not connected with internet',
              state: ToastStates.ERROR,
            );
          }
          if (state is AppLoginSuccessState) {
            /*showToast(
            text: 'Done Successfully',
            state: ToastStates.SUCCESS,
          );*/
            CacheHelper.saveData(
              key: 'tok',
              value: state.loginModel.accessToken,
            ).then((value) {
              navigateAndFinish(
                context,
                const HomeScreen(),
              );
            });
          }
        },
        builder: (context, state) {
          var cubit = LoginCubit.get(context);

          return Scaffold(
            backgroundColor: secondaryColor,
            body: SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              color: secondaryColor,
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
                                      const EdgeInsetsDirectional.only(top: 35),
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
                                        height: 185,
                                        width: double.infinity,
                                        margin: const EdgeInsets.symmetric(
                                          horizontal: 50,
                                        ),
                                        padding: const EdgeInsets.all(10),
                                        child: SingleChildScrollView(
                                          child: BuildAllImagesWithText(
                                            cubit: cubit,
                                          ),
                                        ),
                                      ),
                                      spaceInHeight(height: 20),
                                      const CustomText(
                                        text: 'Welcome back!',
                                        size: 25,
                                        isBold: true,
                                        color: Colors.white,
                                      ),
                                      spaceInHeight(height: 10),
                                      Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        elevation: 3.0,
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadiusDirectional.all(
                                              Radius.circular(30),
                                            ),
                                          ),
                                          width: double.infinity,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.40,
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional
                                                    .only(
                                                start: 20, end: 20, top: 15),
                                            child: SingleChildScrollView(
                                              child: Form(
                                                key: formKey,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const CustomText(
                                                      text: 'Login to continue',
                                                      alignment:
                                                          AlignmentDirectional
                                                              .center,
                                                      size: 22,
                                                      isBold: true,
                                                      color: defaultColor,
                                                    ),
                                                    spaceInHeight(height: 20),
                                                    CustomTextFormField(
                                                        label: 'Username',
                                                        prefix: Icons
                                                            .person_outline,
                                                        radius: 7,
                                                        textInputType:
                                                            TextInputType
                                                                .emailAddress,
                                                        controller:
                                                            usernameController,
                                                        validate:
                                                            (String value) {
                                                          if (value.isEmpty) {
                                                            return 'Username must not be empty';
                                                          }
                                                        }),
                                                    spaceInHeight(height: 15),
                                                    CustomTextFormField(
                                                        label: 'Password',
                                                        prefix:
                                                            Icons.lock_outline,
                                                        radius: 7,
                                                        isPassword: true,
                                                        onSuffixPressed: () {},
                                                        textInputType:
                                                            TextInputType
                                                                .visiblePassword,
                                                        controller:
                                                            passwordController,
                                                        validate:
                                                            (String value) {
                                                          if (value.isEmpty) {
                                                            print(
                                                                'in validate');
                                                            return 'Password must not be empty';
                                                          }
                                                        }),
                                                    spaceInHeight(height: 20),
                                                    ConditionalBuilder(
                                                      condition: state
                                                          is! AppLoginLoadingState,
                                                      builder: (context) =>
                                                          CustomButton(
                                                        onPressed: () {
                                                          final FormState?
                                                              form = formKey
                                                                  .currentState;
                                                          if (form!
                                                              .validate()) {
                                                            print(
                                                                'Form is valid');
                                                          } else {
                                                            print(
                                                                'Form is invalid');
                                                          }
                                                          if (formKey
                                                              .currentState!
                                                              .validate()) {
                                                            print(formKey
                                                                .currentState!
                                                                .validate());
                                                            cubit.userLogin(
                                                              username:
                                                                  usernameController
                                                                      .text,
                                                              password:
                                                                  passwordController
                                                                      .text,
                                                            );
                                                          }
                                                        },
                                                        radius: 7,
                                                        background:
                                                            secondaryColor,
                                                        text: 'login',
                                                      ),
                                                      fallback: (context) =>
                                                          const Center(
                                                              child:
                                                                  CircularProgressIndicator()),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
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
          );
        },
      ),
    );
  }
}
