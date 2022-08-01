import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  const SideBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SizedBox(
            height: 30,
          ),
          UserHeader(),
          FeaturePanel(),
          SettingButton(
            text: "Contact Us",
          ),
          SettingButton(
            text: "Privacy Policy",
          ),
          SettingButton(
            text: "Log Out",
            color: Colors.red,
          )
        ],
      ),
    );
  }
}

class UserHeader extends StatelessWidget {
  const UserHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage("images/retriever.jpg"),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text("Sydney"),
              Text(
                "Sydney.Idundun@gmail.com",
                style: TextStyle(color: Colors.green),
              ),
            ],
          ),
          IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.close,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}

// Feature List, with buttons like the saved Post, Resources and others
class FeaturePanel extends StatelessWidget {
  const FeaturePanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: 15),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SettingButton(
            text: "Saved Post",
          ),
          SettingButton(
            text: "Resources",
            newInfo: 2,
          ),
        ],
      ),
    );
  }
}

// this is for the regular settings buttons
class SettingButton extends StatefulWidget {
  const SettingButton(
      {required this.text,
      this.color = Colors.black,
      this.action,
      this.newInfo = 0});
  final String text;
  final Color color;
  final VoidCallback? action;
  final int newInfo;

  @override
  State<SettingButton> createState() => _SettingButtonState();
}

class _SettingButtonState extends State<SettingButton> {
  bool newInfoAvailable() {
    if (widget.newInfo > 0) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (widget.action != null) ? widget.action : () {},
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
            child: Text(
              widget.text,
              style: TextStyle(color: widget.color),
            ),
          ),
          Spacer(),
          newInfoAvailable()
              ? Container(
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(15)),
                  margin: EdgeInsets.only(right: 20),
                  padding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                  child: Text(
                    "${widget.newInfo} new",
                    style: TextStyle(color: Colors.white70),
                  ),
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
