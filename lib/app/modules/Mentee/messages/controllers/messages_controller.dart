import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mentor_app/app/models/authModels/getMenteeInfo.dart';
import 'package:mentor_app/app/models/mentor/getMentorInfor.dart';
import 'package:mentor_app/app/modules/chats/messagesModel.dart';
import 'package:mentor_app/app/storage/keys.dart';
import 'package:mentor_app/app/storage/storage.dart';

class MessagesController extends GetxController {
  var ismobileNumber = false.obs;
  final messageController = TextEditingController().obs;
  final firestore = FirebaseFirestore.instance;
  Future sendMessages(
      {required String recievedById,
      required String recievedByName,
      required String message,
      required String chatRoomId,
      required String recImage}) async {
    try {
      await firestore
          .collection('chatsCollection')
          .doc(chatRoomId)
          .set(
            MessageModel(
              userIds: [
                StorageServices.to.getString(selectedUserType) == "Mentee"
                    ? getMenteeInfoFromJson(
                            StorageServices.to.getString(getmenteeinfo))
                        .email
                    : getMentorInfoFromJson(StorageServices.to
                            .getString(getMentorInformationsss))
                        .email,
                recievedById
              ],
              recievedByProfilePicture: recImage,
              sendByProfilePicture: StorageServices.to
                          .getString(selectedUserType) ==
                      "Mentee"
                  ? getMenteeInfoFromJson(
                          StorageServices.to.getString(getmenteeinfo))
                      .profilePicUrl
                  : getMentorInfoFromJson(
                          StorageServices.to.getString(getMentorInformationsss))
                      .profilePicUrl,
              recievedById: recievedById,
              recievedByName: recievedByName,
              sendbyId: StorageServices.to.getString(selectedUserType) ==
                      "Mentee"
                  ? getMenteeInfoFromJson(
                          StorageServices.to.getString(getmenteeinfo))
                      .email
                  : getMentorInfoFromJson(
                          StorageServices.to.getString(getMentorInformationsss))
                      .email,
              lastMessage: message,
              createdAt: DateTime.now().toString(),
              sendbyName: StorageServices.to.getString(selectedUserType) ==
                      "Mentee"
                  ? getMenteeInfoFromJson(
                              StorageServices.to.getString(getmenteeinfo))
                          .fullName ??
                      "Abdul Salam"
                  : getMentorInfoFromJson(
                          StorageServices.to.getString(getMentorInformationsss))
                      .fullName,
            ).toJson(),
          )
          .then((value) async {
        await firestore
            .collection('chatsCollection')
            .doc(chatRoomId)
            .collection('messageCollection')
            .add(
              MessageModel(
                userIds: [
                  StorageServices.to.getString(selectedUserType) == "Mentee"
                      ? getMenteeInfoFromJson(
                              StorageServices.to.getString(getmenteeinfo))
                          .email
                      : getMentorInfoFromJson(StorageServices.to
                              .getString(getMentorInformationsss))
                          .email,
                  recievedById
                ],
                recievedByProfilePicture: recImage,
                sendByProfilePicture:
                    StorageServices.to.getString(selectedUserType) == "Mentee"
                        ? getMenteeInfoFromJson(
                                StorageServices.to.getString(getmenteeinfo))
                            .profilePicUrl
                        : getMentorInfoFromJson(StorageServices.to
                                .getString(getMentorInformationsss))
                            .profilePicUrl,
                createdAt: DateTime.now().toString(),
                recievedById: recievedById,
                sendbyId:
                    StorageServices.to.getString(selectedUserType) == "Mentee"
                        ? getMenteeInfoFromJson(
                                StorageServices.to.getString(getmenteeinfo))
                            .email
                        : getMentorInfoFromJson(StorageServices.to
                                .getString(getMentorInformationsss))
                            .email,
                lastMessage: message,
              ).toJson(),
            );
      });
    } catch (e) {
      print(e);
    }
  }
}
