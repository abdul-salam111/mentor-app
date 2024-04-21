import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mentor_app/app/commonWidgets/manoropeFontFamily.dart';
import 'package:mentor_app/app/commonWidgets/textfield.dart';
import 'package:mentor_app/app/models/authModels/getMenteeInfo.dart';
import 'package:mentor_app/app/models/mentor/getMentorInfor.dart';
import 'package:mentor_app/app/modules/Mentee/messages/views/messages_view.dart';
import 'package:mentor_app/app/modules/chats/messagesModel.dart';
import 'package:mentor_app/app/resources/alignments.dart';
import 'package:mentor_app/app/resources/colors.dart';
import 'package:mentor_app/app/resources/icons.dart';
import 'package:mentor_app/app/resources/paddings.dart';
import 'package:mentor_app/app/routes/app_pages.dart';
import 'package:mentor_app/app/storage/keys.dart';
import 'package:mentor_app/app/storage/storage.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zego_zimkit/zego_zimkit.dart';

import '../controllers/chats_controller.dart';

class ChatsView extends GetView<ChatsController> {
  const ChatsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(ChatsController());
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back)),
          title: Text(
            'All Messages',
            style: GoogleFonts.manrope(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: const Color(0xff656466)),
          ),
          centerTitle: false,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                customSearchTextField(hinttext: "Search"),
                10.heightBox,
                StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('chatsCollection')
                        .where('userIds',
                            arrayContains: StorageServices.to.getString(userId))
                        .snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (!snapshot.hasData) {
                        return const SizedBox.shrink();
                      }
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            MessageModel messageModel = MessageModel.fromJson(
                                snapshot.data!.docs[index]);
                            bool usesender = messageModel.recievedById ==
                                StorageServices.to.getString(userId);

                            return GestureDetector(
                              onTap: () {
                              
                          //       var chatRoomId = controller.chatRoomId(
                          //           recieverId: !usesender
                          //                         ? messageModel.recievedById.toString()
                          //                         : messageModel.sendbyId.toString(),
                          //           senderId: StorageServices.to
                          //               .getString(userId)
                          //               .toString());
                          //  print(chatRoomId);
                                Get.to(
                                    () => MessagesView(
                                          gofromChat: true,
                                          recId: !usesender
                                                  ? messageModel.recievedById
                                                  : messageModel.sendbyId,
                                                  recName: !usesender
                                                  ? messageModel.recievedByName
                                                  : messageModel.sendbyName,
                                        ),
                                    arguments: [
                                      snapshot.data!.docs[index],
                                      snapshot.data!.docs[index].id
                                    ]);
                              },
                              child: Row(
                                mainAxisAlignment: mainbetween,
                                children: [
                                  CircleAvatar(
                                    radius: 24.r,
                                    backgroundImage: const AssetImage(mentor),
                                  ),
                                  SizedBox(
                                    width: 200.w,
                                    child: Column(
                                      crossAxisAlignment: crosstart,
                                      children: [
                                        Text(
                                          usesender
                                              ? messageModel.sendbyName!
                                              : messageModel.recievedByName!,
                                          style: manoropeFontFamily(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w500,
                                              color: blackcolor),
                                        ),
                                        3.heightBox,
                                        Text(
                                          snapshot.data!.docs[index]
                                              ['lastMessage'],
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: manoropeFontFamily(
                                              fontSize: 11.sp,
                                              fontWeight: FontWeight.w500,
                                              color: const Color(0xff656466)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        DateFormat.jm().format(DateTime.parse(
                                            snapshot.data!.docs[index]
                                                ['createdAt'])),
                                        style: manoropeFontFamily(
                                            fontSize: 11.sp,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xff656466)),
                                      ),
                                      // SizedBox(
                                      //   child: Text(
                                      //     "5",
                                      //     style: manoropeFontFamily(
                                      //         fontSize: 10.sp,
                                      //         fontWeight: FontWeight.w500,
                                      //         color: Colors.white),
                                      //   ),
                                      // )
                                      //     .box
                                      //     .color(darkBrownColor)
                                      //     .padding(defaultpad)
                                      //     .roundedFull
                                      //     .make()
                                    ],
                                  )
                                ],
                              )
                                  .box
                                  .padding(pad14)
                                  .margin(const EdgeInsets.only(top: 10))
                                  .rounded
                                  .border(color: textfieldgrey.withOpacity(0.2))
                                  .make(),
                            );
                          });
                    })
              ],
            ),
          ),
        ));
  }
}
