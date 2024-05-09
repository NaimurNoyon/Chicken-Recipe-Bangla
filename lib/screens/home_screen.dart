import 'package:chicken_recipe_bangla/utils/recipes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,

          ),
          itemCount: recipes.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                      child: Image.asset(
                          recipes[index]["image"]
                      )
                  ),
                  Expanded(
                      child: Center(
                          child: Text(
                              recipes[index]["name"],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16
                            ),
                          ),
                      ),
                  ),
                ],
              ),
            );
          },
        ),
    );
  }
}
