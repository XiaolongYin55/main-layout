
import 'package:flutter/material.dart';
import 'package:ui_assgn01/pages/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwdController = TextEditingController();
  
  String _selected = 'User';
  bool _checked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
        centerTitle: true,
        backgroundColor: Colors.black45,
      ),
      body: Column(
        children: [
          Container(
            height: 100, width: 400,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(color: Colors.black26),
            child: const Text('Welcome to UI Assign App'),
          ),
          TextField(
              controller: _usernameController,
              decoration: InputDecoration(label: Text('Username')),
          ),
          TextField(
            controller: _passwdController,
            decoration: InputDecoration(label: Text('Password')),
          ),
          DropdownButton<String>(
            value: _selected,
            items: const[
              DropdownMenuItem(value: 'User', child: Text('login as User')),
              DropdownMenuItem(value: 'Admin', child: Text('Login as Admin')),
            ],
            onChanged: (v) => setState(()=> _selected = v!),
          ),
          CheckboxMenuButton(value: _checked, 
          onChanged: (v) => setState(()=> _checked = v!),
          child: const Text('Make sure already read!')),
          ElevatedButton(onPressed: ()=>Navigator.push(context, 
          MaterialPageRoute(builder: (context)=>HomeBody())), 
          child: Text('Login'))
        ]
      ),
    );
  }
}