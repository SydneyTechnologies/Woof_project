// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Utils {
  List<String> names = [
    "Micheal",
    "John",
    "Britteny",
    "Morbius",
    "Halo",
    "Sheldon",
    "Amy",
    "Ralph",
    "Ngozi",
    "Maya",
    "Miracle",
    "Ore",
    "Steven"
  ];

  String getRandomName() {
    String result = names[Random().nextInt(names.length)];
    return result;
  }

  Future<String> getDogImage() async {
    String imageUrl;
    final response =
        await http.get(Uri.parse('https://dog.ceo/api/breeds/image/random'));
    if (response.statusCode == 200) {
      imageUrl = jsonDecode(response.body)['message'];
      return imageUrl;
    } else {
      return "https://images.unsplash.com/photo-1598875706250-21faaf804361?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1442&q=80";
    }
  }

  Future<List<PostData>> GenerateFakeData(int number) async {
    List<PostData> posts = [];
    for (int j = 0; j < number; j++) {
      String name = getRandomName();
      int numberOfLikes = Random().nextInt(10);
      List<User> likeList = [];
      for (int i = 0; i < numberOfLikes; i++) {
        User randomUser = User(
          name: getRandomName(),
          imageUrl: "https://picsum.photos/200/300?random=2",
        );
        likeList.add(randomUser);
      }
      User owner =
          User(name: name, imageUrl: "https://picsum.photos/200/300?random=2");

      PostData result = PostData(
        owner: owner,
        postText: "random post text",
        imageUrl: await getDogImage(),
      );
      result.addLikeTest(likeList);
      posts.add(result);
    }

    return posts;
  }
}

class User {
  User({required this.name, this.imageUrl});
  String name;
  String? imageUrl;
  List<PostData> savedPost = [];
  Image getUserImage() {
    if (imageUrl != null) {
      print(imageUrl);
      return Image.network(imageUrl!);
    } else {
      return Image.asset("images/default.jpg");
    }
  }

  void savePost(PostData post) {
    if (!savedPost.contains(post)) {
      savedPost.add(post);
    }
  }
}

class PostData {
  PostData({required this.owner, this.postText, this.imageUrl});
  User owner;
  String? imageUrl;
  String? postText;

  Image getPostImage() {
    if (imageUrl != null) {
      return Image.network(imageUrl!);
    } else {
      return Image.asset("images/default.jpg");
    }
  }

  String getPostText() {
    if (postText != null) {
      return postText!;
    } else {
      return "";
    }
  }

  List<User> likes = [];
  List<Comment> comments = [];

  void addLike(User user) {
    if (!likes.contains(user)) {
      likes.add(user);
    }
  }

  void addLikeTest(List<User> users) {
    likes.addAll(users);
  }

  void addComment(Comment comment) {
    if (!comments.contains(comment)) {
      comments.add(comment);
    }
  }

  void addCommentTest(List<Comment> comments) {
    this.comments.addAll(comments);
  }
}

class Comment {
  Comment({required this.owner, required this.commentText});
  User owner;
  String commentText;
}
