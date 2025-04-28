import 'package:get/get.dart';

import 'widgets/post_field.dart';
import 'package:flutter/material.dart';
import 'package:forumapp/views/widgets/post_data.dart';
import 'package:forumapp/controller/post_controller.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PostController _postController = Get.put(PostController());
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final box = GetStorage();
    // var token = box.read('token');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Forum App', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PostField(
                hintText: 'What do you want to ask?',
                controller: _textController,
              ),
              // const SizedBox(
              //   height: 20,
              // ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 10,
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  'Post',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text('Post'),
              const SizedBox(
                height: 20,
              ),
              Obx(() {
                return _postController.isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _postController.posts.value.length,
                        itemBuilder: (context, index) {
                          return PostData(
                            post: _postController.posts.value[index],
                          );
                        },
                      );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
