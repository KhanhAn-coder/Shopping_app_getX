import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app_getx/controller/welcome_controller.dart';
import 'package:get/get.dart';
import 'package:shopping_app_getx/screens/user_drawer.dart';
import 'package:shopping_app_getx/widgets/product_card.dart';
import 'package:shopping_app_getx/widgets/recommend_product_card.dart';

class HomeScreen extends StatefulWidget {
  final String accessToken;
  const HomeScreen({super.key, required this.accessToken});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WelcomeController welcomeController = Get.put(WelcomeController());
  List<String> categories = ['beauty','fragrances','furniture','groceries'];

  void openDrawer(BuildContext context){
    welcomeController.accessToken.value = widget.accessToken;
    welcomeController.fetchUserData();
    Scaffold.of(context).openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('GemStore',
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
        leading: Builder(
          builder: (context) {
            return IconButton(
                onPressed: ()=>openDrawer(context),
                icon: const Icon(Icons.menu)
            );
          }
        ),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.notifications))
        ],
      ),
      body: Obx(
        ()=> SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0).copyWith(bottom: 0),
                child: SizedBox(
                  height: 100,
                  width: size.width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                      itemBuilder: (context,index){
                        if(categories[index] == 'beauty'){
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: GestureDetector(
                              onTap: () {
                                welcomeController.selectCategory(categories[index]);
                                welcomeController.fetchProducts();
                              },
                              child: CircleAvatar(
                                backgroundColor: welcomeController.selectedCategory == categories[index]? Colors.black: Colors.grey,
                                radius: 30,
                                child: const Icon(Icons.girl, size: 40,color: Colors.white,),
                              ),
                            ),
                          );
                        }else if(categories[index] == 'fragrances'){
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: GestureDetector(
                              onTap: () {
                                welcomeController.selectCategory(categories[index]);
                                welcomeController.fetchProducts();
                              },
                              child: CircleAvatar(
                                backgroundColor: welcomeController.selectedCategory == categories[index]? Colors.black: Colors.grey,
                                radius: 30,
                                child: const Icon(Icons.ac_unit, size: 40, color: Colors.white,),
                              ),
                            ),
                          );
                        }else if(categories[index] == 'furniture'){
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: GestureDetector(
                              onTap: () {
                                welcomeController.selectCategory(categories[index]);
                                welcomeController.fetchProducts();
                              },
                              child: CircleAvatar(
                                backgroundColor: welcomeController.selectedCategory == categories[index]? Colors.black: Colors.grey,
                                radius: 30,
                                child: const Icon(Icons.chair, size: 40, color: Colors.white,),
                              ),
                            ),
                          );
                        }else if(categories[index] == 'groceries'){
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: GestureDetector(
                              onTap: (){
                                welcomeController.selectCategory(categories[index]);
                                welcomeController.fetchProducts();
                              },
                              child: CircleAvatar(
                                backgroundColor: welcomeController.selectedCategory == categories[index]? Colors.black: Colors.grey,
                                radius: 30,
                                child: const Icon(Icons.local_grocery_store, size: 40, color: Colors.white,),
                              ),
                            ),
                          );
                        }
                      }
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  width: double.infinity,
                  height: 190,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/select2022.png'),
                      fit: BoxFit.cover
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                ),
              ),
              const SizedBox(height: 30,),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Featured Products',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                    Text('Show all',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 400,
                child: welcomeController.isLoadingData.value? const Center(child: CircularProgressIndicator(),) : ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: welcomeController.welcome?.products.length,
                    itemBuilder: (context, index){
                    final product = welcomeController.welcome!.products[index];
                      return ProductCard(product: product);
                    }
                ),
              ),
              const SizedBox(height: 30,),
              Container(
                width: double.infinity,
                height: 190,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/newCollection.png'),
                    fit: BoxFit.cover
                  ),
                ),
              ),
              const SizedBox(height: 30,),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Recommended',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                    Text('Show all',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SizedBox(
                  height: 80,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: welcomeController.welcome?.products.length,
                      itemBuilder: (context, index){
                        return RecommendProductCard(product: welcomeController.welcome!.products[index]);
                      }
                  ),
                ),
              ),
              const SizedBox(height: 30,),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Top Collection',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                    Text('Show all',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  width: double.infinity,
                  height: 180,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/sale40.png'),
                          fit: BoxFit.cover
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
              ),
              const SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  width: double.infinity,
                  height: 250,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/summner2021.png'),
                        fit: BoxFit.cover
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
              ),
              const SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        width: 150,
                        height: 200,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/tshirt.png'),
                              fit: BoxFit.cover
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        width: 160,
                        height: 200,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/dress.png'),
                              fit: BoxFit.cover
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
        drawer: UserDrawer(accessToken: widget.accessToken),
        bottomNavigationBar:  CupertinoTabBar(
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home, size: 35 ,),
                label: ''
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search, size: 35 ,),
                  label: ''
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_bag, size: 35 ,),
                  label: ''
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person,  size: 35 ,),
                  label: ''
              )
          ],
          currentIndex: 0,
        ),
    );
  }
}
