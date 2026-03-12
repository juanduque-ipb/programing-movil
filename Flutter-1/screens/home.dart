import 'package:card/screens/widgets/description_widget.dart';
import 'package:card/screens/widgets/image_widget.dart';
import 'package:card/screens/widgets/title_widget.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TitleWidget(title: "Naranja"),
          ImageWidget(
              url:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS12-VjkK6CVWxTgVKG8sYTAi1bIreKSoq91A&s"),
          DescriptionWidget(
            description: "Esto es una naranja muy sabrosa!!!",
          )
        ],
      ),
    );
  }
}
