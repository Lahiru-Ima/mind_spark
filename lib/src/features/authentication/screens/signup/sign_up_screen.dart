import 'package:flutter/material.dart';
import 'package:mind_spark/src/features/authentication/Services/user_service.dart';
import 'package:mind_spark/src/common_widgets/account_check.dart';
import 'package:mind_spark/src/common_widgets/primary_button.dart';
import 'package:mind_spark/src/constants/constants.dart';
import 'package:mind_spark/src/features/authentication/models/user_model.dart';
import '../account_type_screen.dart';
import '../../Services/auth_service.dart';
import '../../../../common_widgets/alert_box.dart';
import '../../../../common_widgets/input_text_field.dart';

class SignUpScreen extends StatefulWidget {
  final Enum user;
  const SignUpScreen({super.key, required this.user});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late Enum user;

  final _formkey = GlobalKey<FormState>();
  final _personalformkey = GlobalKey<FormState>();
  final _educationformkey = GlobalKey<FormState>();
  final _pwformkey = GlobalKey<FormState>();

  final firstname = TextEditingController();
  final lastname = TextEditingController();
  final email = TextEditingController();
  final phonenumber = TextEditingController();
  final address = TextEditingController();
  final password = TextEditingController();
  final confirmpassword = TextEditingController();

  final education = TextEditingController();
  final qualification = TextEditingController();
  final experience = TextEditingController();
  final currentworkingplace = TextEditingController();
  final workplacenumber = TextEditingController();

  bool personalVisible = true;
  bool educationVisible = false;
  bool passwordVisible = false;

  bool passToggle = true;
  bool comPassToggle = true;

  personalDetailsHide() {
    setState(() {
      personalVisible = false;
      educationVisible = true;
    });
  }

  educationDetailsHide() {
    setState(() {
      educationVisible = false;
      passwordVisible = true;
    });
  }

  personalDetailsShow() {
    setState(() {
      personalVisible = true;
      educationVisible = false;
    });
  }

  educationDetailsShow() {
    setState(() {
      educationVisible = true;
      passwordVisible = false;
    });
  }

