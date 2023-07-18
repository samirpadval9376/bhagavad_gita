import 'package:flutter/material.dart';
import 'package:json_app/controllers/json_controller.dart';
import 'package:json_app/modals/json_modals.dart';
import 'package:json_app/utils/my_page_route.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Bhagavad Gita",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple.shade900,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Consumer<JsonController>(
          builder: (context, provider, child) {
            return ListView.builder(
                itemCount: 18,
                itemBuilder: (context, index) {
                  return Card(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          MyPageRoute.chapterPage,
                          arguments: index,
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.only(
                          left: 20,
                        ),
                        height: s.height * 0.08,
                        width: s.width,
                        decoration: BoxDecoration(
                          color: Colors.deepPurple.shade900,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Chapter :- ${index + 1}",
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  );
                });
          },
        ),
      ),
    );
  }
}
