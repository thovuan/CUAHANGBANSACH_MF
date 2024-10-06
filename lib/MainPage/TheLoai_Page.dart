import 'package:cuahangbansach/Provider/Book_Provider.dart';
import 'package:cuahangbansach/Provider/Category_Provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../EX.dart';
import 'Cart_Page.dart';
import 'Home.dart';
import 'Product_Page.dart';
import 'Search_Page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context) => Category_Provider(),
        child: const CP(data: 0,)),

  );
}

class CP extends StatelessWidget {
  final int data;
  const CP({super.key, required this.data});

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

  // Giá trị mặc định của DropdownButton
  String? _selectedValue;
  String? _NXB_selectedValue;

  // Danh sách các giá trị cho DropdownButton
  final List<String> TLdropdownItems = ['Cổ Tích', 'Truyền Thuyết', 'Nhật Ký', 'Phiêu Lưu'];
  final List<String> NXBdropdownItems = ['Nhà Xuất Bản Kim Đồng', 'Cộng Đồng Cổ Tích Thế Giới', 'Japan Foundation'];

  final TextEditingController _search = TextEditingController();

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
        MaterialPageRoute(builder: (context) => const SearchPage()),
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

  void _searchProduct() {
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
      body: FutureBuilder(
        future: Provider.of<Category_Provider>(context, listen: false).fetchProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.error != null) {
            return const Center(child: Text('Error fetching products'));
          } else {
            return Consumer<Category_Provider>(
              builder: (context, categoryProvider, child) {
                return ListView.builder(
                  itemCount: categoryProvider.tls.length,
                  itemBuilder: (context, index) {
                    final product = categoryProvider.tls[index];
                    return ListTile(
                      title: Text('\$${product.matheloai}'),
                      subtitle: Text('\$${product.tentheloai}'),
                    );
                  },
                );
              },
            );
          }
        },
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
