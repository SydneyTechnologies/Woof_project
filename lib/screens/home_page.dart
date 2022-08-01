// ignore_for_file: use_key_in_widget_constructors, avoid_unnecessary_containers

import 'package:flutter/foundation.dart';
import "package:flutter/material.dart";
import 'package:woof_project/models/models.dart';
import 'package:woof_project/widgets/post.dart';
import 'package:woof_project/widgets/navigation_bar.dart';
import 'package:woof_project/widgets/side_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const TabBar(
            tabs: [
              Tab(
                child: Text("COMMUNITY"),
              ),
              Tab(
                child: Text("DISCOVER"),
              ),
            ],
            unselectedLabelColor: Colors.grey,
            indicatorWeight: 5,
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications_none_outlined,
                  color: Colors.grey,
                ))
          ],
        ),
        // content of the tabs ----TAB VIEWS
        body: const TabBarView(
          children: [CommunityFeed(), DiscoverFeed()],
        ),

        //APP DRAWER
        drawer: Drawer(
          backgroundColor: Colors.grey.shade100,
          child: SideBar(),
        ),

        // FLOATING ACTION BUTTON
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 30,
          ),
          backgroundColor: Colors.brown.shade900,
        ),
        bottomNavigationBar: BottonNavBar(),
      ),
    );
  }
}

class CommunityFeed extends StatelessWidget {
  const CommunityFeed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, AsyncSnapshot posts) {
        if (posts.hasData == false) {
          if (kDebugMode) {
            print("not showing");
          }
          return Container();
        } else {
          return ListView.builder(
            itemCount: posts.data?.length,
            itemBuilder: ((context, index) {
              return Post(data: posts.data[index]);
            }),
          );
        }
      },
      future: Utils().GenerateFakeData(100),
    );
    // return ListView.builder(
    //     itemCount: 100,
    //     itemBuilder: ((context, index) {
    //       return Post(data: Utils().GenerateFakeData());
    //     })
    //     Column(
    // children: [
    //   // WoofNotification(
    //   //   title: "WELCOME TO WOOF",
    //   //   message: "You can start enjoying great pet news, stories, and photos",
    //   // ),

    //   ),
    // ],
  }
}

class DiscoverFeed extends StatelessWidget {
  const DiscoverFeed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Discover Feed"),
    );
  }
}

class WoofNotification extends StatefulWidget {
  const WoofNotification({
    required this.title,
    required this.message,
  });
  final String title;
  final String message;

  @override
  State<WoofNotification> createState() => _WoofNotificationState();
}

class _WoofNotificationState extends State<WoofNotification> {
  // this widget will be responsible for displaying notification at the top

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  bool active = true;
  void disableNotification() {
    setState(() {
      active = false;
    });
    print(active);
  }

  @override
  Widget build(BuildContext context) {
    return active
        ? Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      padding: EdgeInsets.symmetric(vertical: 2),
                      constraints: BoxConstraints(),
                      onPressed: disableNotification,
                      icon: Icon(
                        Icons.close,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Text(
                        widget.title,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        widget.message,
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        : SizedBox.shrink();
  }
}
