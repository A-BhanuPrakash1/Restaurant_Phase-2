import 'package:experimentsflutter/Controllers/HomePage_controller.dart';
import 'package:experimentsflutter/Models/HomePage_model.dart';
import 'package:experimentsflutter/Views/Cart.dart';
import 'package:experimentsflutter/Views/Profile.dart';
import 'package:flutter/material.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF9F9F9),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.blueAccent),
                child: Center(
                  child: Title(
                    color: Colors.white,
                    child: Text(
                      "| ACE BAR |",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              ListTile(
                tileColor: Colors.transparent,
                leading: Icon(Icons.home, color: Colors.blueAccent),
                title: Text("Home"),
                onTap: () {
                  Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (context) => MyHome()));
                },
              ),
              ListTile(
                tileColor: Colors.transparent,
                leading: Icon(Icons.shopping_cart, color: Colors.blueAccent),
                title: Text("Cart"),
                onTap: () {
                  Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (context) => Cart()));
                },
              ),
              ListTile(
                tileColor: Colors.transparent,
                leading: Icon(Icons.person, color: Colors.blueAccent),
                title: Text("Profile"),
                onTap: () {
                  Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (context) => Profile()));
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          animateColor: true,
          centerTitle: true,
          backgroundColor: Colors.blue,

          title: Text(
            "ACE RESTAURANT",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),

        body: GlowingOverscrollIndicator(
          axisDirection: AxisDirection.down,
          color: Colors.lightBlue,
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.1,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.restaurant,
                        color: const Color.fromARGB(255, 239, 161, 59),
                        size: 30,
                      ),
                      Text(
                        "Menu",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.only(bottom: 10, left: 29, right: 29),
                  itemCount: controller.foods.length,
                  itemBuilder: (context, index) {
                    Food food = controller.foods[index];
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: Card(
                        margin: EdgeInsets.all(10),
                        elevation: 25,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: Image.asset(
                                  food.image,
                                  width: MediaQuery.of(context).size.width * 1,
                                  fit: BoxFit.cover,
                                ),
                              ),

                              Text(
                                food.name,
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[800],
                                ),
                              ),
                              Text(
                                "Price: ₹ ${food.price}",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: const Color.fromARGB(
                                    255,
                                    36,
                                    109,
                                    145,
                                  ),
                                ),
                              ),

                              ElevatedButton(
                                onPressed: () {
                                  controller.addToCart(food);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      elevation: 20,
                                      padding: EdgeInsets.all(20),
                                      backgroundColor: const Color.fromARGB(
                                        255,
                                        85,
                                        164,
                                        86,
                                      ),
                                      content: Row(
                                        children: [
                                          Icon(
                                            Icons.check_circle,
                                            color: Colors.white,
                                          ),
                                          Text(
                                            " ${food.name}  Added to Cart !",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: Colors.white,
                                              fontStyle: FontStyle.italic,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      WidgetStatePropertyAll<Color>(
                                        Colors.green,
                                      ),
                                  elevation: WidgetStatePropertyAll<double>(5),
                                  shadowColor: WidgetStatePropertyAll<Color>(
                                    const Color.fromARGB(255, 54, 222, 91),
                                  ),
                                ),
                                child: Text(
                                  "Add to Cart",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 20,
          backgroundColor: Colors.blueAccent,
          selectedItemColor: const Color.fromARGB(255, 243, 172, 150),
          unselectedItemColor: Colors.white,
          currentIndex: 0,
          onTap: (index) {
            switch (index) {
              case 0:
                break;
              case 1:
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => Cart()));
                break;
              case 2:
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => Profile()));
                break;
            }
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: "Cart",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),
      ),
    );
  }
}
