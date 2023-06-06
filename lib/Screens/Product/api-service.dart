import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

Future<Map<String, dynamic>> fetchData(int idprod) async {
  final response = await http.get(Uri.parse('https://familishop.onrender.com/products/$idprod/'));

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to fetch data');
  }
}
Future<void> saveToken(String token) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('loginToken', token);
}

Future<String> getToken() async {
  final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('loginToken');
  return token ?? ''; // Return an empty string if the token is null
}



Future<Map<String, dynamic>> fetchUserData() async {
  final url = 'https://familishop.onrender.com/user';
  final token = await getToken(); // Replace with your actual Bearer token
  final response = await http.get(
    Uri.parse(url),
    headers: {
      'Authorization': 'Bearer $token',
    },
  );

  if (response.statusCode == 200) {
    print(json.decode(response.body).toString());

    return json.decode(response.body);

  } else {
    throw Exception('Failed to fetch user data');
  }
}



Future<List<Map<String, dynamic>>> fetchPanier() async {
  final url = 'https://familishop.onrender.com/panier/';
  final token = await getToken();

  final response = await http.get(Uri.parse(url),
    headers: {
    'Authorization': 'Bearer $token',
    },

  );

  if (response.statusCode == 200) {
    final List<dynamic> responseData = json.decode(response.body);
    final List<Map<String, dynamic>> products = responseData.map((item) => Map<String, dynamic>.from(item)).toList();
    return products;
  } else {
    throw Exception('Failed to fetch products');
  }
}


Future<void> postProductToCart(int productId, int quantity, String token) async {
  final url = 'https://familishop.onrender.com/panier_add/';
  final token = await getToken();
  final Map<String, dynamic> body = {
    'product_id': productId,
    'quantity': quantity,
  };

  final response = await http.post(
    Uri.parse(url),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    },
    body: json.encode(body),
  );

  if (response.statusCode == 201) {
    print('Product added to cart successfully');
  } else {
    print('Failed to add product to cart');
  }
}

Future<void> deleteProductFromCart(int productId, String token) async {
  final url = 'https://familishop.onrender.com/panier_remove/$productId/';

  final response = await http.delete(
    Uri.parse(url),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    },
  );

  if (response.statusCode == 204) {
    print('Product deleted from cart successfully');
  } else {
    print('Failed to delete product from cart');
  }
}


Future<void> postOrderWithAddress(String token, String address) async {
  final url = 'https://familishop.onrender.com/ordering/';

  final Map<String, dynamic> body = {
    'address': address,
  };

  final response = await http.post(
    Uri.parse(url),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    },
    body: json.encode(body),
  );

  if (response.statusCode == 201) {
    print('Order placed successfully');
  } else {
    print('Failed to place order');
  }
}