import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mentor_app/app/modules/walletIntegeration/controllers/country_controller.dart';
import 'package:mentor_app/app/resources/colors.dart';

class CountryDropdown extends StatelessWidget {
  final CountryController countryController = Get.put(CountryController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return DropdownButtonFormField<String>(
        decoration: InputDecoration(
          filled: true,
          fillColor: halfwhitecolor, // Background color
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(9),
            borderSide: BorderSide.none,
          ),
          // contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
        dropdownColor: halfwhitecolor,
        borderRadius: BorderRadius.circular(29),
        value: countryController.selectedCountry.value == 'Select a country'
            ? null
            : countryController.selectedCountry.value,
        hint: Text('Select a country'),
        items: countryController.countries.map((String country) {
          return DropdownMenuItem<String>(
            value: country,
            child: Text(country),
          );
        }).toList(),
        onChanged: (String? newValue) {
          if (newValue != null) {
            countryController.setSelectedCountry(newValue);
          }
        },
      );
    });
  }
}
