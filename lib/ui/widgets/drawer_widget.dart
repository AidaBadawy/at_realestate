// import 'package:aisu_cleaners/ui/common/app_images.dart';
import 'package:aisu_realestate/ui/common/app_colors.dart';
import 'package:aisu_realestate/ui/common/app_images.dart';
import 'package:aisu_realestate/ui/common/app_strings.dart';
import 'package:aisu_realestate/ui/common/box_text.dart';
import 'package:aisu_realestate/ui/common/ui_helpers.dart';
import 'package:aisu_realestate/ui/views/wrapper/wrapper_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class DrawerWidget extends StatelessWidget {
  final WrapperViewModel viewModel;
  const DrawerWidget({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        // Important: Remove any padding from the ListView.
        // padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: ManropeText.bold("Aidarus Badawy", 13, kcWhiteColor),
            otherAccountsPictures: const [
              CircleAvatar(
                backgroundColor: kcWhiteColor,
                backgroundImage: AssetImage(logoImage),
              ),
            ],
            accountEmail:
                ManropeText.bold("aidarusbadawy@gmail.com", 12, kcWhiteColor),
            currentAccountPicture: const CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://images.unsplash.com/photo-1555952517-2e8e729e0b44?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=928&q=80"),
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(
                      0.8), // Adjust the opacity level here (0.5 for 50% opacity)
                  BlendMode
                      .dstIn, // This mode combines the color with the image
                ),
                image: const AssetImage(drawerBackground),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              leading: const Icon(
                Feather.home,
                size: 22,
              ),
              minLeadingWidth: 0,
              selectedTileColor: kcPrimaryColorHighlight,
              selectedColor: kcPrimaryColor,
              title: ManropeText.bold(ksHome, 12, kcBlackColor),
              selected: viewModel.selectedIndex == 0,
              onTap: () {
                // Update the state of the app
                viewModel.onItemTapped(0);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              leading: const Icon(
                FontAwesome5Regular.building,
                size: 22,
              ),
              minLeadingWidth: 0,
              selectedTileColor: kcPrimaryColorHighlight,
              selectedColor: kcPrimaryColor,
              title: ManropeText.bold(ksListings, 12, kcBlackColor),
              selected: viewModel.selectedIndex == 1,
              onTap: () {
                // Update the state of the app
                viewModel.onItemTapped(1);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              leading: const Icon(
                Feather.users,
                size: 22,
              ),
              minLeadingWidth: 0,
              selectedTileColor: kcPrimaryColorHighlight,
              selectedColor: kcPrimaryColor,
              title: ManropeText.bold(ksTenants, 12, kcBlackColor),
              selected: viewModel.selectedIndex == 2,
              onTap: () {
                // Update the state of the app
                viewModel.onItemTapped(2);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              leading: const Icon(
                Feather.credit_card,
                size: 22,
              ),
              selectedTileColor: kcPrimaryColorHighlight,
              selectedColor: kcPrimaryColor,
              minLeadingWidth: 0,
              // title: const Text('Staff'),
              title: ManropeText.bold(ksPayments, 12, kcBlackColor),
              selected: viewModel.selectedIndex == 3,
              onTap: () {
                // Update the state of the app
                viewModel.onItemTapped(3);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              leading: const Icon(
                Feather.file_text,
                size: 22,
              ),
              minLeadingWidth: 0,
              selectedTileColor: kcPrimaryColorHighlight,
              selectedColor: kcPrimaryColor,
              // title: const Text('Reports'),
              title: ManropeText.bold(ksReports, 12, kcBlackColor),
              selected: viewModel.selectedIndex == 4,
              onTap: () {
                // Update the state of the app
                viewModel.onItemTapped(4);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              leading: const Icon(
                Feather.settings,
                size: 22,
              ),
              // title: const Text('Settings'),
              title: ManropeText.bold(ksSettings, 12, kcBlackColor),
              minLeadingWidth: 0,
              selectedTileColor: kcPrimaryColorHighlight,
              selectedColor: kcPrimaryColor,
              selected: viewModel.selectedIndex == 5,
              onTap: () {
                // Update the state of the app
                viewModel.onItemTapped(5);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              leading: const Icon(
                Feather.log_out,
                size: 22,
                color: kcRedColor,
              ),
              title: ManropeText.bold(ksLogout, 12, kcRedColor),
              minLeadingWidth: 0,
              selectedTileColor: kcRedColor.withOpacity(.1),
              selectedColor: kcPrimaryColor,
              selected: true,
              onTap: () {
                // // Update the state of the app
                // viewModel.onItemTapped(5);

                // Navigator.pop(context);
              },
            ),
          ),
          verticalSpaceSmall,
        ],
      ),
    );
  }
}
