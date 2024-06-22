import 'package:flutter/material.dart';
import 'package:email_otp/email_otp.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petapplication/pages/pageforgetpass/my_verify_pass.dart';

class EmailVerify extends StatefulWidget {
  const EmailVerify({super.key});

  @override
  State<EmailVerify> createState() => _EmailVerifyState();
}

class _EmailVerifyState extends State<EmailVerify> {
  TextEditingController emailController = TextEditingController();
  EmailOTP myauth = EmailOTP();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEFE6E5),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 100),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  "https://img.freepik.com/free-vector/emails-concept-illustration_114360-1355.jpg?w=1380&t=st=1673699432~exp=1673700032~hmac=d65454eb5c72e8310209bf8ae770f849ea388f318dc6b9b1300b24b03e8886ca",
                  height: 350,
                ),
              ),
              SizedBox(
                height: 60,
                child: Text(
                  "Enter your Email to get Code",
                  style: TextStyle(
                    fontFamily: 'Cosffira',
                    fontSize: 60.sp,
                    color: const Color(0xff354A6B),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Card(
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.mail,
                        ),
                        suffixIcon: IconButton(
                            onPressed: () async {
                              myauth.setConfig(
                                  appEmail: "contact@hdevcoder.com",
                                  appName: "Email OTP",
                                  userEmail: emailController.text,
                                  otpLength: 4,
                                  otpType: OTPType.digitsOnly);
                              if (await myauth.sendOTP() == true) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text(
                                    "OTP has been sent",
                                    style: TextStyle(
                                      fontFamily: 'Cosffira',
                                      fontSize: 20,
                                      color: Color(0xff354A6B),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ));
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyVerify(
                                            myauth: myauth,
                                            email: emailController.text,
                                          )),
                                );
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text(
                                    "Oops, OTP send failed",
                                    style: TextStyle(
                                      fontFamily: 'Cosffira',
                                      fontSize: 20,
                                      color: Color(0xff354A6B),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ));
                              }
                            },
                            icon: const Icon(
                              Icons.send_rounded,
                              color: Colors.teal,
                            )),
                        hintText: "Email Address",
                        hintStyle: TextStyle(
                          fontFamily: 'Cosffira',
                          fontSize: 50.sp,
                          color: const Color(0xff354A6B),
                          fontWeight: FontWeight.w400,
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
