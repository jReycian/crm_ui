import 'package:crm_ui/main.dart';
import 'package:crm_ui/pages/home_page.dart';
import 'package:crm_ui/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _birthdateController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  late String _firstName;
  late String _lastName;
  late String _email;
  late String _birthdate;
  late String _phone;
  late String _password;
  late String _confirmPassword;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        _birthdateController.text =
            DateFormat('dd-MMM-yyyy').format(pickedDate);
      });
    }
  }

  void _signUp(BuildContext context) {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      _firstNameController.clear();
      _lastNameController.clear();
      _emailController.clear();
      _phoneController.clear();
      _birthdateController.clear();
      _confirmPasswordController.clear();
      _passwordController.clear();
      // _textFieldController();

      print('Firstname: $_firstName');
      print('Lastname: $_lastName');
      print('Email: $_email');
      print('Birthdate: $_birthdate');
      print('Phone Number: $_phone');
      print('Password: $_password');

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text("Registered Successfully!"),
          backgroundColor: Colors.green,
          duration: const Duration(seconds: 3),
        ),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginFormPage(),
        ),
      );
    }
  }

  void _login(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginFormPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/signup_icon.png',
                  height: 80,
                  width: 80,
                ),
                SizedBox(height: 10),
                Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 12,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _firstNameController,
                        decoration: InputDecoration(
                          labelText: 'First Name',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        ),
                        onChanged: (firstname) => {
                          setState(() {
                            _firstName = firstname;
                          }),
                        },
                        validator: (firstname) {
                          if (firstname == null || firstname.isEmpty) {
                            return 'Please Enter Firstname';
                          }
                          return null;
                        },
                        onSaved: (firstname) {
                          _firstName = firstname ?? '';
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _lastNameController,
                        decoration: InputDecoration(
                          labelText: 'Last Name',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        ),
                        onChanged: (lastname) => {
                          setState(() {
                            _lastName = lastname;
                          }),
                        },
                        validator: (lastname) {
                          if (lastname == null || lastname.isEmpty) {
                            return 'Please Enter Lastname';
                          }
                          return null;
                        },
                        onSaved: (lastname) {
                          _lastName = lastname ?? '';
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        ),
                        onChanged: (email) => {
                          setState(() {
                            _email = email;
                          }),
                        },
                        validator: (email) {
                          if (email == null || email.isEmpty) {
                            return 'Please Enter Lastname';
                          }
                          return null;
                        },
                        onSaved: (email) {
                          _email = email ?? '';
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _birthdateController,
                        decoration: InputDecoration(
                          labelText: 'Birth date',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        ),
                        readOnly: true,
                        onTap: () => _selectDate(context),
                        onChanged: (birthdate) => {
                          setState(() {
                            _birthdate = birthdate;
                          }),
                        },
                        validator: (birthdate) {
                          if (birthdate == null || birthdate.isEmpty) {
                            return 'Please Enter Birthdate';
                          }
                          return null;
                        },
                        onSaved: (birthdate) {
                          _birthdate = birthdate ?? '';
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _phoneController,
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        ),
                        onChanged: (phone) => {
                          setState(() {
                            _phone = phone;
                          }),
                        },
                        validator: (phone) {
                          if (phone == null || phone.isEmpty) {
                            return 'Please Enter Phone number';
                          }
                          return null;
                        },
                        onSaved: (phone) {
                          _phone = phone ?? '';
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
                          contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        ),
                        obscureText: true,
                        onChanged: (password) => {
                          setState(() {
                            _password = password;
                          }),
                        },
                        validator: (password) {
                          if (password == null || password.isEmpty) {
                            return 'Please Enter Password';
                          }
                          return null;
                        },
                        onSaved: (password) {
                          _password = password ?? '';
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _confirmPasswordController,
                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        ),
                        obscureText: true,
                        onChanged: (confirmPassword) => {
                          setState(() {
                            _confirmPassword = confirmPassword;
                          }),
                        },
                        validator: (confirmPassword) {
                          if (confirmPassword == null ||
                              confirmPassword.isEmpty) {
                            return 'Please Enter Password';
                          } else if (_password != _confirmPassword) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: const Text("Password do not match!"),
                                backgroundColor: Colors.red[600],
                                duration: const Duration(seconds: 3),
                              ),
                            );
                            return "";
                          }
                          return null;
                        },
                        onSaved: (confirmPassword) {
                          _confirmPassword = confirmPassword ?? '';
                        },
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () => _signUp(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightBlue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account?',
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.blue[900],
                            ),
                            onPressed: () => _login(context),
                            child: Text('Login'),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Divider(
                                thickness: 1, color: Colors.grey), // Left line
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
                                thickness: 1, color: Colors.grey), // Right line
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
    );
  }
}
