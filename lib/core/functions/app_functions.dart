import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:girman_technologies/features/employees/presentation/screens/search_screen.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../features/employees/data/models/pop_up_menu_item_name.dart';
import '../../gen/assets.gen.dart';

class AppFunctions {
  static PreferredSizeWidget buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 2,
      centerTitle: false,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            Assets.images.appLogo,
            height: 28.h,
            width: 28.w,
          ),
          const SizedBox(width: 5.81),
          const Column(
            children: [
              Text(
                "Griman",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 19.53,
                ),
              ),
              Text(
                "TECHNOLOGIES",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 7.81,
                ),
              )
            ],
          ),
        ],
      ),
      actions: [
        PopupMenuButton(
          iconColor: Colors.black,
          icon: const Icon(Icons.menu),
          position: PopupMenuPosition.under,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          itemBuilder: (context) {
            return List.generate(
              PopUpMenuItemName.values.length,
              (index) => PopupMenuItem(
                value: PopUpMenuItemName.values[index],
                child: Text(
                  PopUpMenuItemName.values[index].name,
                ),
              ),
            );
          },
          onSelected: (value) {
            switch (value) {
              case PopUpMenuItemName.search:
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SearchResultsScreen()));
                break;
              case PopUpMenuItemName.website:
                _launchURL("https://www.girmantech.com");
                break;
              case PopUpMenuItemName.linkedIn:
                _launchURL("https://www.linkedin.com/company/girmantech/");
                break;
              case PopUpMenuItemName.contact:
                _openEmailApp("girish@girmantech.com");
                break;
            }
          },
        ),
      ],
    );
  }

  static void _launchURL(String url) async {
    final parsedUrl = Uri.parse(url);
    if (await canLaunchUrl(parsedUrl)) {
      await launchUrl(parsedUrl);
    } else {
      throw 'Could not launch $url';
    }
  }

  static Future<void> _openEmailApp(String email) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
    );

    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri);
    } else {
      throw 'Could not launch email client';
    }
  }
}