  @override
  void initState() {
    super.initState();
    user = widget.user;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (user == UserType.patient) {
      return Scaffold(
        appBar: AppBar(
          forceMaterialTransparency: true,
          centerTitle: true,
          foregroundColor: kTextColor,
          title: const Text(
            'Patient Registration',
            style: TextStyle(color: kTextColor),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    Row(
                      children: [
                        InputTextField(
                          width: 0.35,
                          controller: firstname,
                          hintText: 'Enter firstname',
                          labelText: 'Firstname',
                          textInputType: TextInputType.name,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Firstname required";
                            }
                          },
                        ),
                        SizedBox(width: size.width * 0.1),
                        InputTextField(
                          width: 0.45,
                          controller: lastname,
                          hintText: 'Enter lastname',
                          labelText: 'Lastname',
                          textInputType: TextInputType.name,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Lastname required";
                            }
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    InputTextField(
                      width: 0.9,
                      controller: email,
                      hintText: 'Enter email address',
                      labelText: 'Email Address',
                      textInputType: TextInputType.emailAddress,
                      validator: (value) {
                        bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)")
                            .hasMatch(value);
                        if (value.isEmpty) {
                          return "Email required";
                        } else if (!emailValid) {
                          return "Please insert a valid email";
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    InputTextField(
                      width: 0.9,
                      controller: phonenumber,
                      hintText: 'Enter phone number',
                      labelText: 'Phone number',
                      textInputType: TextInputType.phone,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Phone number required";
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    InputTextField(
                      width: 0.9,
                      controller: address,
                      hintText: 'Enter address',
                      labelText: 'Address',
                      textInputType: TextInputType.streetAddress,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Address required";
                        }
                      },
                    ),
                    const SizedBox(height: 10),
                    InputTextField(
                      width: 0.9,
                      controller: password,
                      hintText: 'Enter password',
                      labelText: 'Password',
                      obscureText: passToggle,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Password required";
                        } else if (password.text.length < 6) {
                          return "Password length should be more than 6 characters";
                        }
                      },
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            passToggle = !passToggle;
                          });
                        },
                        child: Icon(passToggle
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                    ),
                    const SizedBox(height: 10),
                    InputTextField(
                      width: 0.9,
                      controller: confirmpassword,
                      hintText: 'Re-enter password',
                      labelText: 'Confirm password',
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Password required";
                        } else if (password.text != confirmpassword.text) {
                          return "Password isn't matching";
                        }
                      },
                      obscureText: comPassToggle,
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            comPassToggle = !comPassToggle;
                          });
                        },
                        child: Icon(comPassToggle
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                    ),
                    const SizedBox(height: 40),
                    PrimaryButton(
                      text: 'Create Account',
                      press: () async {
                        if (_formkey.currentState!.validate()) {
                          if (password.text == confirmpassword.text) {
                            final user = UserModel(
                                firstname: firstname.text.trim(),
                                lastname: lastname.text.trim(),
                                email: email.text.trim(),
                                phoneNo: phonenumber.text.trim(),
                                address: address.text,
                                password: password.text.trim());
                            await UserService().createUser(user);
                            dynamic result = await AuthServices()
                                .registerWithEmailAndPassword(
                                    email.text.trim(), password.text.trim());

                            if (result == null) {
                              print('error');
                            } else {
                              // ignore: use_build_context_synchronously
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (ctx) => AlertBox(
                                  title: 'Registration Successful',
                                  subtitle:
                                      'Congratulation your registration is completed successfully.',
                                  btntext: 'Log in',
                                  press: () {
                                    Navigator.pushNamed(
                                        context, '/sign_in_screen');
                                  },
                                ),
                              );
                            }
                          }
                        }
                      },
                      width: 0.9,
                      btncolor: kPrimaryColor,
                      btntextcolor: kWhiteColor,
                    ),
                    const SizedBox(height: 20),
                    const AccountCheck(login: false),
                  ],
                )),
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          forceMaterialTransparency: true,
          centerTitle: true,
          foregroundColor: kTextColor,
          title: const Text(
            'Doctor Registration',
            style: TextStyle(color: kTextColor),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            child: Column(
              children: [
                //========== 1, 2, 3 BUTTONS ============
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: personalVisible == true
                            ? Colors.cyan[700]
                            : Colors.grey,
                      ),
                      child: const Text(
                        '1',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.grey,
                      height: 2.0,
                      width: 40.0,
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: educationVisible == true
                            ? Colors.cyan[700]
                            : Colors.grey,
                      ),
                      child: const Text(
                        '2',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.grey,
                      height: 2.0,
                      width: 40.0,
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: passwordVisible == true
                            ? Colors.cyan[700]
                            : Colors.grey,
                      ),
                      child: const Text(
                        '3',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Visibility(
                  visible: personalVisible,
                  child: Form(
                      key: _personalformkey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Personal Details',
                            style: TextStyle(
                                color: kTextColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              InputTextField(
                                width: 0.35,
                                controller: firstname,
                                hintText: 'Enter firstname',
                                labelText: 'Firstname',
                                textInputType: TextInputType.name,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "FirstName required";
                                  }
                                },
                              ),
                              SizedBox(width: size.width * 0.1),
                              InputTextField(
                                  width: 0.45,
                                  controller: lastname,
                                  hintText: 'Enter lastname',
                                  labelText: 'Lastname',
                                  textInputType: TextInputType.name,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "Lastname required";
                                    }
                                  }),
                            ],
                          ),
                          const SizedBox(height: 20),
                          InputTextField(
                            width: 0.9,
                            controller: email,
                            hintText: 'Enter email address',
                            labelText: 'Email Address',
                            textInputType: TextInputType.emailAddress,
                            validator: (value) {
                              bool emailValid = RegExp(
                                      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)")
                                  .hasMatch(value);
                              if (value.isEmpty) {
                                return "Email required";
                              } else if (!emailValid) {
                                return "Please insert a valid email";
                              }
                            },
                          ),
                          const SizedBox(height: 20),
                          InputTextField(
                            width: 0.9,
                            controller: phonenumber,
                            hintText: 'Enter phone number',
                            labelText: 'Phone number',
                            textInputType: TextInputType.phone,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Phone number required";
                              }
                            },
                          ),
                          const SizedBox(height: 20),
                          InputTextField(
                            width: 0.9,
                            controller: address,
                            hintText: 'Enter address',
                            labelText: 'Address',
                            textInputType: TextInputType.streetAddress,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Address required";
                              }
                            },
                          ),
                          const SizedBox(height: 20),
                          InputTextField(
                            width: 0.9,
                            controller: address,
                            hintText: 'Enter NIC number',
                            labelText: 'NIC',
                            textInputType: TextInputType.number,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "NIC number required";
                              }
                            },
                          ),
                          const SizedBox(height: 40),
                          PrimaryButton(
                            text: 'Next',
                            press: () {
                              if (_personalformkey.currentState!.validate()) {
                                personalDetailsHide();
                              }
                            },
                            width: 0.9,
                            btncolor: kPrimaryColor,
                            btntextcolor: kWhiteColor,
                          ),
                        ],
                      )),
                ),
                Visibility(
                  visible: educationVisible,
                  child: Form(
                      key: _educationformkey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Education and Experience',
                            style: TextStyle(
                                color: kTextColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          InputTextField(
                            width: 0.9,
                            controller: education,
                            hintText: 'Enter higher education level',
                            labelText: 'Higher Education Level',
                            textInputType: TextInputType.text,
                          ),
                          const SizedBox(height: 20),
                          InputTextField(
                            width: 0.9,
                            controller: qualification,
                            hintText: 'Enter your qualification',
                            labelText: 'Qualification',
                            textInputType: TextInputType.text,
                          ),
                          const SizedBox(height: 20),
                          InputTextField(
                            width: 0.9,
                            controller: experience,
                            hintText: 'Enter your experience',
                            labelText: 'Experience',
                            textInputType: TextInputType.text,
                          ),
                          const SizedBox(height: 20),
                          InputTextField(
                            width: 0.9,
                            controller: currentworkingplace,
                            hintText: 'Enter your current working place',
                            labelText: 'Current Working Place',
                            textInputType: TextInputType.text,
                          ),
                          const SizedBox(height: 20),
                          InputTextField(
                            width: 0.9,
                            controller: workplacenumber,
                            hintText: 'Enter your workplace number',
                            labelText: 'Workplace Number',
                            textInputType: TextInputType.number,
                          ),
                          const SizedBox(height: 40),
                          Row(
                            children: [
                              SizedBox(
                                width: size.width * 0.2,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: kPrimaryColor,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 30),
                                  ),
                                  onPressed: () {
                                    personalDetailsShow();
                                  },
                                  child: const Center(
                                    child: Icon(
                                      Icons.arrow_back,
                                      color: kWhiteColor,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: size.width * 0.05),
                              PrimaryButton(
                                text: 'Next',
                                press: () {
                                  if (_educationformkey.currentState!
                                      .validate()) {
                                    educationDetailsHide();
                                  }
                                },
                                width: 0.65,
                                btncolor: kPrimaryColor,
                                btntextcolor: kWhiteColor,
                              ),
                            ],
                          ),
                        ],
                      )),
                ),
                Visibility(
                  visible: passwordVisible,
                  child: Form(
                      key: _pwformkey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Password',
                            style: TextStyle(
                                color: kTextColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          InputTextField(
                            width: 0.9,
                            controller: password,
                            hintText: 'Enter password',
                            labelText: 'Password',
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Password required";
                              } else if (password.text.length < 6) {
                                return "Password length should be more than 6 characters";
                              }
                            },
                            obscureText: passToggle,
                            suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  passToggle = !passToggle;
                                });
                              },
                              child: Icon(passToggle
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                            ),
                          ),
                          const SizedBox(height: 10),
                          InputTextField(
                            width: 0.9,
                            controller: confirmpassword,
                            hintText: 'Re-enter password',
                            labelText: 'Confirm password',
                            obscureText: comPassToggle,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Password required";
                              } else if (password.text !=
                                  confirmpassword.text) {
                                return "Password isn't matching";
                              }
                            },
                            suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  comPassToggle = !comPassToggle;
                                });
                              },
                              child: Icon(comPassToggle
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                            ),
                          ),
                          const SizedBox(height: 40),
                          Row(
                            children: [
                              SizedBox(
                                width: size.width * 0.2,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: kPrimaryColor,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 30),
                                  ),
                                  onPressed: () {
                                    educationDetailsShow();
                                  },
                                  child: const Center(
                                    child: Icon(
                                      Icons.arrow_back,
                                      color: kWhiteColor,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: size.width * 0.05),
                              PrimaryButton(
                                text: 'Create Account',
                                press: () {
                                  if (_pwformkey.currentState!.validate()) {}
                                },
                                width: 0.65,
                                btncolor: kPrimaryColor,
                                btntextcolor: kWhiteColor,
                              ),
                            ],
                          ),
                        ],
                      )),
                ),
                const SizedBox(height: 20),
                const AccountCheck(login: false),
              ],
            ),
          ),
        ),
      );
    }
  }
}
