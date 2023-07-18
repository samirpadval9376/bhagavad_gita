import 'package:flutter/material.dart';
import 'package:json_app/controllers/json_controller.dart';
import 'package:json_app/modals/json_modals.dart';
import 'package:provider/provider.dart';

class ChapterPage extends StatelessWidget {
  const ChapterPage({super.key});

  @override
  Widget build(BuildContext context) {
    int ind = ModalRoute.of(context)!.settings.arguments as int;
    Size s = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: Text(
          "Chapter :- ${ind + 1}",
          style: const TextStyle(
            fontSize: 22,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.deepPurple.shade900,
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Consumer<JsonController>(builder: (context, pro, child) {
          JsonModals verse = pro.allData[ind];
          return pro.allData.isNotEmpty
              ? ListView.builder(
                  itemCount:
                      verse.chapter_id == ind + 1 ? pro.allData.length : null,
                  itemBuilder: (context, index) {
                    JsonModals verse1 = pro.allData[index];
                    return verse1.chapter_id == ind + 1
                        ? Card(
                            child: Container(
                              padding: EdgeInsets.only(
                                left: 10,
                              ),
                              height: s.height * 0.3,
                              width: s.width,
                              decoration: BoxDecoration(
                                color: Colors.deepPurple.shade900,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Spacer(),
                                  Text(
                                    "|| ${verse1.verse_number} ||",
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  const Spacer(
                                    flex: 3,
                                  ),
                                  Text(
                                    verse1.text,
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  const Spacer(
                                    flex: 5,
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Container();
                  },
                )
              : Center(
                  child: CircularProgressIndicator(
                    color: Colors.deepPurple.shade900,
                  ),
                );
        }),
      ),
    );
  }
}
