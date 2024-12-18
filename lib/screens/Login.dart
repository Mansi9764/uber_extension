import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uber_final/screens/home_page.dart';
import 'package:uber_final/screens/sign_up.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                decoration: BoxDecoration( 
                  image: DecorationImage(
                    image: AssetImage("assets/images/map.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 60),
                Image.asset('assets/images/ChauffeurX_logo2.jpg', height: 150),
                SizedBox(height: 20),
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold, // Make label text bold
                      fontSize: 16, // Increase font size
                      color: Colors.black, // Change label text color
                    ),
                    border: OutlineInputBorder(), // Add a border to the input field
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold, // Make label text bold
                      fontSize: 16, // Increase font size
                      color: Colors.black, // Change label text color
                    ),
                    border: OutlineInputBorder(), // Add a border to the input field
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: _login,
                  child: Text('Login'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
                  },
                  child: Text('No account? Sign up here'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


// class LoginScreen extends StatefulWidget {
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   bool isEmailLogin = true; // To toggle between phone and email login

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//             width: MediaQuery.of(context).size.width, // Ensures full width coverage
//             height: MediaQuery.of(context).size.height, // Ensures full height coverage
//             child: ImageFiltered(
//               imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
//               child: Image.asset(
//                 'assets/images/map.jpg', // Your background image path
//                 fit: BoxFit.cover, // Ensures the image covers the whole container
//               ),
//             ),
//           ),
//           SingleChildScrollView(
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 SizedBox(height: MediaQuery.of(context).size.height * 0.1),
//                 Text('Welcome Back', textAlign: TextAlign.center, style: GoogleFonts.lato(fontSize: 28, fontWeight: FontWeight.bold)),
//                 SizedBox(height: 8),
//                 Text('Sign in to continue', textAlign: TextAlign.center, style: GoogleFonts.lato(fontSize: 16)),
//                 SizedBox(height: 30),
//                 _buildLoginMethodSwitch(),
//                 SizedBox(height: 20),
//                 if (isEmailLogin) _buildEmailTextField(),
//                 if (!isEmailLogin) _buildPhoneTextField(),
//                 _buildPasswordTextField(),
//                 SizedBox(height: 20),
//                 _loginButton(),
//                 SizedBox(height: 20),
//                 Text('Or continue with', textAlign: TextAlign.center),
//                 SizedBox(height: 20),
//                 _buildSocialButtons(),
//                 SizedBox(height: 20),
//                 _buildSignUpOption(),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// Widget _buildSignUpOption() {
//     return Center(
//       child: TextButton(
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => SignUpScreen()), // Navigate to Sign Up Screen
//           );
//         },
//         child: Text('New to ChauffeurX? Sign Up'),
//       ),
//     );
//   }

//   Widget _buildLoginMethodSwitch() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         ChoiceChip(
//           label: Text('Phone'),
//           selected: !isEmailLogin,
//           onSelected: (selected) {
//             setState(() {
//               isEmailLogin = !selected;
//             });
//           },
//         ),
//         SizedBox(width: 10),
//         ChoiceChip(
//           label: Text('Email'),
//           selected: isEmailLogin,
//           onSelected: (selected) {
//             setState(() {
//               isEmailLogin = selected;
//             });
//           },
//         ),
//       ],
//     );
//   }

//   Widget _buildEmailTextField() {
//     return TextField(
//       controller: _emailController,
//       keyboardType: TextInputType.emailAddress,
//       decoration: InputDecoration(
//         labelText: 'Email',
//         prefixIcon: Icon(Icons.email),
//         border: OutlineInputBorder(),
//       ),
//     );
//   }

//   Widget _buildPhoneTextField() {
//     return TextField(
//       controller: _emailController,
//       keyboardType: TextInputType.phone,
//       decoration: InputDecoration(
//         labelText: 'Phone Number',
//         prefixIcon: Icon(Icons.phone),
//         border: OutlineInputBorder(),
//       ),
//     );
//   }

//   Widget _buildPasswordTextField() {
//     return TextField(
//       controller: _passwordController,
//       obscureText: true,
//       decoration: InputDecoration(
//         labelText: 'Password',
//         prefixIcon: Icon(Icons.lock),
//         border: OutlineInputBorder(),
//       ),
//     );
//   }

//   Widget _loginButton() {
//     return ElevatedButton(
//       onPressed: () { Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
// },
//       child: Text('Login'),
//       style: ElevatedButton.styleFrom(
//         backgroundColor: Colors.black,
//         padding: EdgeInsets.symmetric(vertical: 12),
//       ),
//     );
//   }

//   Widget _buildSocialButtons() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         IconButton(icon: Icon(Icons.add), onPressed: () {}), // Google logo here
//         IconButton(icon: Icon(Icons.apple), onPressed: () {}), // Apple logo here
//       ],
//     );
//   }

  
// }
