// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:velocity_x/velocity_x.dart';

// class MyWidget extends StatelessWidget {
//   final MyController controller = Get.put(MyController());

//   Future<void> _selectTime(BuildContext context, TextEditingController controller) async {
//     final TimeOfDay? picked = await showTimePicker(
//       context: context,
//       initialTime: TimeOfDay.now(),
//     );
//     if (picked != null) {
//       final formattedTime = picked.format(context);
//       final localizations = MaterialLocalizations.of(context);
//       final formatted24HourTime = localizations.formatTimeOfDay(picked, alwaysUse24HourFormat: true);
//       controller.text = formatted24HourTime;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Obx(() => controller.index.value == 1
//         ? FutureBuilder(
//             future: controller.getMentorAvailbleSchedules(),
//             builder: (context, AsyncSnapshot snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return const Center(
//                   child: CircularProgressIndicator(),
//                 );
//               } else if (!snapshot.hasData || snapshot.data.isEmpty) {
//                 return Column(
//                   children: [
//                     ListView.builder(
//                       itemCount: 7,
//                       shrinkWrap: true,
//                       itemBuilder: (context, index) {
//                         final startingTimeController = TextEditingController();
//                         final endingTimeController = TextEditingController();

//                         return Row(
//                           children: [
//                             Obx(() => Checkbox(
//                                   value: controller.selectedAvailablityList
//                                       .any((item) => item['day'] == controller.daysOfWeek[index]),
//                                   onChanged: (val) {
//                                     final selectedDay = controller.daysOfWeek[index];
//                                     final existingItemIndex = controller.selectedAvailablityList
//                                         .indexWhere((item) => item['day'] == selectedDay);

//                                     if (startingTimeController.text.isEmpty ||
//                                         endingTimeController.text.isEmpty) {
//                                       // Handle empty text fields if needed
//                                     } else {
//                                       if (val!) {
//                                         // Checkbox is checked
//                                         if (existingItemIndex == -1) {
//                                           // Add new item to the list
//                                           controller.selectedAvailablityList.add({
//                                             'day': selectedDay,
//                                             'endTime': endingTimeController.text,
//                                             'mentorId': StorageServices.to.getString(userId),
//                                             'startTime': startingTimeController.text,
//                                             'id': 0,
//                                           });
//                                         }
//                                       } else {
//                                         // Checkbox is unchecked
//                                         if (existingItemIndex != -1) {
//                                           // Remove item from the list
//                                           controller.selectedAvailablityList.removeAt(existingItemIndex);
//                                         }
//                                       }
//                                     }
//                                   },
//                                 )),
//                             SizedBox(width: 90.w, child: Text(controller.daysOfWeek[index])),
//                             SizedBox(
//                               width: 50,
//                               child: InkWell(
//                                 onTap: () => _selectTime(context, startingTimeController),
//                                 child: IgnorePointer(
//                                   child: TextField(
//                                     controller: startingTimeController,
//                                     decoration: const InputDecoration(
//                                       contentPadding: EdgeInsets.all(0),
//                                       border: InputBorder.none,
//                                       hintText: 'Start',
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(width: 20),
//                             SizedBox(
//                               width: 50,
//                               child: InkWell(
//                                 onTap: () => _selectTime(context, endingTimeController),
//                                 child: IgnorePointer(
//                                   child: TextField(
//                                     controller: endingTimeController,
//                                     decoration: const InputDecoration(
//                                       contentPadding: EdgeInsets.all(0),
//                                       border: InputBorder.none,
//                                       hintText: 'End',
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         );
//                       },
//                     ),
//                     10.heightBox,
//                     CustomButton(
//                       buttonName: "Save",
//                       onPressed: () {
//                         controller.createMentorSchedular();
//                       },
//                       textcolor: whitecolor,
//                       loading: false,
//                       backgroundColor: darkBrownColor,
//                       rounded: true,
//                       height: 40.h,
//                       textSize: 16.sp,
//                       width: double.infinity,
//                     ),
//                   ],
//                 );
//               }

//               for (var i = 0; i < snapshot.data.length; i++) {
//                 controller.selectedAvailablityList.add({
//                   'day': snapshot.data[i]['day'] == "mon"
//                       ? "Monday"
//                       : snapshot.data[i]['day'] == "tue"
//                           ? "Tuesday"
//                           : snapshot.data[i]['day'] == "wed"
//                               ? "Wednesday"
//                               : snapshot.data[i]['day'] == "thu"
//                                   ? "Thursday"
//                                   : snapshot.data[i]['day'] == "fri"
//                                       ? "Friday"
//                                       : snapshot.data[i]['day'] == "sat"
//                                           ? "Saturday"
//                                           : snapshot.data[i]['day'] == "sun"
//                                               ? "Sunday"
//                                               : "",
//                   'endTime': snapshot.data[i]['endTime'],
//                   'mentorId': StorageServices.to.getString(userId),
//                   'startTime': snapshot.data[i]['startTime'],
//                   'id': snapshot.data[i]['id'],
//                 });
//               }

//               return Column(
//                 children: [
//                   _buildDataListView(controller.selectedAvailablityList),
//                   _buildAddDataListView(snapshot.data),
//                   10.heightBox,
//                   CustomButton(
//                     buttonName: "Update",
//                     onPressed: () {
//                       controller.createMentorSchedular();
//                     },
//                     textcolor: whitecolor,
//                     loading: false,
//                     backgroundColor: darkBrownColor,
//                     rounded: true,
//                     height: 35.h,
//                     textSize: 15.sp,
//                     width: double.infinity,
//                   ),
//                 ],
//               );
//             })
//         : const SizedBox.shrink());
//   }
// }

// // Replace _buildDataListView and _buildAddDataListView with your actual implementation.
// Widget _buildDataListView(List data) {
//   // Implement your method here
//   return Container();
// }

// Widget _buildAddDataListView(List data) {
//   // Implement your method here
//   return Container();
// }

// class MyController extends GetxController {
//   var index = 1.obs;
//   var selectedAvailablityList = <Map<String, dynamic>>[].obs;
//   List<String> daysOfWeek = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"];

//   Future<List> getMentorAvailbleSchedules() async {
//     // Implement your method to fetch schedules here
//     return [];
//   }

//   void createMentorSchedular() {
//     // Implement your method to create mentor scheduler here
//   }
// }

// class StorageServices {
//   static StorageServices get to => StorageServices();

//   String getString(String key) {
//     // Implement your method to get string from storage here
//     return '';
//   }
// }

// class CustomButton extends StatelessWidget {
//   final String buttonName;
//   final VoidCallback onPressed;
//   final Color textcolor;
//   final bool loading;
//   final Color backgroundColor;
//   final bool rounded;
//   final double height;
//   final double textSize;
//   final double width;

//   const CustomButton({
//     required this.buttonName,
//     required this.onPressed,
//     required this.textcolor,
//     required this.loading,
//     required this.backgroundColor,
//     required this.rounded,
//     required this.height,
//     required this.textSize,
//     required this.width,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: onPressed,
//       style: ElevatedButton.styleFrom(
//         primary: backgroundColor,
//         shape: rounded ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)) : null,
//       ),
//       child: loading
//           ? CircularProgressIndicator(color: textcolor)
//           : Text(
//               buttonName,
//               style: TextStyle(color: textcolor, fontSize: textSize),
//             ),
//     );
//   }
// }
