import 'package:flutter/material.dart';

import '../MainPage/Home.dart';

void main() {
  runApp(const SearchPage());
}

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

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
      home: const MyHomePage(title: 'Trang Tim Kiem'),
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
  final TextEditingController _search = TextEditingController();
  //final TextEditingController _password = TextEditingController();

  //final String username = 'saninkumi'; //nhap dai username
  //final String password = '21dthja1'; //nhap dai password

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();



  void _Search() {
    setState(() {


    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(
        key: _formKey,

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //TextFormField
            TextFormField(controller: _search,
                decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Tìm kiem', constraints: BoxConstraints(
                    maxWidth: 250, minWidth: 200
                ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Khung Search đang trống';
                  return null;
                }
            ),
            const SizedBox(height: 16,),

            ElevatedButton(onPressed: () {
              if (_formKey.currentState!.validate()) {
                _Search();
              }
            }, child: const Text('Tim Kiem')),
            const Text('Created by Sannin Kumi'),


          ],
        ),
      ),

    );
  }
}
