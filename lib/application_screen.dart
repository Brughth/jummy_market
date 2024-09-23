import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace/auth/business_logic/bloc/auth_bloc.dart';
import 'package:marketplace/shared/theme/app_colors.dart';
import 'package:marketplace/shared/utils/utils.dart';

class ApplicationScreen extends StatefulWidget {
  const ApplicationScreen({super.key});

  @override
  State<ApplicationScreen> createState() => _ApplicationScreenState();
}

class _ApplicationScreenState extends State<ApplicationScreen> {
  List<String> imgageTabs = [
    image1,
    image2,
    image3,
  ];

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
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5), shape: BoxShape.circle),
              child: const Icon(
                Icons.close,
                color: Colors.teal,
              ),
            ),
          ),
          actions: [
            Container(
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.only(right: 30),
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.5), shape: BoxShape.circle),
              child: const Icon(
                Icons.heart_broken,
                color: Colors.white,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.only(right: 30),
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.5), shape: BoxShape.circle),
              child: const Icon(
                Icons.more_vert_outlined,
                color: Colors.teal,
              ),
            ),
          ],
        ),
        body: Container(
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: size.height / 1.7,
                      width: size.width,
                      decoration: BoxDecoration(
                        color: Colors.teal,
                        image: DecorationImage(
                            image: AssetImage(
                              imgageTabs[currrentIndex],
                            ),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        height: 80,
                        width: size.width,
                        color: Colors.black.withOpacity(0.5),
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: [
                            SizedBox(
                              height: size.height,
                              width: size.width / 2,
                              child: ListView.builder(
                                itemCount: imgageTabs.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int index) {
                                  String image = imgageTabs[index];
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        currrentIndex = index;
                                      });
                                    },
                                    child: Container(
                                      height: 30,
                                      width: 70,
                                      margin: const EdgeInsets.only(right: 5),
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(19),
                                        ),
                                        image: DecorationImage(
                                          image: AssetImage(image),
                                          fit: BoxFit.cover,
                                        ),
                                        border: Border.all(
                                          color: currrentIndex == index
                                              ? Colors.teal
                                              : Colors.transparent,
                                          width: 2,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "$currrentIndex / ${imgageTabs.length}",
                                    style: const TextStyle(
                                      color: Colors.teal,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Text(
                        "Longline Sleeveless T-Shirt With Dropped Armhole And Print",
                        style: TextStyle(
                            fontSize: 27, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text(
                            'SKU: ',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "INS25",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.teal,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Availability:  ',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            " in stock (30)",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.teal,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: size.width,
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(13)),
                        child: const Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Description ",
                                  style: TextStyle(fontSize: 25),
                                ),
                                Icon(Icons.arrow_back_ios_rounded)
                              ],
                            ),
                            Text(
                                "Nous avons besoin d'un développeur flutter avec minimum 2 ans d'expérience dans la technologie et dès connaissance en reactJS sera un plus. le candidat Nous avons besoin d'un développeur flutter avec minimum 2 ans d'expérience dans la technologie et dès connaissance en reactJS sera un plus. le candidat Nous avons besoin d'un développeur flutter avec minimum 2 ans d'expérience dans la technologie et dès connaissance en reactJS sera un plus. le candidat ...")
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.all(10),
          height: 130,
          width: size.width,
          color: Colors.grey.withOpacity(0.1),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "${24.0}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.teal.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Text(
                            "+",
                            style: TextStyle(color: Colors.teal, fontSize: 30),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Container(
                        width: 70,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Text(
                            "5",
                            style: TextStyle(color: Colors.black, fontSize: 30),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.teal.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Text(
                            "-",
                            style: TextStyle(color: Colors.teal, fontSize: 30),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 3),
                    width: size.width / 2 - 10,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        "BUY NOW",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: size.width / 2 - 30,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                      child: Text(
                        "BUY NOW",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
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
