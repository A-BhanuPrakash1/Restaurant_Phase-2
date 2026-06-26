import 'package:experimentsflutter/Models/HomePage_model.dart';

class FoodController {
  List<Food> foods = [
    Food(
      image: "assets/images/badammilk.jpg",
      name: "Badam Milk :)",
      price: 55.00,
    ),
    Food(image: "assets/images/biryani.png", name: "Biryani", price: 120.00),
    Food(
      image: "assets/images/butterchicken.jpg",
      name: "Butter Chicken",
      price: 249.50,
    ),
    Food(
      image: "assets/images/chickenfrypeacebiryani.jpg",
      name: "Fry Piece Biryani",
      price: 400.00,
    ),
    Food(image: "assets/images/dalfry.jpg", name: "Dal Fry", price: 100.00),
    Food(image: "assets/images/dosa.jpg", name: "Dosa", price: 35.50),
    Food(image: "assets/images/fishfry.jpg", name: "Fish Fry", price: 25.55),
    Food(
      image: "assets/images/gulabjamoon.jpg",
      name: "Gulab Jamoon",
      price: 40.00,
    ),
    Food(image: "assets/images/idly.jpg", name: "Idly", price: 35.50),
    Food(
      image: "assets/images/kajuBiryani.jpg",
      name: "Kaju Biryani",
      price: 355.50,
    ),
    Food(image: "assets/images/mandi.jpg", name: "Mandi", price: 350.50),
    Food(
      image: "assets/images/masaladosa.jpg",
      name: "Masala Dosa",
      price: 65.00,
    ),
    Food(
      image: "assets/images/noodles.jpg",
      name: "Chinese - Noodles",
      price: 90.00,
    ),
    Food(image: "assets/images/pulihora.jpg", name: "Pulihora", price: 150.80),
    Food(
      image: "assets/images/ricewithchicke.jpg",
      name: "Chicken Rice",
      price: 85.50,
    ),
    Food(image: "assets/images/samosa.jpg", name: "Samosa", price: 35.50),
    Food(image: "assets/images/thali.jpg", name: "Thali", price: 358.50),
    Food(image: "assets/images/vada.jpg", name: "Vada", price: 20.50),
  ];
  List<Food> cartItems = [];

  void addToCart(Food food) {
    int index = cartItems.indexWhere((item) => item.name == food.name);
    if (index != -1) {
      cartItems[index].quantity++;
    } else {
      cartItems.add(
        Food(
          image: food.image,
          name: food.name,
          price: food.price,
          quantity: 1,
        ),
      );
    }
  }

  void increamentQuantity(Food food) {
    food.quantity++;
  }

  void decreamentQuantity(Food food) {
    if (food.quantity > 1) {
      food.quantity--;
    }
  }

  double getTotal() {
    double total = 0.0;
    for (var item in cartItems) {
      total += item.price * item.quantity;
    }
    return total;
  }
}

FoodController controller = FoodController();
