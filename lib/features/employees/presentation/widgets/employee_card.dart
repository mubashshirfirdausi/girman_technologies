import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/animations/custom_rect_tween.dart';
import '../../../../core/animations/hero_dialog_route.dart';
import '../../../../gen/assets.gen.dart';
import '../../data/models/employee.dart';
import '../screens/emloyee_details_screen.dart';

class EmployeeCard extends StatelessWidget {
  final Employee employee;

  const EmployeeCard({super.key, required this.employee});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: employee.id!,
      createRectTween: (begin, end) {
        return CustomRectTween(begin: begin!, end: end!);
      },
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.10),
                blurRadius: 8.65,
                offset: const Offset(0, 3.46),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0XFFF3F3F3),
                          width: 0.83,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(6.92),
                        child: CircleAvatar(
                          backgroundImage: AssetImage(Assets.images.placeholder.path),
                          radius: 26.5,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                  ],
                ),
                SizedBox(height: 6.92.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${employee.firstName} ${employee.lastName}',
                      style: const TextStyle(fontSize: 27, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 6.92.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.fmd_good_sharp, size: 11.24, color: Color(0XFF425763)),
                        Text(
                          employee.city ?? "-",
                          style:
                              const TextStyle(fontSize: 10.46, fontWeight: FontWeight.w500, color: Color(0XFF425763)),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 28.29.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.phone, size: 11.24, color: Colors.black),
                            SizedBox(width: 5.19.w),
                            Text(
                              employee.contactNumber ?? "-",
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 12.56,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4.32.h),
                        const Text(
                          "Available on phone",
                          style: TextStyle(
                            fontSize: 10.46,
                            fontWeight: FontWeight.w500,
                            color: Color(0XFFAFAFAF),
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(HeroDialogRoute(
                          builder: (context) => EmployeeDetailsScreen(employee: employee),
                          fullscreenDialog: false,
                        ));
                      },
                      // _showUserDetails(context, employee),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        minimumSize: const Size(103.67, 34.59),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.92),
                        ),
                      ),
                      child: const Text('Fetch Details'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
