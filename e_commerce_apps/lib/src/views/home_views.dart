import 'package:e_commerce_apps/app_theme.dart';
import 'package:e_commerce_apps/my_flutter_app_icons.dart';
import 'package:e_commerce_apps/src/views/home_top_sushi_view.dart';
import 'package:e_commerce_apps/src/views/widgets/circle_button_widget.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppTheme.bgColor,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 12, left: 12),
                child: CircleButtonWidget(
                  child: Icon(Icons.menu),
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        "👋 Hi, Angle!",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        "What is your favourite sushi ?",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    buildSearch(),
                    const SizedBox(
                      height: 12,
                    ),
                    buildHeader("Categories", (() {})),
                    const SizedBox(
                      height: 12,
                    ),
                    buildCategories(),
                    const SizedBox(
                      height: 32,
                    ),
                    buildHeader("Top Sushi", () {}),
                    const SizedBox(
                      height: 12,
                    ),
                    SizedBox(height: 300, child: HomeTopSushiView()),
                    const SizedBox(
                      height: 12,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Widget buildHeader(String title, VoidCallback ontap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
          InkWell(
            onTap: ontap,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("See All"),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSearch() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: TextField(
            decoration: InputDecoration(border: InputBorder.none),
          ),
        ),
      ),
    );
  }

  Widget buildCategories() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildCircleButtonWidget(MyFlutterApp.salmon, "Salmon"),
          buildCircleButtonWidget(MyFlutterApp.caviar, "Caviar"),
          buildCircleButtonWidget(MyFlutterApp.rice, "Rice"),
          buildCircleButtonWidget(MyFlutterApp.tentacles, "Octopus"),
          buildCircleButtonWidget(MyFlutterApp.prawn, "Shrimp"),
        ],
      ),
    );
  }

  Column buildCircleButtonWidget(IconData icon, String title) {
    return Column(
      children: [
        CircleButtonWidget(
          child: Icon(icon),
        ),
        const SizedBox(
          height: 12,
        ),
        Text(title),
      ],
    );
  }
}
