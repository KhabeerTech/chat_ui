import 'package:chat_ui/conversation.dart';
import 'package:chat_ui/model/user.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey.shade600,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: "Chats",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group_work),
            label: "Channels",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: "Profile",
          ),
        ],
      ),
      body: content(),
    );
  }

  Widget content() {
    List<ChatUsers> chatUser = [
      ChatUsers(
          name: "Roziqov Firdavs",
          imageURL: "assets/user1.jpeg",
          time: "Now",
          messageText: "Awesome Setup"),
      ChatUsers(
          name: "...",
          imageURL: "assets/user6.jpeg",
          time: "Now",
          messageText: "salom"),
      ChatUsers(
          name: "❤️Oyijonim",
          imageURL: "assets/user5.jpeg",
          time: "yesterday",
          messageText: "qachon qaytasan"),
      ChatUsers(
          name: "Sardor",
          imageURL: "assets/user2.jpeg",
          time: "Now",
          messageText: "hello!"),
      ChatUsers(
          name: "Abduvohid",
          imageURL: "assets/user4.jpeg",
          time: "111 years ald",
          messageText: "qalay"),
      ChatUsers(
          name: "farhod 2",
          imageURL: "assets/user1.jpeg",
          time: "Now",
          messageText: "qalay"),
    ];
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(right: 16, left: 16, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Flutter Chat",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    height: 30,
                    decoration: BoxDecoration(
                        color: Colors.pink[50],
                        borderRadius: BorderRadius.circular(30)),
                    padding:
                        EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 2),
                    child: Row(
                      children: [
                        Icon(
                          Icons.add,
                          color: Colors.pinkAccent,
                          size: 20,
                        ),
                        SizedBox(width: 2),
                        Text(
                          "Add New",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 16),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Search...",
                  hintStyle: TextStyle(color: Colors.grey.shade600),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey.shade600,
                    size: 20,
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  contentPadding: EdgeInsets.all(8),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.grey.shade100))),
            ),
          ),
          ListView.builder(
            itemCount: chatUser.length,
            shrinkWrap: true,
            padding: EdgeInsets.only(top: 16),
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: (() => Navigator.of(context).pushNamed('/chat')),
                child: ConversationList(
                  name: chatUser[index].name,
                  messagesText: chatUser[index].messageText,
                  imageURL: chatUser[index].imageURL,
                  isMessageRead: (index == 0 || index == 3) ? true : false,
                  time: chatUser[index].time,
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
