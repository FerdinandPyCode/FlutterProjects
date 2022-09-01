import 'package:e_commerce_apps/app_theme.dart';
import 'package:e_commerce_apps/src/models/sushi_model.dart';
import 'package:e_commerce_apps/src/views/oder_view.dart';
import 'package:flutter/material.dart';

class HomeTopSushiView extends StatelessWidget {
  HomeTopSushiView({Key? key}) : super(key: key);
  final List<SushiModel> sushi = SushiModel.list;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      physics: const ClampingScrollPhysics(),
      itemCount: sushi.length,
      itemBuilder: ((context, index) {
        bool flag = index % 2 != 0;
        return GestureDetector(
          onTap: (() {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => OrderView(selected: sushi[index])));
          }),
          child: SizedBox(
            width: 200,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              color: flag ? AppTheme.bgColor : AppTheme.darkColor,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        sushi[index].image,
                      ),
                      const Expanded(child: SizedBox.shrink()),
                      Text(
                        sushi[index].title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: flag ? AppTheme.darkColor : Colors.white,
                        ),
                      ),
                      Text(sushi[index].desc,
                          style: TextStyle(
                            color: flag
                                ? AppTheme.darkColor.withAlpha(100)
                                : Colors.white.withAlpha(100),
                          )),
                      Row(
                        children: [
                          Text.rich(
                            const TextSpan(
                              text: "\$",
                              children: [
                                TextSpan(
                                  text: "6.00",
                                  style: TextStyle(
                                    fontSize: 24,
                                  ),
                                ),
                              ],
                            ),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: flag ? AppTheme.darkColor : Colors.white,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Expanded(
                            child: TextButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  flag
                                      ? AppTheme.darkColor
                                      : Colors.white.withAlpha(100),
                                ),
                                shape:
                                    MaterialStateProperty.all<OutlinedBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50))),
                              ),
                              onPressed: () {},
                              child: const Text("Order",
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ),
                        ],
                      )
                    ]),
              ),
            ),
          ),
        );
      }),
    );
  }
}
