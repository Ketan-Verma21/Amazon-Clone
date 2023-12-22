import 'package:amazon_clone/common/widgets/custom_button.dart';
import 'package:amazon_clone/common/widgets/custom_textField.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/auth/services/auth_services.dart';
import 'package:flutter/material.dart';
enum Auth{
  signin,
  signup,
}
class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth=Auth.signup;
  final _signUpFormKey =GlobalKey<FormState>();
  final _signInFormKey =GlobalKey<FormState>();
  final TextEditingController _emailController =TextEditingController();
  final TextEditingController _passwordController =TextEditingController();
  final TextEditingController _nameController =TextEditingController();
  final AuthService authService =AuthService();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }
  void signUpUser(){
    authService.signUpUser(context: context, email: _emailController.text, password: _passwordController.text, name: _nameController.text);
  }
  void signInUser(){
    authService.signInUser(context: context, email: _emailController.text, password: _passwordController.text,);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GV.greyBackgroundCOlor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: const Text("Welcome",style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),),
                ),
                ListTile(
                  tileColor: _auth==Auth.signup? GV.backgroundColor:GV.greyBackgroundCOlor,
                  title: const Text("Create Account",style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),),
                  leading: Radio(
                    activeColor: GV.secondaryColor,
                    value: Auth.signup, groupValue: _auth,
                    onChanged: (Auth? val){
                        setState(() {
                          _auth=val!;
                        });
                    },
                  ),
                ),
                if(_auth==Auth.signup)
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: GV.backgroundColor,
                    child: Form(
                      key: _signUpFormKey,
                      child:Column(
                        children: [
                          CustomTextField(controller: _nameController,
                            text: 'Name',),
                          const SizedBox(height: 10,),
                          CustomTextField(controller: _emailController,
                            text: 'Email',),
                          const SizedBox(height: 10,),
                          CustomTextField(controller: _passwordController,
                            text: 'Password',),
                          const SizedBox(height: 10,),
                          CustomButton(text: "Sign Up", onTap:(){
                            if(_signUpFormKey.currentState!.validate()){
                              signUpUser();
                            }
                          }),
                        ],
                      ),
                    ),
                  ),
                ListTile(
                  tileColor: _auth==Auth.signin?GV.backgroundColor:GV.greyBackgroundCOlor,
                  title: const Text("Sign-In.",style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),),
                  leading: Radio(
                    activeColor: GV.secondaryColor,
                    value: Auth.signin, groupValue: _auth,
                    onChanged: (Auth? val){
                      setState(() {
                        _auth=val!;
                      });
                    },
                  ),

                ),
                if(_auth==Auth.signin)
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: GV.backgroundColor,
                    child: Form(
                      key: _signInFormKey,
                      child:Column(
                        children: [

                          CustomTextField(controller: _emailController,
                            text: 'Email',),
                          const SizedBox(height: 10,),
                          CustomTextField(controller: _passwordController,
                            text: 'Password',),
                          const SizedBox(height: 10,),
                          CustomButton(text: "Sign In", onTap: (){
                            if(_signInFormKey.currentState!.validate()){
                              signInUser();
                            }
                          })
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
    );
  }
}
