import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app_getx/controller/welcome_controller.dart';
class UserDrawer extends StatelessWidget {
  final String accessToken;
  const UserDrawer({super.key, required this.accessToken});

  @override
  Widget build(BuildContext context) {
    WelcomeController welcomeController = Get.put(WelcomeController());
    return Drawer(
      child: Scaffold(
        body: SafeArea(
            child:  Obx(
              ()=> welcomeController.isLoadingUserData.value? const Center(child: CircularProgressIndicator(),):
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(welcomeController.userData!['image']),
                          radius: 30,
                        ),
                        const SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${welcomeController.userData!['firstName']} ${welcomeController.userData!['lastName']}',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700
                              ),
                            ),
                            Text(welcomeController.userData!['email'],
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 60,),
                    const ListTile(
                      leading: Icon(Icons.home, size: 30, color: Colors.grey,),
                      title: Text('Homepage',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey
                        ),
                      ),
                    ),
                    const ListTile(
                      leading: Icon(Icons.search, size: 30, color: Colors.grey,),
                      title: Text('Discover',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey
                        ),
                      ),
                    ),
                    const ListTile(
                      leading: Icon(Icons.shopping_bag_outlined, size: 30, color: Colors.grey,),
                      title: Text('My Order',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey
                        ),
                      ),
                    ),
                    const ListTile(
                      leading: Icon(Icons.person_outlined, size: 30, color: Colors.grey,),
                      title: Text('My profile',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    const ListTile(
                      title: Text('OTHER',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    const ListTile(
                      leading: Icon(Icons.settings, size: 30, color: Colors.grey,),
                      title: Text('Settings',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey
                        ),
                      ),
                    ),
                    const ListTile(
                      leading: Icon(Icons.mail_outline, size: 30, color: Colors.grey,),
                      title: Text('Support',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey
                        ),
                      ),
                    ),
                    const ListTile(
                      leading: Icon(Icons.info_outline, size: 30, color: Colors.grey,),
                      title: Text('About us',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
        ),
      ),
    );
  }
}
