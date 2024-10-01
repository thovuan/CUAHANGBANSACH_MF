import 'package:cuahangbansach/MainPage/Product_Page.dart';
import 'package:flutter/material.dart';

import '../EX.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        //cc

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'CUAHANGBANSACH'),
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
  int _selectedIndex = 0;
  final List<String> items = List<String>.generate(10, (index) => "${index+1}");
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[


    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Search',
      style: optionStyle,
    ),
    Text(
      'Index 2: Product',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Điều hướng sang trang khác
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const EX()),
      );}
      else if (index == 0) {
        Navigator.push(context,
          MaterialPageRoute(builder: (context) => const HomePage()),);

    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ProductPage()),
      );
    }
  
  }





  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: ListView.builder(

          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Image.asset('assets/images/hutech.jpg', width:100, height: 80),

              title: Text("Bài viết số ${items[index]}"),
              subtitle: Text("Mô tả ngắn gọn bài viết số ${items[index]}"),
              trailing: const Icon(Icons.import_contacts),
            );
          }
        //_widgetOptions.elementAt(_selectedIndex),

      ),


      bottomNavigationBar: BottomNavigationBar(
          items: const<BottomNavigationBarItem> [
            BottomNavigationBarItem(icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.search),
            label: 'Search',),
            BottomNavigationBarItem(icon: Icon(Icons.person),
            label: 'Profile'),
          ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,

      ),

    );
  }
}
