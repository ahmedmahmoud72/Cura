import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../layout/App_layout.dart';
import '../../models/chat_model.dart';
import '../../shared/components/general_components.dart';
import '../../shared/components/widgets/chat_buble.dart';
import '../../shared/constants.dart';

class ChatPage extends StatelessWidget {
  static String id = 'ChatPage';
  final _controller = ScrollController();
  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessagesCollections);
  TextEditingController controller = TextEditingController();

  ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    String email = 'ahmedmahmoudyahia72@gmail.com';
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy(kCreatedAt, descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Message> messagesList = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            messagesList.add(Message.fromJson(snapshot.data!.docs[i]));
          }

          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              titleSpacing: 0.0,
              title: Transform(
                transform: Matrix4.translationValues(-50.0, 0.0, 0.0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        navigateTo(context, const AppLayout());
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Stack(children: [
                        const CircleAvatar(
                          radius: 25.0,
                          backgroundImage:
                              AssetImage('assets/images/doctor.jpg'),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: Container(
                            width: 10.0,
                            height: 10.0,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ]),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ahmed Mahmoud',
                          style: GoogleFonts.notoSans().copyWith(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Online',
                          style: GoogleFonts.notoSans()
                              .copyWith(color: Colors.grey, fontSize: 13.0),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      reverse: true,
                      controller: _controller,
                      itemCount: messagesList.length,
                      itemBuilder: (context, index) {
                        return messagesList[index].id == email
                            ? ChatBuble(
                                message: messagesList[index],
                              )
                            : ChatBubleForFriend(message: messagesList[index]);
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    controller: controller,
                    onSubmitted: (data) {
                      messages.add(
                        {
                          kMessage: data,
                          kCreatedAt: DateTime.now(),
                          'id': email
                        },
                      );
                      controller.clear();
                      _controller.animateTo(0,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn);
                    },
                    decoration: InputDecoration(
                      hintText: 'Send Message',
                      suffixIcon: Icon(
                        Icons.send,
                        color: AppColors.mainColor,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                          color: AppColors.mainColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
