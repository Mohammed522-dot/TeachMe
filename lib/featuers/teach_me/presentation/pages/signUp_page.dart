import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:teachme/core/constant.dart';
import 'package:teachme/featuers/teach_me/presentation/bloc/RegisterBloc.dart';
import 'package:teachme/featuers/teach_me/presentation/bloc/RegisterState.dart';
import 'package:teachme/featuers/teach_me/presentation/pages/login_page.dart';
import 'package:teachme/featuers/teach_me/presentation/widgets/lodingWidget.dart';
import 'package:teachme/featuers/teach_me/presentation/widgets/register/sign_up_form.dart';

import '../bloc/RegisterEvent.dart';

class SignUpScreen extends StatefulWidget {
  // It's time to validat the text field
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}
  final _formKey = GlobalKey<FormState>();
class _SignUpScreenState extends State<SignUpScreen>{
  @override
  Widget build(BuildContext context) {
    // But still same problem, let's fixed it
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => RegisterBloc())
        ],
      child: BlocConsumer<RegisterBloc,RegisterState>(
        listener: (context,state) {
         if(state is RegisterError){
          Text("");
         } else if (state is RegisterLoaded){
           Text("");
         }
         else if(state is RegisterResponseError){
           Text("");
         }
        },
        builder: (context,state){
    if (state is RegisterLoading) {
    return LoadingWidget(child: buildRegisterInput(context));
    } else {
    return buildRegisterInput(context);
    }
    },));
  }

  Widget buildRegisterInput(BuildContext context) =>
        Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            fit: StackFit.expand,
            children: [
              SvgPicture.asset(
                "assets/Teach-me-logo.png",
                height: MediaQuery.of(context).size.height,
                // Now it takes 100% of our height
              ),
              Center(
                child: SafeArea(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Create Account",
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Text("Already have an account?"),
                            TextButton(
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginPage(),
                                  )),
                              child: Text(
                                "Sign In!",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: defaultPadding * 2),
                        SignUpForm(formKey: _formKey),
                        const SizedBox(height: defaultPadding * 2),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                // Sign up form is done
                                BlocProvider.of<RegisterBloc>(context)
                                    .add(Register("","","","","","","","",""));
                                // It saved our inputs
                               _formKey.currentState!.save();
                              }
                            },
                            child: Text("Sign Up"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
      );

}

