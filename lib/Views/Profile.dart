import 'package:experimentsflutter/Views/Cart.dart';
import 'package:experimentsflutter/Views/Home.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GlowingOverscrollIndicator(
        axisDirection: AxisDirection.down,
        color: Colors.lightBlue,
        child: Scaffold(
          backgroundColor: const Color(0xFFF9F9F9),
          appBar: AppBar(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            leading: Icon(
              Icons.person_2_outlined,
              size: 30,
              color: Colors.white,
            ),
            title: Text(
              "Profile",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.blue,
          ),
          body: ListView(
            children: [
              Icon(Icons.account_circle, size: 130, color: Colors.blueAccent),
              CircleAvatar(radius: 17, child: Icon(Icons.verified)),
              Card(
                child: ListTile(
                  leading: Icon(Icons.person, color: Colors.lightBlue),
                  title: Text("Nikola Tesla"),
                ),
              ),

              Card(
                child: ListTile(
                  leading: Icon(Icons.phone, color: Colors.lightGreen),
                  title: Text("+91 9354674237"),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.mail, color: Colors.redAccent),
                  title: Text("NikolaTesla77@gmail.com"),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.fastfood, color: Colors.orangeAccent),
                  title: Text("Recently Ordered: Biryani"),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.settings, color: Colors.blueGrey),
                  title: Text("Manage Orders"),
                ),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
            elevation: 20,
            backgroundColor: Colors.blueAccent,
            selectedItemColor: const Color.fromARGB(255, 228, 154, 69),
            unselectedItemColor: Colors.white,
            currentIndex: 2,
            onTap: (index) {
              switch (index) {
                case 0:
                  Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (context) => MyHome()));
                  break;
                case 1:
                  Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (context) => Cart()));
                  break;
                case 2:
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
