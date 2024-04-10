import 'package:mentor_app/app/Utils/Utils.dart';
import 'package:mentor_app/app/models/authModels/getMenteeInfo.dart';
import 'package:mentor_app/app/models/mentor/getMentorInfor.dart';
import 'package:mentor_app/app/models/notifications/getnotificationsResponseModel.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mentor_app/app/storage/keys.dart';
import 'package:mentor_app/app/storage/storage.dart';

class NotificationsRepository {
  Future<GetNotificationResponseModel> getNotifications() async {
    var url = Uri.parse(
        "https://guided-by-culture-production.up.railway.app/api/notification/notifications/${StorageServices.to.getString(selectedUserType) == "Mentee" ? getMenteeInfoFromJson(StorageServices.to.getString(getmenteeinfo)).email : getMentorInfoFromJson(StorageServices.to.getString(getMentorInformationsss)).email}");
    var headers = {
      'Accept': 'application/json',
      "Authorization": "Bearer ${StorageServices.to.getString(usertoken)}",
    };

    try {
      var response = await http.get(
        url,
        headers: headers,
      );

      if (response.statusCode == 200) {
        var data = await jsonDecode(response.body);
        return GetNotificationResponseModel.fromJson(data);
      } else {
        throw Exception();
      }
    } catch (error) {
      throw Exception();
    }
  }
}
