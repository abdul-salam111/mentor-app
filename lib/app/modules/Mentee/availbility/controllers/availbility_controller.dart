import 'dart:convert';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mentor_app/app/models/authModels/createMenteeModel.dart';
import 'package:mentor_app/app/models/authModels/getMenteeInfo.dart';
import 'package:mentor_app/app/modules/Mentee/careerGoals/controllers/career_goals_controller.dart';
import 'package:mentor_app/app/modules/Mentee/education/controllers/education_controller.dart';
import 'package:mentor_app/app/modules/Mentee/preferredMentor/controllers/preferred_mentor_controller.dart';
import 'package:mentor_app/app/modules/Mentee/skills/controllers/skills_controller.dart';
import 'package:mentor_app/app/modules/signup/controllers/signup_controller.dart';
import 'package:mentor_app/app/resources/apiKeys.dart';
import 'package:mentor_app/app/routes/app_pages.dart';
import 'package:http/http.dart' as http;
import 'package:mentor_app/app/storage/keys.dart';
import 'package:mentor_app/app/storage/storage.dart';

import '../../../../Utils/Utils.dart';

class AvailbilityController extends GetxController {
  var careerGoalsController = Get.put(CareerGoalsController());
  var skillsController = Get.put(SkillsController());
  var educationController = Get.put(EducationController());
  var preferredMentorController = Get.put(PreferredMentorController());
  var signUpController = Get.put(SignupController());

  RxList<String> availabilityList = <String>[].obs;
  var isOpen = false.obs;
  var isDurationOpen = false.obs;

  List<String> communitcationChannels = [
    'App messaging',
    'Video Call',
    'Phone Call'
  ];
  List<String> selectedChannles = <String>[].obs;

