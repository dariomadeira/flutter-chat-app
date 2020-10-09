import 'package:chat/widgets/button_blue_widget.dart';
import 'package:chat/widgets/custom_input_widget.dart';
import 'package:chat/widgets/custom_login_labels_widget.dart';
import 'package:chat/widgets/custom_logo_widget.dart';
import 'package:chat/widgets/custom_terms_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomLogo(
                logoText: "Messenger",
              ),
              _FormState(),
              CustomLoginLabels(
                goPage: "register",
                navigateText: "¡Crea una cuenta ahora!",
                question: "¿No tienes cuenta?",
              ),
              const SizedBox(height: 10,),
              CustomTerms(),
            ],
          ),
        ),
      )
   );
  }
}

class _FormState extends StatefulWidget {

  @override
  __FormStateState createState() => __FormStateState();
}

class __FormStateState extends State<_FormState> {

  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
         children: [
          CustomInput(
            icon: Icons.mail_outline,
            placeholder: "Email",
            keyboardType: TextInputType.emailAddress,
            textController: emailCtrl,
          ),
          CustomInput(
            icon: Icons.lock_outline,
            placeholder: "Contraseña",
            textController: passCtrl,
            isPassword: true,
          ),
          ButtonBlue(
            btnText: "Ingrese",
            btnPress: () {
              print(emailCtrl.text);
            },
          ),
         ],
       )
    );
  }
}