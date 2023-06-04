import 'package:famili_shop_app/Const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../Size_config.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _nomController = TextEditingController();
  final _usernameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscureText = true;


  void _submitForm() async {
      // Perform registration logic here
      String email = _emailController.text;
      String username = _usernameController.text;
      String firstName = _nomController.text;
      String lastName = _nomController.text;
      String phone = _phoneController.text;
      String password = _passwordController.text;

      try {
        // Prepare the request body
        var requestBody = {
          'email': email,
          'username': username,
          'first_name': firstName,
          'last_name': lastName,
          'phone_number': phone,
          'password': password,
        };

        // Make the registration API call
        var response = await http.post(
          Uri.parse('https://familishop.onrender.com/register'),
          headers: {'Content-Type': 'application/json'},
          body: json.encode(requestBody),
        );

        if (response.statusCode == 200) {
          // Registration successful
          // Clear the form fields
          _emailController.clear();
          _usernameController.clear();
          _nomController.clear();
          _phoneController.clear();
          _passwordController.clear();

          // Show a success message or navigate to the next screen
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Registration successful')),
          );
        } else {
          // Registration failed
          // Display an error message
          print(response.body.toString());
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Registration failed')),
          );
          print(response.statusCode.toString());

        }
      } catch (error) {
        // Error occurred during registration
        print('Registration error: $error');
        // Display an error message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Registration error')),
        );
      }

  }










  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            SizedBox(height: getHeight(15)),
            Center(child: Image.asset('assets/illustrations/logo-Famili-shop 2.png')),
            SizedBox(height: getHeight(62)),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal:getWidth(25) ),
              child: TextFormField(
                controller: _nomController,

                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: getHeight(18),
                  color: Colors.black,
                ),

                cursorColor: const Color(0xFF9DA3B6),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(
                      width: 1,
                      color: Color(0x0ff2f2f2),
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: getHeight(20),
                      horizontal: getWidth(20)),
                  prefixIconConstraints: const BoxConstraints(maxHeight: 25),

                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(34.0),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      )),
                  fillColor:Klight,
                  filled: true,
                  hintText: 'Nom',

                  hintStyle: TextStyle(

                    fontSize: getHeight(12),
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF565555),
                  ),

                ),
              ),
            ),
            SizedBox(height: getHeight(22),),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal:getWidth(25) ),
              child: TextFormField(
                controller: _usernameController,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: getHeight(18),
                  color: Colors.black,
                ),

                cursorColor: const Color(0xFF9DA3B6),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(
                      width: 1,
                      color: Color(0x0ff2f2f2),
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: getHeight(20),
                      horizontal: getWidth(20)),
                  prefixIconConstraints: const BoxConstraints(maxHeight: 25),

                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(34.0),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      )),
                  fillColor:Klight,
                  filled: true,
                  hintText: 'Username',

                  hintStyle: TextStyle(

                    fontSize: getHeight(12),
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF565555),
                  ),

                ),
              ),
            ),
            SizedBox(height: getHeight(22),),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal:getWidth(25) ),
              child: TextFormField(
                controller: _phoneController,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: getHeight(18),
                  color: Colors.black,
                ),

                cursorColor: const Color(0xFF9DA3B6),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(
                      width: 1,
                      color: Color(0x0ff2f2f2),
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: getHeight(20),
                      horizontal: getWidth(20)),
                  prefixIconConstraints: const BoxConstraints(maxHeight: 25),

                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(34.0),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      )),
                  fillColor:Klight,
                  filled: true,
                  hintText: 'phone',

                  hintStyle: TextStyle(

                    fontSize: getHeight(12),
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF565555),
                  ),

                ),
              ),
            ),
            SizedBox(height: getHeight(22),),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal:getWidth(25) ),
              child: TextFormField(
                controller: _emailController,

                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: getHeight(18),
                  color: Colors.black,
                ),

                cursorColor: const Color(0xFF9DA3B6),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(
                      width: 1,
                      color: Color(0x0ff2f2f2),
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: getHeight(20),
                      horizontal: getWidth(20)),
                  prefixIconConstraints: const BoxConstraints(maxHeight: 25),

                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(34.0),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      )),
                  fillColor:Klight,
                  filled: true,
                  hintText: 'Adresse e-mail ou numéro de téléphone portable',

                  hintStyle: TextStyle(

                    fontSize: getHeight(12),
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF565555),
                  ),

                ),
              ),
            ),
            SizedBox(height: getHeight(22),),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal:getWidth(20) ),
              child: TextFormField(
                controller: _passwordController,

                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: getHeight(18),
                  color: Colors.black,
                ),
                obscureText: _obscureText,
                cursorColor: const Color(0xFF9DA3B6),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: const BorderSide(
                        width: 1,
                        color: Color(0x0ff2f2f2),
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: getHeight(20),
                        horizontal: getWidth(20)),
                    prefixIconConstraints: const BoxConstraints(maxHeight: 25),

                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(34.0),
                        borderSide: const BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        )),
                    fillColor:Klight,
                    filled: true,
                    hintText: 'Mot de passe',

                    hintStyle: TextStyle(

                      fontSize: getHeight(12),
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF565555),
                    ),


                    suffixIcon: Padding(
                      padding: EdgeInsets.only(right: getWidth(16)),
                      child: InkWell(
                          onTap: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            })
                            ;
                          },
                          child:_obscureText?
                          const Icon(Icons.visibility_off_outlined)
                              : const Icon(Icons.visibility_outlined)

                      ),
                    )

                ),
              ),
            ),
            SizedBox(height: getHeight(35),),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: getWidth(20)),
              child: InkWell(
                onTap: _submitForm,
                child: Container(
                  height: getHeight(54),
                  width: getWidth(353),
                  decoration: BoxDecoration(
                      color: Kprimary,
                      borderRadius: BorderRadius.circular(getHeight(33))
                  ),
                  child: Center(child:Text('Inscrire!',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: getHeight(16),
                        fontWeight: FontWeight.w600
                    ),
                  )),
                ),
              ),
            ),
            SizedBox(height: getHeight(15),),


            SizedBox(height: getHeight(45),),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: getWidth(20),),
                Padding(
                  padding:  EdgeInsets.only(top: getHeight(8)),
                  child: SvgPicture.asset('assets/icons/Line 40.svg'),
                ),
                SizedBox(width: getWidth(8),),
                Text('Continuer avec',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: getHeight(16)
                  ),
                ),
                SizedBox(width: getWidth(8),),
                Padding(
                  padding:  EdgeInsets.only(top: getHeight(8)),
                  child: SvgPicture.asset('assets/icons/Line 40.svg'),
                ),



              ],
            ),

            SizedBox(height: getHeight(23),),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: getWidth(146),),
                Image.asset('assets/illustrations/facebook 2.png'),
                SizedBox(width: getWidth(24),),
                Image.asset('assets/illustrations/google-logo-9808 1.png')
              ],
            )





          ],

        ),
      ),

    ),);
  }
}

