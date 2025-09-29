import 'package:flutter/material.dart';
import 'package:latihan_kuis_124230078/screens/home_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = "";
  String password = "";
  bool isLoginSuccess = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      //safeArea digunain agar tidak terhalang icon di poni.
      child: Scaffold(
        backgroundColor: const Color(0xFF1E3A8A).withOpacity(0.05),
        // appBar: AppBar(
        //   title: Text("LOGIN PAGE"),
        //   backgroundColor: Colors.deepPurple,
        // ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/login.png'),
            SizedBox(height: 20),
            Text(
              "Login untuk mengakses lebih banyak fitur.",
              style: TextStyle(color: Color(0xFF1E3A8A)),
            ),
            SizedBox(height: 20),
            _usernameField(),
            _passwordField(),
            _loginButton(context),
          ],
        ),
      ),
    );
  }

  Widget _usernameField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        enabled: true,
        onChanged: (value) {
          username = value;
        },
        decoration: InputDecoration(
          hintText: 'Username',
          contentPadding: EdgeInsets.all(8.0),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: Color(0xFF1E3A8A)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: Color(0xFFFF4081), width: 2),
          ),
        ),
      ),
    );
  }

  Widget _passwordField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        enabled: true,
        onChanged: (value) {
          password = value;
        },
        obscureText: true,
        decoration: InputDecoration(
          hintText: 'Password',
          contentPadding: EdgeInsets.all(8.0),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: Color(0xFF1E3A8A)), // Resistance Blue
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: Color(0xFFFF4081), width: 2),
          ),
        ),
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: (isLoginSuccess)
              ? const Color(0xFF4CAF50) // Hero Green
              : const Color(0xFFFF4081), // Brave Pink
        ),
        onPressed: () {
          String text = "";
          
          if (username == "fulan" && password == "fulan") {
             Text(
            text,
            style: TextStyle(
              color: isLoginSuccess ? Colors.green : Colors.red,
              fontWeight: FontWeight.bold,
            ),
          );
            setState(() {
              text = "Login sukses";
              isLoginSuccess = true;
            });
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return HomePage(username: username);
                },
              ),
            );
          } else {
            setState(() {
              text = "Login gagal";
              isLoginSuccess = false;
            }
            );
          }
          SnackBar snackBar = SnackBar(content: Text(text));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: Text('login'),
      ),
    );
  }
}
