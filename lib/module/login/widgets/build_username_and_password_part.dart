/*
import 'package:flutter/material.dart';
import 'package:injaz_go/shared/components.dart';
import 'package:injaz_go/shared/constants.dart';
import 'package:injaz_go/shared/widgets/custom_button.dart';
import 'package:injaz_go/shared/widgets/custom_text.dart';
import 'package:injaz_go/shared/widgets/custom_text_form_field.dart';

class BuildUsernameAndPasswordPart extends StatelessWidget {
  final TextEditingController usernameController, passwordController;
  final Function onButtonPressed;

  const BuildUsernameAndPasswordPart({
    super.key,
    required this.usernameController,
    required this.passwordController,
    required this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 3.0,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadiusDirectional.all(
            Radius.circular(30),
          ),
        ),
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.40,
        child: Padding(
          padding:
              const EdgeInsetsDirectional.only(start: 20, end: 20, top: 15),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomText(
                  text: 'Login to continue',
                  alignment: AlignmentDirectional.center,
                  size: 22,
                  isBold: true,
                  color: defaultColor,
                ),
                spaceInHeight(height: 20),
                CustomTextFormField(
                    label: 'Username',
                    prefix: Icons.person_outline,
                    radius: 7,
                    textInputType: TextInputType.emailAddress,
                    controller: usernameController,
                    validate: (String value) {
                      if (value.isEmpty) {
                        return 'Username must not be empty';
                      }
                    }),
                spaceInHeight(height: 15),
                CustomTextFormField(
                    label: 'Password',
                    prefix: Icons.lock_outline,
                    radius: 7,
                    isPassword: true,
                    onSuffixPressed: () {},
                    textInputType: TextInputType.visiblePassword,
                    controller: passwordController,
                    validate: (String value) {
                      if (value.isEmpty) {
                        return 'Password must not be empty';
                      }
                    }),
                spaceInHeight(height: 20),
                CustomButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      onButtonPressed();
                    }
                  },
                  radius: 7,
                  background: secondaryColor,
                  text: 'login',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
*/
