import 'package:flutter/material.dart';
import 'package:forumapp/models/post_model.dart';
import 'package:google_fonts/google_fonts.dart';

class PostData extends StatelessWidget {
  const PostData({
    super.key,
    required this.post,
  });

  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 100,
      padding: EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            // 'Cymer Denampo',
            post.user!.name!,
            style: GoogleFonts.poppins(),
          ),
          Text(
            // 'cymerdenampo@gmail.com',
            post.user!.email!,
            style: GoogleFonts.poppins(
              fontSize: 10,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            // 'I am a Software Developer, I am a Software Developer, I am a Software Developer, I am a Software Developer, I am a Software Developer, I am a Software Developer, ',
            post.content!,
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.thumb_up),
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.message))
            ],
          ),
        ],
      ),
    );
  }
}
