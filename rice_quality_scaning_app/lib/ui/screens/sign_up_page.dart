import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rice_quality_scanning/cubit/auth_cubit.dart';
import 'package:rice_quality_scanning/ui/screens/sign_in_page.dart';
import 'package:rice_quality_scanning/ui/screens/theme.dart';
import 'package:rice_quality_scanning/ui/widgets/costume_text_form_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController nameController = TextEditingController(text: '');

  final TextEditingController emailController = TextEditingController(text: '');

  final TextEditingController passwordController =
      TextEditingController(text: '');

  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/asset1.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 95, left: 45),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Rice quality',
                  style: GoogleFonts.poppins(
                    fontSize: 40,
                    color: kBlackColor,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  ' Make sure good quality \n for consumption',
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: kBlackColor,
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.only(
                  bottom: 40,
                  right: 35,
                  left: 35,
                ),
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 5,
                        sigmaY: 5,
                      ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 20,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white24.withOpacity(0.1),
                        ),
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                CostomTextFromField(
                                  hintext: 'User Name',
                                  icon: Icons.person,
                                  controller: nameController,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                CostomTextFromField(
                                  hintext: 'Email Address',
                                  icon: Icons.email_rounded,
                                  controller: emailController,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 54,
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                    right: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: kWhiteColor,
                                  ),
                                  child: TextFormField(
                                    controller: passwordController,
                                    obscureText: !_isVisible,
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 15),
                                      hintText: 'Password',
                                      hintStyle: greyStyle.copyWith(
                                        fontWeight: medium,
                                        fontSize: 16,
                                      ),
                                      icon: const Icon(
                                        Icons.lock,
                                      ),
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _isVisible = !_isVisible;
                                          });
                                        },
                                        icon: _isVisible
                                            ? const Icon(
                                                Icons.visibility,
                                                color: Colors.black,
                                              )
                                            : const Icon(
                                                Icons.visibility_off,
                                                color: Colors.grey,
                                              ),
                                      ),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                BlocConsumer<AuthCubit, AuthState>(
                                  listener: (context, state) {
                                    if (state is AuthSuccess) {
                                      Navigator.pushNamedAndRemoveUntil(
                                          context, '/main', (route) => false);
                                    } else if (state is AuthFailed) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          backgroundColor: Colors.red,
                                          content: Text(state.error),
                                        ),
                                      );
                                    }
                                  },
                                  builder: (context, state) {
                                    if (state is AuthLoading) {
                                      return Container(
                                        height: 53,
                                        width: 177,
                                        padding: const EdgeInsets.all(5),
                                        margin: const EdgeInsets.only(
                                          top: 10,
                                          bottom: 10,
                                        ),
                                        decoration: BoxDecoration(
                                          color: kprimeColor,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: const Center(
                                          child: CircularProgressIndicator(
                                            color: kWhiteColor,
                                          ),
                                        ),
                                      );
                                    }

                                    return Container(
                                      margin: const EdgeInsets.only(
                                          top: 25, bottom: 15),
                                      height: 53,
                                      width: 177,
                                      child: TextButton(
                                        onPressed: () {
                                          context.read<AuthCubit>().signUp(
                                                email: emailController.text,
                                                password:
                                                    passwordController.text,
                                                name: nameController.text,
                                              );
                                        },
                                        style: TextButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          backgroundColor: kprimeColor,
                                        ),
                                        child: Text(
                                          'Register',
                                          style: GoogleFonts.poppins(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: kWhiteColor,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Have an account?',
                                      style: whiteStyle.copyWith(),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const SignInPage()));
                                      },
                                      child: Text(
                                        'Sign In',
                                        style: whiteStyle.copyWith(
                                          fontWeight: semibold,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
