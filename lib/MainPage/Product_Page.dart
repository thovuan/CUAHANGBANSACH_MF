import 'package:flutter/material.dart';

import '../EX.dart';
import 'Cart_Page.dart';
import 'Home.dart';

void main() {
  runApp(const ProductPage(data: 0,));
}

class ProductPage extends StatelessWidget {
  final int data;
  const ProductPage({super.key, required this.data});

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
      home: MyHomePage(title: 'Kho Sách', initialIndex: data,),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final int initialIndex;
  const MyHomePage({super.key, required this.title, required this.initialIndex});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int? _selectedIndex;
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
      'Index 2: Profile',
      style: optionStyle,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex; // Gán giá trị initialIndex cho _selectedIndex
  }

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
        MaterialPageRoute(builder: (context) => const HomePage(data : 0)),);
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ProductPage(data: 2)),
      );
    }
    else if (index == 3) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const CartPage(data: 3)),);
    }

  }





  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,),
          itemCount: 4,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            margin: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(child: Image.asset('assets/images/hutech.jpg', width:100, height: 80), ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Hello World',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                const Padding(padding: EdgeInsets.all(8.0),
                child: Text('良い本物です', style: TextStyle(fontSize: 12),),
               )
              ],

            ),

          );
        },

        //child: _widgetOptions.elementAt(_selectedIndex),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomNavigationBar(
        items: const<BottomNavigationBarItem> [
          BottomNavigationBarItem(icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.search),
            label: 'Search',),
          BottomNavigationBarItem(icon: Icon(Icons.shop_rounded),
              label: 'Product'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: 'Cart'),
        ],
        currentIndex: _selectedIndex ?? 2,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey, // Đảm bảo icon không bị trùng màu với nền
        backgroundColor: Colors.white, // Màu nền cho thanh điều hướng
        onTap: _onItemTapped,

      ),

    );
  }
}
