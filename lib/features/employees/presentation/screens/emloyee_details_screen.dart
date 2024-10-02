import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:girman_technologies/gen/assets.gen.dart';
import '../../../../core/animations/custom_rect_tween.dart';
import '../../data/models/employee.dart';

class EmployeeDetailsScreen extends StatelessWidget {
  final Employee employee;

  const EmployeeDetailsScreen({super.key, required this.employee});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 200.h),
      child: Hero(
        tag: employee.id!,
        createRectTween: (begin, end) {
          return CustomRectTween(begin: begin!, end: end!);
        },
        child: Material(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7.41),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 22.h),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Fetch Details',
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ],
                  ),
                  const Text(
                    'Here are the details of the following employee.',
                    style: TextStyle(fontSize: 12.96, fontWeight: FontWeight.w400, color: Color(0XFF71717A)),
                  ),
                  const SizedBox(height: 16),
                  _buildDetailRow('Name', '${employee.firstName} ${employee.lastName}'),
                  _buildDetailRow('Location', employee.city ?? "-"),
                  _buildDetailRow('Contact Number', employee.firstName ?? "-"),
                  SizedBox(height: 9.26.h),
                  const Text('Profile Image:'),
                  SizedBox(height: 14.81.h),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      Assets.images.placeholder.path,
                      width: 191.w,
                      height: 191.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label:',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12.96),
          ),
          const SizedBox(width: 8),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12.96),
          ),
        ],
      ),
    );
  }
}
