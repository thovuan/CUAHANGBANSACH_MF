import 'package:flutter/material.dart';

import '../MainPage/Home.dart';

void main() {
  runApp(const LoginPage());
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CUAHANGBANSACH',
      theme: ThemeData(
        //cc

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Đăng Nhap'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  //tao ra 2 bien controller de dieu khien con tro nhap xuat username, password
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  final String username = 'saninkumi'; //nhap dai username
  final String password = '21dthja1'; //nhap dai password

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();



  void _Login() {
    setState(() {
      if ((_username.text == username) &&  (_password.text == password)) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Login Kanryou'),
            duration: Duration(seconds: 2),
          ),);
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        });

      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Login Shippai'),
            duration: Duration(seconds: 2),
          ),);
      }


    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Form(
        key: _formKey,

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //TextFormField
            TextFormField(controller: _username,
                decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Username', constraints: BoxConstraints(
                    maxWidth: 250, minWidth: 200
                ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Username đang trống';
                  return null;
                }
            ),
            const SizedBox(height: 16,),
            TextFormField(controller: _password,
                decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'password',constraints: BoxConstraints(
                    maxWidth: 250, minWidth: 200),),
                validator: (value){
                  if(value == null || value.isEmpty) return 'Mật khẩu đang để trống';
                  return null;
                }
            ),
            ElevatedButton(onPressed: () {
              if (_formKey.currentState!.validate()) {
                _Login();
              }
            }, child: const Text('Login')),
            const Text('Created by Sannin Kumi'),


          ],
        ),
      ),

    );
  }
}
