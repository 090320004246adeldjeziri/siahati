import 'package:achref_siaha/model/category.dart';
import 'package:achref_siaha/view/Anonce.dart';
import 'package:achref_siaha/view/accomondation.dart';
import 'package:achref_siaha/view/category_list.dart';
import 'package:achref_siaha/view/exemple_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomePage extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) { final List<Category> categories = [
    Category(title: 'Category 1', imageUrl: 'https://via.placeholder.com/150'),
    Category(title: 'Category 2', imageUrl: 'https://via.placeholder.com/150'),
    Category(title: 'Category 3', imageUrl: 'https://via.placeholder.com/150'),
    // Add more categories as needed
  ];
    return Scaffold(
      drawer: const DRAWER(),
      appBar: AppBar(
        title: Text("Home Page"),
        centerTitle: true,
        leading: Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu, ),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),  
        actions: [Padding(
              padding: const EdgeInsets.all(20.0),
              child: GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     //builder: (context) => SearchScreen(),
                  //   ),
                  // );
                },
                child: const Icon(
                  CupertinoIcons.search,
                
                ),
              ),
            )],
      ),
      body: SingleChildScrollView(
  child: Expanded(
    child: Column(
      children: [
        AnnouncementSliderPage(),
        CategoryList(categories: categories),
        AccomondationPage(),
        
      ],
    ),
  ),
),
      );
  }
}
class DRAWER extends StatelessWidget {
  const DRAWER({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
          elevation: 4,
          backgroundColor: Colors.indigoAccent.withOpacity(0.9),
          child: ListView(
            children: [
              DrawerHeader(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:const  [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 40,
                      child:Icon(Icons.person)
                    ),
                 
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(Icons.language, color: Colors.white),
                title: Text(
                  'Language',
                  // style: GoogleFonts.lexend(
                  //   color: Colors.white,
                  //   fontWeight: FontWeight.w400,
                  //   fontSize: 15,
                  // ),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.person, color: Colors.white),
                title: Text(
                  'Personal Information',
                  // style: GoogleFonts.lexend(
                  //   color: Colors.white,
                  //   fontWeight: FontWeight.w400,
                  //   fontSize: 15,
                  // ),
                ),
                onTap: () {
                  Get.to(UserView());
                  // Ajoutez ici la fonctionnalité pour "Personal Information"
                },
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    //controller.logout();
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                    primary: Colors.indigo.withOpacity(0.7),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.person_outline_outlined, color: Colors.white),
                      SizedBox(width: 8.0),
                      Text(
                        'Sign Out',
                       
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
  }
}