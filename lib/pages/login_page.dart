import 'package:crm_ui/pages/home_page.dart';
import 'package:crm_ui/pages/signup_page.dart';
import 'package:flutter/material.dart';

class LoginFormPage extends StatefulWidget {
  const LoginFormPage({super.key});

  @override
  State<LoginFormPage> createState() => _LoginFormPageState();
}

class _LoginFormPageState extends State<LoginFormPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _password = '';

  void _signUp() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => SignUpPage(),
      ),
    );
  }

  void _login() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      _usernameController.clear();
      _passwordController.clear();
      print('Username: $_username');
      print('Password: $_password');

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(email: _username, password: _password),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Center(
              child: Column(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'images/person_icon.png',
                        height: 150,
                        width: 150,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Welcome',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Column(
                          children: [
                            TextFormField(
                              controller: _usernameController,
                              decoration: InputDecoration(
                                labelText: 'Email',
                                border: OutlineInputBorder(),
                              ),
                              onChanged: (username) => {
                                setState(() {
                                  _username = username;
                                }),
                              },
                              validator: (username) {
                                if (username == null || username.isEmpty) {
                                  return 'Please enter email';
                                }
                                return null;
                              },
                              onSaved: (username) {
                                _username = username ?? '';
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: _passwordController,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                border: OutlineInputBorder(),
                              ),
                              obscureText: true,
                              onChanged: (password) => {
                                setState(() {
                                  _password = password;
                                }),
                              },
                              validator: (password) {
                                if (password == null || password.isEmpty) {
                                  return 'Please enter password';
                                }
                                return null;
                              },
                              onSaved: (password) {
                                _password = password ?? '';
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: _login,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.lightBlue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            child: Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Forgot Password',
                          style: TextStyle(
                            color: Colors.blue[900],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Does not have account?',
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.blue[900],
                              ),
                              onPressed: _signUp,
                              child: Text('Signup'),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Divider(
                                  thickness: 1,
                                  color: Colors.grey), // Left line
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text('OR',
                                  style: TextStyle(
                                      fontSize: 10)), // Text in the center
                            ),
                            Expanded(
                              child: Divider(
                                  thickness: 1,
                                  color: Colors.grey), // Right line
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('images/google_icon.png'),
                                SizedBox(width: 10),
                                Text(
                                  'Sign Up with Google',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
