import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:girman_technologies/features/employees/data/data_source/employee_remote_data_source.dart';
import 'package:provider/provider.dart';

import 'core/theme/app_theme.dart';
import 'features/employees/data/data_source/employee_local_data_source.dart';
import 'features/employees/data/repository/employee_repository.dart';
import 'features/employees/presentation/providers/search_provider.dart';
import 'features/employees/presentation/screens/home_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      child: ChangeNotifierProvider(
        create: (context) => SearchProvider(
          //! Using data from firebase firestore
          employeeRepository: EmployeeRemoteRepositoryImpl(
            employeeRemoteDataSource: EmployeeRemoteDataSource(
              firestore: FirebaseFirestore.instance,
            ),
          ),

          //! To use local employee data. Uncomment the below code and comment the above code
          // employeeRepository: EmployeeLocalRepositoryImpl(
          //   employeeLocalDataSource: EmployeeLocalDataSource(),
          // ),
        ),
        child: MaterialApp(
          title: 'Girman Technologies',
          theme: AppTheme.kTheme,
          home: const HomeScreen(),
        ),
      ),
    );
  }
}
