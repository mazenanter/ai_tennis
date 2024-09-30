import 'package:ai_tennis/core/app_routes/app_routes.dart';
import 'package:ai_tennis/core/services/locator_service.dart';
import 'package:ai_tennis/core/widgets/custom_button.dart';
import 'package:ai_tennis/features/home/presentation/views/widgets/custom_icon.dart';
import 'package:ai_tennis/features/home/presentation/views/widgets/custom_location_form_field.dart';
import 'package:ai_tennis/features/home/presentation/views/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LocationViewBody extends StatefulWidget {
  const LocationViewBody({super.key});

  @override
  State<LocationViewBody> createState() => _LocationViewBodyState();
}

class _LocationViewBodyState extends State<LocationViewBody> {
  var destinationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const HeaderWidget(),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.025,
            ),
            const CustomIcon(),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.080,
            ),
            CustomLocationFormField(
              controller: destinationController,
              onTap: () async {
                destinationController.text = await LocatorService.getCityName();
              },
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.032,
            ),
            CustomButton(
              onPress: () {
                GoRouter.of(context).push(AppRoutes.kHomeView);
              },
              buttonText: 'Search',
            ),
          ],
        ),
      ),
    );
  }
}
