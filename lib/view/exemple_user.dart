import 'package:achref_siaha/controllers/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserView extends StatelessWidget {
  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User Info")),
      body: Obx(
        () => userController.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Text('Nom: ${userController.user.name}'),
                  Text('Prénom: ${userController.user.lastName}'),
                  Text('Email: ${userController.user.email}'),
                  Text('Téléphone: ${userController.user.phoneNumber}'),
                  Text('Rôle: ${userController.user.role}'),
                  Text('Points de crédit: ${userController.user.creditPoints}'),
                  Text('Articles favoris: ${userController.user.favoriteItemIds.join(', ')}'),
                  ElevatedButton(
                    onPressed: () {
                      userController.addFavoriteItem("123"); // Ajouter l'article avec l'ID 123 aux favoris
                    },
                    child: Text('Ajouter un article favori'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      userController.removeFavoriteItem("1234"); // Supprimer l'article avec l'ID 123 des favoris
                    },
                    child: Text('Supprimer un article favori'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      userController.isLoading.value = true;
                      await userController.fetchUser("userId123"); // Remplacez "userId123" par l'ID réel de l'utilisateur
                      userController.isLoading.value = false;
                    },
                    child: Text('Récupérer les informations de l\'utilisateur'),
                  ),
                ],
              ),
      ),
    );
  }
}
