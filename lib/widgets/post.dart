import 'package:flutter/material.dart';
import 'package:woof_project/models/models.dart';

class Post extends StatelessWidget {
  const Post({required this.data});
  final PostData data;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Header(postTime: "now", postUser: data.owner),
          PostImage(
            image: data.getPostImage(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            child: Text(data.getPostText()),
          ),
          PostInteraction(),
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({required this.postUser, required this.postTime});
  // the header needs the name of the user the time stamp of the post
  // and the image of the post owner
  final User postUser;
  final String postTime;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(""),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            children: [Text(postUser.name), Text(postTime)],
          ),
          Spacer(),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz))
        ],
      ),
    );
  }
}

class PostImage extends StatelessWidget {
  const PostImage({required this.image});
  final Image image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 300,
      child: image,
    );
  }
}

class PostInteraction extends StatelessWidget {
  const PostInteraction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.favorite_outline),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.chat_bubble_outline),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.bookmark_outline),
          ),
        ],
      ),
    );
  }
}
