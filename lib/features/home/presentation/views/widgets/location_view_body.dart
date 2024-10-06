import 'package:ai_tennis/core/services/locator_service.dart';
import 'package:ai_tennis/features/home/presentation/views/widgets/custom_button_bloc_consumer.dart';
import 'package:ai_tennis/features/home/presentation/views/widgets/custom_icon.dart';
import 'package:ai_tennis/features/home/presentation/views/widgets/custom_location_form_field.dart';
import 'package:ai_tennis/features/home/presentation/views/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LocationViewBody extends StatefulWidget {
  const LocationViewBody({super.key});

  @override
  State<LocationViewBody> createState() => _LocationViewBodyState();
}

class _LocationViewBodyState extends State<LocationViewBody> {
  var destinationController = TextEditingController();
  bool _isLoading = false;
  String cityName = '';
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return ModalProgressHUD(
      progressIndicator: const CircularProgressIndicator(
        color: Colors.white,
        backgroundColor: Colors.black,
      ),
      opacity: 0.1,
      inAsyncCall: _isLoading,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const HeaderWidget(),
              SizedBox(
                height: height * 0.025,
              ),
              const CustomIcon(),
              SizedBox(
                height: height * 0.080,
              ),
              CustomLocationFormField(
                onChanged: (value) {
                  cityName = value;
                  setState(() {});
                },
                controller: destinationController,
                onTap: () async {
                  setState(() {
                    _isLoading = true;
                  });
                  String location = await LocatorService.getCityName();
                  setState(() {
                    destinationController.text = location;
                    cityName = location;
                    _isLoading = false;
                  });
                },
              ),
              SizedBox(
                height: height * 0.032,
              ),
              CustomButtonBlocConsumer(
                cityName: cityName,
                hour: 17,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
