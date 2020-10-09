import 'package:chat/widgets/button_blue_widget.dart';
import 'package:chat/widgets/custom_input_widget.dart';
import 'package:chat/widgets/custom_login_labels_widget.dart';
import 'package:chat/widgets/custom_logo_widget.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {

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
                logoText: "Register",
              ),
              _FormState(),
              CustomLoginLabels(
                navigateText: "¡Ingresa con tus datos!",
                goPage: "login",
                question: "¿Ya tienes una cuenta?",
              ),
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
  final nameCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
         children: [
          CustomInput(
            icon: Icons.perm_identity,
            placeholder: "Nombre",
            textController: nameCtrl,
          ),
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
            btnText: "Guardar",
            btnPress: () {
              print(emailCtrl.text);
            },
          ),
         ],
       )
    );
  }
}