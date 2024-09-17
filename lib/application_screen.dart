import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace/auth/business_logic/bloc/auth_bloc.dart';
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
          const HomeApplication(),
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

class HomeApplication extends StatefulWidget {
  const HomeApplication({
    super.key,
  });

  @override
  State<HomeApplication> createState() => _HomeApplicationState();
}

class _HomeApplicationState extends State<HomeApplication> {
  List<CategoryModel> categorys = [
    CategoryModel(id: 1, name: "Fruit"),
    CategoryModel(id: 2, name: "Banane"),
    CategoryModel(id: 3, name: "Chaussure"),
    CategoryModel(id: 4, name: "Location vehicule"),
    CategoryModel(id: 5, name: "Location Chaussure"),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
              height: 50,
              width: MediaQuery.sizeOf(context).width,
              padding: const EdgeInsets.all(5),
              child: ListView.builder(
                itemCount: categorys.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  CategoryModel categoryItem = categorys[index];
                  return Container(
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.only(right: 10),
                    decoration: const BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.all(
                        Radius.circular(18),
                      ),
                    ),
                    child: Text(categoryItem.name),
                  );
                },
              )),
        ],
      ),
    );
  }
}

class CategoryModel {
  final String name;
  final int id;

  CategoryModel({required this.id, required this.name});
}
