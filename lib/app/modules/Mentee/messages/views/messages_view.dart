import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentor_app/app/commonWidgets/manoropeFontFamily.dart';
import 'package:mentor_app/app/modules/chats/messagesModel.dart';
import 'package:mentor_app/app/resources/alignments.dart';
import 'package:mentor_app/app/resources/icons.dart';
import 'package:mentor_app/app/resources/paddings.dart';
import 'package:mentor_app/app/storage/keys.dart';
import 'package:mentor_app/app/storage/storage.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

import '../../../../resources/colors.dart';
import '../controllers/messages_controller.dart';

// ignore: must_be_immutable
class MessagesView extends GetView<MessagesController> {
  MessagesView({Key? key, this.gofromChat,this.recId,this.recName}) : super(key: key);
  bool? gofromChat = false;
  String?recId;
  String?recName;
  @override
  Widget build(BuildContext context) {
    Get.put(MessagesController());
    var data = Get.arguments[0];
    var chatRoomId = Get.arguments[1];
  
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back)),
        title: Row(children: [
          Text(
            "Welcome",
            style: manoropeFontFamily(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: blackcolor),
          ),
          2.widthBox,
          Text(
           gofromChat==true?recName!: data['fullName'].toString(),
            style: manoropeFontFamily(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: darkBrownColor),
          )
        ]),
        centerTitle: true,
        actions: [
          ZegoSendCallInvitationButton(
            buttonSize: const Size(50, 20),
            padding: EdgeInsets.zero,
            margin: EdgeInsets.zero,
            isVideoCall: true,
            iconSize: Size(
              20.h,
              20.w,
            ),
            icon: ButtonIcon(
              icon: Image.asset(
                videocalling,
              ),
            ),
            invitees: [
              ZegoUIKitUser(
                id:   gofromChat==true?recId!:data['id'].toString(),
                name:   gofromChat==true?recName!: data['fullName'].toString(),
              ),
            ],
          ),
          ZegoSendCallInvitationButton(
            buttonSize: const Size(50, 20),
            padding: EdgeInsets.zero,
            margin: EdgeInsets.zero,
            isVideoCall: false,
            iconSize: Size(
              20.h,
              20.w,
            ),
            icon: ButtonIcon(
              icon: Image.asset(
                audiocalling,
              ),
            ),
            invitees: [
              ZegoUIKitUser(
                id:   gofromChat==true?recId!:data['id'].toString(),
                name:   gofromChat==true?recName!: data['fullName'].toString(),
              ),
            ],
          ),
          Image.asset(
            verticalmenu,
            height: 15,
            width: 20,
          ),
          10.widthBox,
        ],
      ),
      body: Column(
        children: <Widget>[
          StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('chatsCollection')
                  .doc(chatRoomId)
                  .collection('messageCollection')
                  .orderBy("createdAt", descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child:  CircularProgressIndicator());
                }
                final messages = snapshot.data?.docs;
                if (messages == null || messages.isEmpty) {
                  return const Center(child: Text("No messages"));
                }
                return Expanded(
                  child: ListView.builder(
                    reverse: true, // Start from the bottom
                    itemCount: snapshot.data!.docs.length,

                    itemBuilder: (context, index) {
                      MessageModel messageModel =
                          MessageModel.fromJson(messages[index]);

                      return Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8, bottom: 10),
                          child: Column(
                            children: [
                              // index == 0
                              //     ? Text(
                              //         "Today",
                              //         style: GoogleFonts.lato(
                              //             fontSize: 12.sp,
                              //             color: const Color(0xff656466)),
                              //       )
                              //     : Text(
                              //         "Wed 22 June",
                              //         style: GoogleFonts.lato(
                              //             fontSize: 12.sp,
                              //             color: const Color(0xff656466)),
                              //       ),
                              10.heightBox,
                              Row(
                                mainAxisAlignment: messageModel.sendbyId ==
                                        StorageServices.to
                                            .getString(userId)
                                            .toString()
                                    ? mainend
                                    : mainstart,
                                children: [
                                  messageModel.sendbyId !=
                                          StorageServices.to
                                              .getString(userId)
                                              .toString()
                                      ? CircleAvatar(
                                          radius: 20.r,
                                          backgroundImage:
                                              const AssetImage(mentor),
                                        )
                                      : const SizedBox.shrink(),
                                  10.widthBox,
                                  Container(
                                    padding: pad14,
                                    decoration: BoxDecoration(
                                      color: messageModel.sendbyId ==
                                              StorageServices.to
                                                  .getString(userId)
                                                  .toString()
                                          ? const Color(0xffE1D1FA)
                                          : const Color(0xffA4DCF4),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20.r),
                                          topRight: Radius.circular(20.r),
                                          bottomRight: messageModel.sendbyId !=
                                                  StorageServices.to
                                                      .getString(userId)
                                                      .toString()
                                              ? Radius.circular(20.r)
                                              : const Radius.circular(0),
                                          bottomLeft: messageModel.sendbyId ==
                                                  StorageServices.to
                                                      .getString(userId)
                                                      .toString()
                                              ? Radius.circular(20.r)
                                              : const Radius.circular(0)),
                                    ),
                                    constraints: BoxConstraints(
                                      maxWidth:
                                          MediaQuery.of(context).size.width *
                                              0.6,
                                    ),
                                    child: Text(
                                      messageModel.lastMessage.toString(),
                                      style: GoogleFonts.lato(
                                          fontSize: 12.sp, color: blackcolor),
                                    ),
                                  ),
                                  10.widthBox,
                                  messageModel.sendbyId ==
                                          StorageServices.to
                                              .getString(userId)
                                              .toString()
                                      ? CircleAvatar(
                                          radius: 20.r,
                                          backgroundImage:
                                              const AssetImage(mentor),
                                        )
                                      : const SizedBox.shrink(),
                                ],
                              ),
                            ],
                          ));
                    },
                  ),
                );
              }),
          Obx(
            () => controller.ismobileNumber.value
                ? Text(
                    '@ WARNING dont share phone number or personal informations',
                    style: manoropeFontFamily(
                        fontSize: 7.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xffFF0000)),
                  )
                : const SizedBox.shrink(),
          ),
          5.heightBox,
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 30),
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: darkestBrownColor,
                  child: Image.asset(attactFile),
                ),
                10.widthBox,
                Expanded(
                  child: TextField(
                    controller: controller.messageController.value,
                    onChanged: (value) {
                      if (value.contains(RegExp(r'\b\d{10}\b'))) {
                        controller.ismobileNumber.value = false;
                      }
                    },
                    cursorHeight: 20.h,
                    style: manoropeFontFamily(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: textfieldgrey),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          borderSide: BorderSide(
                              color: greyColor.withOpacity(0.5), width: 2)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          borderSide:
                              BorderSide(color: greyColor.withOpacity(0.5))),
                      border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          borderSide:
                              BorderSide(color: greyColor.withOpacity(0.5))),
                      hintText: 'Enter your message',
                      hintStyle: manoropeFontFamily(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: textfieldgrey),
                      contentPadding:
                          const EdgeInsets.only(left: 10, bottom: 5, top: 5),
                    ),
                  ),
                ),
                10.widthBox,
                GestureDetector(
                  onTap: () {
                    if(controller.messageController.value.text.isNotEmpty){
                      controller.sendMessages(
                        recievedById:  gofromChat==true?recId!:data['id'].toString(),
                        recievedByName:  gofromChat==true?recName!: data['fullName'].toString(),
                        message: controller.messageController.value.text,
                        chatRoomId: chatRoomId).then((value){
                          controller.messageController.value.clear();
                        });
                    }
                  },
                  child: CircleAvatar(
                    backgroundColor: darkestBrownColor,
                    child: Image.asset(
                      sendmessage,
                      color: whitecolor,
                      width: 20,
                      height: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
