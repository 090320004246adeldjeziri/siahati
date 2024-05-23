import 'package:achref_siaha/home.dart';
import 'package:achref_siaha/view/emailFiled.dart';
import 'package:achref_siaha/view/passwordFiled.dart';
import 'package:achref_siaha/view/phone.dart';
import 'package:achref_siaha/view/textFiled.dart';
import 'package:flutter/material.dart';


class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Créer un compte'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Inscription',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            MyTextField(
              ButtonName: 'Nom',
              icon: Icon(Icons.person),
              textEditingController: TextEditingController(),
              serviceType: TextInputType.text,
            ),
             const SizedBox(height: 20),
             MyTextField(
              ButtonName: 'Prenom',
              icon: Icon(Icons.person),
              textEditingController: TextEditingController(),
              serviceType: TextInputType.text,
            ),
            const SizedBox(height: 20),
            EmailField(
              ButtonName: 'Adresse e-mail',
              icon: Icon(Icons.email),
              textEditingController: TextEditingController(),
              serviceType: TextInputType.emailAddress,
            ),
            SizedBox(height: 20),
            PasswordField(
              hintText: 'Mot de passe',
              icon: Icon(Icons.lock),
              controller: TextEditingController(),
            ),
            SizedBox(height: 20),
            PhoneNumberField( // Ajoutez PhoneNumberField
              hintText: 'Numéro de téléphone',
              icon: Icon(Icons.phone),
              controller: TextEditingController(),
            ),
            const SizedBox(height: 20),
            Container(height: 50,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, HomePage());
                },
                child: Text('S\'inscrire',style: TextStyle(fontSize: 18),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
