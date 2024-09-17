import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace/auth/business_logic/bloc/auth_bloc.dart';
import 'package:marketplace/home_screen.dart';
import 'package:marketplace/shared/theme/app_colors.dart';

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
