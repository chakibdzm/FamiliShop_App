
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
  return token ?? '';
}

Future<void> destroy() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('loginToken');
  await prefs.setBool('isLoggedIn', false);
}


Future<Map<String, dynamic>> fetchUserData() async {
  const url = 'https://familishop.onrender.com/user';
  final token = await getToken();
  final response = await http.get(
    Uri.parse(url),
    headers: {
      'Authorization': 'Bearer $token',
    },
  );

  if (response.statusCode == 200) {

    return json.decode(response.body);

  } else {
    throw Exception('Failed to fetch user data');
  }
}



Future<List<Map<String, dynamic>>> fetchPanier() async {
  const url = 'https://familishop.onrender.com/panier/';
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







Future<void> postOrderWithAddress(String token, String address) async {
  const url = 'https://familishop.onrender.com/ordering/';

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
  } else {
  }
}












































