  List<String> daysOfWeek = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];
 final List<String> timezones = [
  'UTC',
  'America/New_York',
  'America/Los_Angeles',
  'Europe/London',
  'Europe/Paris',
  'Asia/Tokyo',
  'Australia/Sydney',
  'Pacific/Honolulu',
  'America/Chicago',
  'America/Denver',
  'America/Phoenix',
  'America/Anchorage',
  'Europe/Berlin',
  'Asia/Shanghai',
  'Asia/Dubai',
  'Australia/Melbourne',
  'Africa/Johannesburg',
  'Pacific/Auckland',
  'Asia/Kolkata',
  'Europe/Moscow',
  'America/Toronto', // Toronto, Canada
  'America/Mexico_City', // Mexico City, Mexico
  'America/Sao_Paulo', // Sao Paulo, Brazil
  'Europe/Istanbul', // Istanbul, Turkey
  'Asia/Bangkok', // Bangkok, Thailand
  'Asia/Hong_Kong', // Hong Kong
  'Africa/Cairo', // Cairo, Egypt
  'Europe/Madrid', // Madrid, Spain
  'America/Buenos_Aires', // Buenos Aires, Argentina
  'Asia/Singapore', // Singapore
  'Asia/Seoul', // Seoul, South Korea
  'Europe/Amsterdam', // Amsterdam, Netherlands
  'Europe/Athens', // Athens, Greece
  'America/Toronto', // Toronto, Canada
  'America/Vancouver', // Vancouver, Canada
  'America/Montreal', // Montreal, Canada
  'America/Edmonton', // Edmonton, Canada
  'America/Ottawa', // Ottawa, Canada
  'America/Calgary', // Calgary, Canada
  'America/Winnipeg', // Winnipeg, Canada
  'America/Halifax', // Halifax, Canada
  'America/St_Johns', // St. John's, Canada
  'Europe/Oslo', // Oslo, Norway
  'Europe/Stockholm', // Stockholm, Sweden
  'Europe/Copenhagen', // Copenhagen, Denmark
  'Europe/Brussels', // Brussels, Belgium
  'Europe/Vienna', // Vienna, Austria
  'Europe/Zurich', // Zurich, Switzerland
  'Europe/Prague', // Prague, Czech Republic
  'Europe/Budapest', // Budapest, Hungary
  'Europe/Warsaw', // Warsaw, Poland
  'Europe/Lisbon', // Lisbon, Portugal
  'Europe/Dublin', // Dublin, Ireland
  'Europe/Helsinki', // Helsinki, Finland
  'Europe/Bucharest', // Bucharest, Romania
  'Europe/Bratislava', // Bratislava, Slovakia
  'Europe/Sofia', // Sofia, Bulgaria
  'Europe/Vilnius', // Vilnius, Lithuania
  'Europe/Riga', // Riga, Latvia
  'Europe/Tallinn', // Tallinn, Estonia
  'Europe/Reykjavik', // Reykjavik, Iceland
  'Europe/Malta', // Malta
  'Asia/Jakarta', // Jakarta, Indonesia
  'Asia/Kuala_Lumpur', // Kuala Lumpur, Malaysia
  'Asia/Taipei', // Taipei, Taiwan
  'Asia/Mumbai', // Mumbai, India
  'Asia/Karachi', // Karachi, Pakistan
  'Asia/Istanbul', // Istanbul, Turkey
  'Asia/Dhaka', // Dhaka, Bangladesh
  'Asia/Colombo', // Colombo, Sri Lanka
  'Asia/Kathmandu', // Kathmandu, Nepal
  'Asia/Baghdad', // Baghdad, Iraq
  'Asia/Manila', // Manila, Philippines
  'Asia/Almaty', // Almaty, Kazakhstan
  'Asia/Yangon', // Yangon, Myanmar
  'Asia/Ho_Chi_Minh', // Ho Chi Minh City, Vietnam
  'Asia/Kabul', // Kabul, Afghanistan
  'Asia/Tehran', // Tehran, Iran
  'Asia/Baku', // Baku, Azerbaijan
  'Asia/Yerevan', // Yerevan, Armenia
  'Asia/Tbilisi', // Tbilisi, Georgia
  'Asia/Ashgabat', // Ashgabat, Turkmenistan
  'Asia/Muscat', // Muscat, Oman
  'Asia/Qatar', // Doha, Qatar
  'Asia/Kuwait', // Kuwait City, Kuwait
  'Asia/Riyadh', // Riyadh, Saudi Arabia
  'Asia/Aden', // Aden, Yemen
  'Asia/Beirut', // Beirut, Lebanon
  'Asia/Amman', // Amman, Jordan
  'Asia/Damascus', // Damascus, Syria
  'Asia/Jerusalem', // Jerusalem, Israel
  'Asia/Bahrain', // Manama, Bahrain
  'Asia/Pyongyang', // Pyongyang, North Korea
  'Asia/Seoul', // Seoul, South Korea
  'Asia/Ulaanbaatar', // Ulaanbaatar, Mongolia
  'Asia/Hong_Kong', // Hong Kong
  'Asia/Macau', // Macau
  'Asia/Taipei', // Taipei, Taiwan
  'Asia/Singapore', // Singapore
  'Asia/Kuala_Lumpur', // Kuala Lumpur, Malaysia
  'Asia/Manila', // Manila, Philippines
  'Asia/Shanghai', // Shanghai, China
  'Asia/Tokyo', // Tokyo, Japan
  'Asia/Bangkok', // Bangkok, Thailand
  'Asia/Jakarta', // Jakarta, Indonesia
  'Asia/Kolkata', // Kolkata, India
  'Asia/Colombo', // Colombo, Sri Lanka
  'Asia/Dhaka', // Dhaka, Bangladesh
  'Asia/Kathmandu', // Kathmandu, Nepal
  'Asia/Karachi', // Karachi, Pakistan
  'Asia/Tashkent', // Tashkent, Uzbekistan
  'Asia/Almaty', // Almaty, Kazakhstan
  'Asia/Yerevan', // Yerevan, Armenia
  'Asia/Baku', // Baku, Azerbaijan
  'Asia/Yekaterinburg', // Yekaterinburg, Russia
  'Asia/Omsk', // Omsk, Russia
  'Asia/Novosibirsk', // Novosibirsk, Russia
  'Asia/Krasnoyarsk', // Krasnoyarsk, Russia
  'Asia/Irkutsk', // Irkutsk, Russia
  'Asia/Chita', // Chita, Russia
  'Asia/Yakutsk', // Yakutsk, Russia
  'Asia/Khandyga', // Khandyga, Russia
  'Asia/Vladivostok', // Vladivostok, Russia
  'Asia/Ust-Nera', // Ust-Nera, Russia
  'Asia/Magadan', // Magadan, Russia
  'Asia/Srednekolymsk', // Srednekolymsk, Russia
  'Asia/Kamchatka', // Kamchatka, Russia
  'Asia/Anadyr', // Anadyr, Russia
  'Europe/Lisbon', // Lisbon, Portugal
  'Europe/London', // London, UK
  'Europe/Amsterdam', // Amsterdam, Netherlands
  'Europe/Andorra', // Andorra
  'Europe/Astrakhan', // Astrakhan, Russia
  'Europe/Athens', // Athens, Greece
  'Europe/Belgrade', // Belgrade, Serbia
  'Europe/Berlin', // Berlin, Germany
  'Europe/Bratislava', // Bratislava, Slovakia
  'Europe/Brussels', // Brussels, Belgium
  'Europe/Bucharest', // Bucharest, Romania
  'Europe/Budapest', // Budapest, Hungary
  'Europe/Busingen', // Busingen, Switzerland
  'Europe/Chisinau', // Chisinau, Moldova
  'Europe/Copenhagen', // Copenhagen, Denmark
  'Europe/Dublin', // Dublin, Ireland
  'Europe/Gibraltar', // Gibraltar
  'Europe/Guernsey', // Guernsey
  'Europe/Helsinki', // Helsinki, Finland
  'Europe/Isle_of_Man', // Isle of Man
  'Europe/Istanbul', // Istanbul, Turkey
  'Europe/Jersey', // Jersey
  'Europe/Kaliningrad', // Kaliningrad, Russia
  'Europe/Kiev', // Kiev, Ukraine
  'Europe/Kirov', // Kirov, Russia
  'Europe/Lisbon', // Lisbon, Portugal
  'Europe/Ljubljana', // Ljubljana, Slovenia
  'Europe/London', // London, UK
  'Europe/Luxembourg', // Luxembourg
  'Europe/Madrid', // Madrid, Spain
  'Europe/Malta', // Malta
  'Europe/Mariehamn', // Mariehamn, Aland Islands
  'Europe/Minsk', // Minsk, Belarus
  'Europe/Monaco', // Monaco
  'Europe/Moscow', // Moscow, Russia
  'Europe/Oslo', // Oslo, Norway
  'Europe/Paris', // Paris, France
  'Europe/Podgorica', // Podgorica, Montenegro
  'Europe/Prague', // Prague, Czech Republic
  'Europe/Riga', // Riga, Latvia
  'Europe/Rome', // Rome, Italy
  'Europe/Samara', // Samara, Russia
  'Europe/San_Marino', // San Marino
  'Europe/Sarajevo', // Sarajevo, Bosnia and Herzegovina
  'Europe/Saratov', // Saratov, Russia
  'Europe/Simferopol', // Simferopol, Crimea
  'Europe/Skopje', // Skopje, North Macedonia
  'Europe/Sofia', // Sofia, Bulgaria
  'Europe/Stockholm', // Stockholm, Sweden
  'Europe/Tallinn', // Tallinn, Estonia
  'Europe/Tirane', // Tirane, Albania
  'Europe/Ulyanovsk', // Ulyanovsk, Russia
  'Europe/Uzhgorod', // Uzhgorod, Ukraine
  'Europe/Vaduz', // Vaduz, Liechtenstein
  'Europe/Vatican', // Vatican City
  'Europe/Vienna', // Vienna, Austria
  'Europe/Vilnius', // Vilnius, Lithuania
  'Europe/Volgograd', // Volgograd, Russia
  'Europe/Warsaw', // Warsaw, Poland
  'Europe/Zagreb', // Zagreb, Croatia
  'Europe/Zaporozhye', // Zaporozhye, Ukraine
  'Europe/Zurich', // Zurich, Switzerland
  'Africa/Abidjan', // Abidjan, Ivory Coast
  'Africa/Accra', // Accra, Ghana
  'Africa/Algiers', // Algiers, Algeria
  'Africa/Bissau', // Bissau, Guinea-Bissau
  'Africa/Cairo', // Cairo, Egypt
  'Africa/Casablanca', // Casablanca, Morocco
  'Africa/Ceuta', // Ceuta, Spain
  'Africa/El_Aaiun', // El Aaiun, Western Sahara
  'Africa/Johannesburg', // Johannesburg, South Africa
  'Africa/Juba', // Juba, South Sudan
  'Africa/Khartoum', // Khartoum, Sudan
  'Africa/Lagos', // Lagos, Nigeria
  'Africa/Maputo', // Maputo, Mozambique
  'Africa/Monrovia', // Monrovia, Liberia
  'Africa/Nairobi', // Nairobi, Kenya
  'Africa/Ndjamena', // Ndjamena, Chad
  'Africa/Sao_Tome', // Sao Tome, Sao Tome and Principe
  'Africa/Tripoli', // Tripoli, Libya
  'Africa/Tunis', // Tunis, Tunisia
  'Africa/Windhoek', // Windhoek, Namibia
  'Atlantic/Azores', // Azores, Portugal
  'Atlantic/Bermuda', // Bermuda
  'Atlantic/Canary', // Canary Islands, Spain
  'Atlantic/Cape_Verde', // Cape Verde
  'Atlantic/Faroe', // Faroe Islands
  'Atlantic/Madeira', // Madeira, Portugal
  'Atlantic/Reykjavik', // Reykjavik, Iceland
  'Atlantic/South_Georgia', // South Georgia and the South Sandwich Islands
  'Atlantic/St_Helena', // Saint Helena
  'Atlantic/Stanley', // Stanley, Falkland Islands
  'Australia/Adelaide', // Adelaide, Australia
  'Australia/Brisbane', // Brisbane, Australia
  'Australia/Broken_Hill', // Broken Hill, Australia
  'Australia/Currie', // Currie, Australia
  'Australia/Darwin', // Darwin, Australia
  'Australia/Eucla', // Eucla, Australia
  'Australia/Hobart', // Hobart, Australia
  'Australia/Lindeman', // Lindeman, Australia
  'Australia/Lord_Howe', // Lord Howe Island, Australia
  'Australia/Melbourne', // Melbourne, Australia
  'Australia/Perth', // Perth, Australia
  'Australia/Sydney', // Sydney, Australia
  'Etc/GMT', // Greenwich Mean Time
  'Etc/UTC', // Coordinated Universal Time
  'Indian/Chagos', // Chagos Archipelago
  'Indian/Christmas', // Christmas Island
  'Indian/Cocos', // Cocos Islands
  'Indian/Kerguelen', // Kerguelen Islands
  'Indian/Mahe', // Mahe, Seychelles
  'Indian/Maldives', // Maldives
  'Indian/Mauritius', // Mauritius
  'Indian/Reunion', // Reunion
  'Pacific/Apia', // Apia, Samoa
  'Pacific/Auckland', // Auckland, New Zealand
  'Pacific/Bougainville', // Bougainville, Papua New Guinea
  'Pacific/Chatham', // Chatham Islands, New Zealand
  'Pacific/Chuuk', // Chuuk, Micronesia
  'Pacific/Easter', // Easter Island
  'Pacific/Efate', // Efate, Vanuatu
  'Pacific/Enderbury', // Enderbury Island, Kiribati
  'Pacific/Fakaofo', // Fakaofo, Tokelau
  'Pacific/Fiji', // Fiji
  'Pacific/Funafuti', // Funafuti, Tuvalu
  'Pacific/Galapagos', // Galapagos Islands
  'Pacific/Gambier', // Gambier Islands
  'Pacific/Guadalcanal', // Guadalcanal, Solomon Islands
  'Pacific/Guam', // Guam
  'Pacific/Honolulu', // Honolulu, Hawaii, USA
  'Pacific/Kiritimati', // Kiritimati, Kiribati
  'Pacific/Kosrae', // Kosrae, Micronesia
  'Pacific/Kwajalein', // Kwajalein, Marshall Islands
  'Pacific/Majuro', // Majuro, Marshall Islands
  'Pacific/Marquesas', // Marquesas Islands
  'Pacific/Midway', // Midway Atoll, USA
  'Pacific/Nauru', // Nauru
  'Pacific/Niue', // Niue
  'Pacific/Norfolk', // Norfolk Island
  'Pacific/Noumea', // Noumea, New Caledonia
  'Pacific/Pago_Pago', // Pago Pago, American Samoa
  'Pacific/Palau', // Palau
  'Pacific/Pitcairn', // Pitcairn Islands
  'Pacific/Pohnpei', // Pohnpei, Micronesia
  'Pacific/Port_Moresby', // Port Moresby, Papua New Guinea
  'Pacific/Rarotonga', // Rarotonga, Cook Islands
  'Pacific/Saipan', // Saipan, Northern Mariana Islands
  'Pacific/Tahiti', // Tahiti
  'Pacific/Tarawa', // Tarawa, Kiribati
  'Pacific/Tongatapu', // Tongatapu, Tonga
  'Pacific/Wake', // Wake Island
  'Pacific/Wallis', // Wallis and Futuna
];

  var selectedTimeZone = "Select".obs;
  List<String> durations = [
    '1 hour',
    '1 hour 30 minutes',
    '2 hours',
    '2 hours 30 minutes',
    '3 hours',
    '3 hours 30 minutes',
    '4 hours',
    '4 hours 30 minutes',
    '5 hours',
    '5 hours 30 minutes',
    '6 hours',
  ];

  var isLoading = false.obs;
  var selectedDuration = 'Select'.obs;

  Rx<XFile?> imageFile = Rx<XFile?>(null);
  Future<void> pickImage() async {
    try {
      final imagePicker = ImagePicker();
      final pickedFile =
          await imagePicker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        imageFile.value = pickedFile;
      }
    } catch (e) {
      // Handle image picker errors
      print('Error picking image: $e');
    }
  }

  Future<void> createMentee() async {
    try {
      EasyLoading.show(status: "Creating Profile...");

      // Gather data from controllers and other sources
     
  

   

 

      // Create the model
      CreateMenteeRequestModel createMenteeModel = CreateMenteeRequestModel(
        fullName: signUpController.nameController.value.text.toString(),
        goals: careerGoalsController.selectedGoalsList.join(','),
        skills:  skillsController.selectedSkills.join(','),
        education: educationController.selectedSubject.value,
        industry: preferredMentorController.selectedMentorshipstyle.value,
        mentorshipStyle: preferredMentorController.selectedMentorshipstyle.value,
        email: signUpController.emailController.value.text,
        gender: preferredMentorController.selectedGender.value,
        sessionDuration: selectedDuration.value,
        about:  preferredMentorController.aboutMe.value.text.toString(),
        profilePicUrl: '',
        communicationChannels: selectedChannles.join(','),
        password: signUpController.passwordController.value.text.toString(),
        availableDays: availabilityList.join(','),
        timeZone: selectedTimeZone.value,
      );

      // Create a multipart request
      var request = http.MultipartRequest('POST', Uri.parse(createMenteeUrl));

      // Add profile picture file to the request
      var profilePicStream = http.ByteStream(imageFile.value!.openRead());
      var profilePicLength = await imageFile.value!.length();
      var profilePicMultipartFile = http.MultipartFile(
        'profilePicUrl',
        profilePicStream,
        profilePicLength,
        filename: imageFile.value!.path.split('/').last,
      );
      request.files.add(profilePicMultipartFile);

      // Add form fields from the model
      createMenteeModel.toJson().forEach((key, value) {
        request.fields[key] = value.toString();
      });

      // Send the request and await response
      var response = await request.send();

      // Check response status code
      if (response.statusCode == 200) {
        String responseBody = await response.stream.bytesToString();
  CreateMenteeRequestModel createMenteeModel2 = CreateMenteeRequestModel(
        fullName: signUpController.nameController.value.text.toString(),
        goals: careerGoalsController.selectedGoalsList.join(','),
        skills:  skillsController.selectedSkills.join(','),
        education: educationController.selectedSubject.value,
        industry: preferredMentorController.selectedMentorshipstyle.value,
        mentorshipStyle: preferredMentorController.selectedMentorshipstyle.value,
        email: "mentee${signUpController.emailController.value.text}",
        gender: preferredMentorController.selectedGender.value,
        sessionDuration: selectedDuration.value,
        about:  preferredMentorController.aboutMe.value.text.toString(),
        profilePicUrl: '',
        communicationChannels: selectedChannles.join(','),
        password: signUpController.passwordController.value.text.toString(),
        availableDays: availabilityList.join(','),
        timeZone: selectedTimeZone.value,
      );
        // Decode the JSON response body
        var responseData = jsonDecode(responseBody);
        signUpUsertoFirebase(createMenteeModel2.toJson(),responseData['id'].toString());
        StorageServices.to.setString(key: userId, value: responseData['id'].toString());
        EasyLoading.dismiss();
        clearTextfields();

        Utils.snakbar(
          title: "Account Created!",
          body: "Your account is created successfully!",
        );
      } else {
        EasyLoading.dismiss();
        Utils.snakbar(
          title: "Failed!",
          body: "Failed to create Account!",
        );
      }
    } catch (e) {
      print(e);
      Utils.snakbar(
        title: "Failed",
        body: "Failed to create Account because! $e",
      );
      EasyLoading.dismiss();
    }
  }

  final firebaseauth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  Future signUpUsertoFirebase(var menteemodel, userId) async {
    try {
      await firebaseauth
          .createUserWithEmailAndPassword(
              email:"meentee${signUpController.emailController.value.text}",
              password:
                  signUpController.passwordController.value.text.toString())
          .then((user) async {
        await FirebaseFirestore.instance
            .collection('mentees')
            .doc(userId)
            .set(menteemodel);
        Get.offAndToNamed(Routes.CONGRATULATIONS);
      });
    } catch (e) {
      print(e);
    }
  }

  clearTextfields() {
    signUpController.nameController.value.clear();
    signUpController.emailController.value.clear();
    signUpController.passwordController.value.clear();
    careerGoalsController.selectedGoalsList.clear();
    skillsController.selectedSkills.clear();
    educationController.selectedCertification.value = "Select";
    educationController.selectedSubject.value = "Select";
    preferredMentorController.aboutMe.value.clear();
    preferredMentorController.selectedGender.value = "";
    preferredMentorController.selectedIndustries.value = "Select";
    preferredMentorController.selectedMentorshipstyle.value = "Select";
    imageFile.value = null;
    selectedChannles.clear();
    selectedDuration.value = "Select";
    selectedTimeZone.value = "Select";
    availabilityList.clear();
  }
}
