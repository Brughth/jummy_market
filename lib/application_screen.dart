import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace/cart/business_logic/cubit/cart_cubit.dart';
import 'package:marketplace/cart/presentation/cart_screen.dart';
import 'package:marketplace/home_screen.dart';
import 'package:marketplace/shared/theme/app_colors.dart';
import 'package:badges/badges.dart' as badges;

class ApplicationScreen extends StatefulWidget {
  const ApplicationScreen({super.key});

  @override
  State<ApplicationScreen> createState() => _ApplicationScreenState();
}

class _ApplicationScreenState extends State<ApplicationScreen> {
  int currrentIndex = 0;
  PageController pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // return const CounterScreen();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 2.0,
        title: const Text("Market"),
        actions: [
          BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.only(right: 48.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CartPage(),
                      ),
                    );
                  },
                  child: badges.Badge(
                    badgeContent: Text(
                      '${state.products.length}',
                    ),
                    child: const Icon(
                      Icons.shopping_cart,
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
      body: PageView(
        controller: pageController,
        children: [
          const HomeScreen(),
          Container(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            color: Colors.blue,
          ),
          Container(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            color: Colors.amber,
          )
        ],
      ),
      //  Center(
      //   child: Text(
      //       // "${context.read<AuthBloc>().state.user?.firstName}",
      //       "userName "),
      // ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currrentIndex,
        onTap: (value) {
          setState(() {
            currrentIndex = value;
          });
          pageController.jumpToPage(value);
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "Products",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          )
        ],
      ),
    );
  }
}
