import 'package:flutter/material.dart';

import '../EX.dart';
import 'Cart_Page.dart';
import 'Home.dart';
import 'Product_Page.dart';

void main() {
  runApp(const CT_CartPage(data: 0,));
}

class CT_CartPage extends StatelessWidget {
  final int data;
  const CT_CartPage({super.key, required this.data});

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
      home: MyHomePage(title: 'Chi tiết Giỏ Hàng', initialIndex: data,),
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
        MaterialPageRoute(builder: (context) => const HomePage(data: 0)),);
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

  void _CTCP() {
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
      body: ListView.builder(

          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
                leading: Image.asset('assets/images/hutech.jpg', width:100, height: 80),

                title: Text("Sách số ${items[index]}"),
                subtitle: Text("Mô tả ngắn gọn sách số ${items[index]}"),
                trailing: IconButton(onPressed: _CTCP, icon: const Icon(Icons.import_contacts),)
            );
          }
        //_widgetOptions.elementAt(_selectedIndex),

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
        currentIndex: _selectedIndex ?? 3,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey, // Đảm bảo icon không bị trùng màu với nền
        backgroundColor: Colors.white, // Màu nền cho thanh điều hướng
        onTap: _onItemTapped,

      ),

    );
  }
}


