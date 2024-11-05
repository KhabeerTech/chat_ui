import 'package:chat_ui/model/user.dart';
import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    List<ChatMessage> messages = [
      ChatMessage(
          messageContent: "pulni qachon berasan", messageType: "receiver"),
      ChatMessage(messageContent: "alo", messageType: "receiver"),
      ChatMessage(messageContent: "nima deysan", messageType: "sender"),
      ChatMessage(messageContent: "pulni  ber", messageType: "receiver"),
      ChatMessage(
          messageContent: "aka uka ortasida qarz bolmaydi",
          messageType: "sender"),
    ];
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.only(right: 16),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
                SizedBox(width: 2),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/user1.jpeg'),
                  maxRadius: 20,
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Roziqov Firdavs",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        "Online",
                        style: TextStyle(
                          color: Colors.blue.shade400,
                          fontSize: 13,
                        ),
                      )
                    ],
                  ),
                ),
                Icon(
                  Icons.settings,
                  color: Colors.black54,
                )
              ],
            ),
          ),
        ),
      ),
      body: content(messages),
    );
  }

  Widget content(List<ChatMessage> message) {
    return Stack(
      children: [
        ListView.builder(
            itemCount: message.length,
            itemBuilder: ((context, index) {
              return Container(
                padding:
                    EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
                child: Align(
                  alignment: message[index].messageType == "receiver"
                      ? Alignment.topLeft
                      : Alignment.topRight,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: (message[index].messageType == "receiver")
                          ? Colors.grey.shade200
                          : Colors.blue[200],
                    ),
                    padding: EdgeInsets.all(16),
                    child: Text(
                      message[index].messageContent,
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
              );
            })),
        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
            height: 60,
            width: double.infinity,
            color: Colors.white,
            child: Row(
              children: [
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Write message...",
                        hintStyle: TextStyle(color: Colors.black54),
                        border: InputBorder.none),
                  ),
                ),
                SizedBox(width: 15),
                FloatingActionButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.send,
                    color: Colors.white,
                    size: 18,
                  ),
                  backgroundColor: Colors.blue,
                  elevation: 0,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
//15.28