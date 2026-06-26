import 'package:experimentsflutter/Controllers/HomePage_controller.dart';
import 'package:experimentsflutter/Models/HomePage_model.dart';
import 'package:experimentsflutter/Views/Home.dart';
import 'package:experimentsflutter/Views/Profile.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GlowingOverscrollIndicator(
        axisDirection: AxisDirection.down,
        color: Colors.lightBlue,
        child: Scaffold(
          backgroundColor: const Color(0xFFF9F9F9),
          appBar: AppBar(
            title: Text(
              "Cart",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.blue,
            leading: Icon(Icons.shopping_cart, color: Colors.white),
          ),

          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: controller.cartItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    Food item = controller.cartItems[index];
                    return Card(
                      elevation: 10,
                      color: Colors.white,
                      child: ListTile(
                        leading: SizedBox(
                          width: 80,
                          height: double.infinity,
                          child: Image.asset(item.image, fit: BoxFit.cover),
                        ),
                        title: Text(item.name),
                        subtitle: Text(
                          "Price: ₹ ${item.price}",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromARGB(255, 36, 109, 145),
                          ),
                        ),
                        trailing: Container(
                          decoration: BoxDecoration(
                            color: Colors.lightBlueAccent,
                            borderRadius: BorderRadius.all(Radius.circular(35)),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    controller.decreamentQuantity(item);
                                  });
                                },
                                icon: Icon(Icons.remove, color: Colors.white),
                              ),
                              Text(
                                "${item.quantity}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                  color: Colors.black,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    controller.increamentQuantity(item);
                                  });
                                },
                                icon: Icon(Icons.add, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Total Bill: ",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        Text(
                          "Items in the Cart: ${(controller.cartItems.length)}",
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "₹ ${controller.getTotal()}",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        Text(
                          "*inclusive of all taxes",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Container(
                margin: const EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 0.075,
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.lightBlueAccent,
                        content: Text(
                          "Successfully Checked Out!",
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll<Color>(
                      Colors.greenAccent,
                    ),
                  ),
                  child: Text(
                    "Check-Out",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),

          bottomNavigationBar: BottomNavigationBar(
            elevation: 20,
            backgroundColor: Colors.blueAccent,
            selectedItemColor: const Color.fromARGB(255, 237, 158, 134),
            unselectedItemColor: Colors.white,
            currentIndex: 1,
            onTap: (index) {
              switch (index) {
                case 0:
                  Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (context) => MyHome()));
                  break;
                case 1:
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
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Profile",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
