import 'package:achref_siaha/auth/register.dart';
import 'package:achref_siaha/home.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:  [
        const Image(image:AssetImage(
            "assets/images/a.png", // Chemin vers votre image
        )
          ),
          const SizedBox(height: 20), // Espacement entre l'image et le texte
         const  Text(
            'Bienvenue sur notre application', // Texte personnalisé
            style: TextStyle(
              fontSize: 24, // Taille de la police
              fontWeight: FontWeight.bold, // Gras
            ),
          ),
          const SizedBox(height: 10), // Espacement entre le texte et d'autres éléments
          const Text(
            'Découvrez les fonctionnalités incroyables', // Autre texte personnalisé
            style: TextStyle(
              fontSize: 16, // Taille de la police
            ),
          ),
          SizedBox(height: 30), // Espacement entre le texte et d'autres éléments
          ElevatedButton(
            onPressed: () {
               Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
              // Action à effectuer lors de l'appui sur le bouton
            },
            child: Text('Commencer'), // Texte du bouton
          ),
        ],
      ),
    );
  }
}
