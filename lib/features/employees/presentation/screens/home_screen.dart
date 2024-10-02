import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:girman_technologies/core/theme/app_theme.dart';
import 'package:girman_technologies/gen/assets.gen.dart';
import 'package:provider/provider.dart';

import '../../../../core/functions/app_functions.dart';
import '../providers/search_provider.dart';
import 'search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    loadEmployees();
    super.initState();
  }

  loadEmployees() async {
    final searchProvider = Provider.of<SearchProvider>(context, listen: false);
    try {
      await searchProvider.loadUsers();
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error loading employees: $e'),
        ),
      );
    }
  }

  @override
  dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppFunctions.buildAppBar(context),
      body: Column(
        children: [
          Expanded(
            child: DecoratedBox(
              decoration: AppTheme.kScaffoldBodyStyle,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 28.w),
                child: Column(
                  children: [
                    SizedBox(height: 109.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(Assets.images.appLogo2, height: 47),
                        const SizedBox(width: 28),
                        const Text(
                          'Girman',
                          style: TextStyle(fontSize: 57, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    SizedBox(height: 28.h),
                    _buildSearchBox(context),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBox(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(
          color: Color.fromRGBO(0, 0, 0, 0.05),
          blurRadius: 10,
          offset: Offset(0, 4),
        ),
      ]),
      child: SizedBox(
        height: 50.h,
        child: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Search',
            prefixIcon: const Icon(Icons.search),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                  // color: Color(0XFFD7D7EA)
                  style: BorderStyle.solid,
                  color: Color(0XFFD7D7EA),
                  width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                  // color: Color(0XFFD7D7EA)
                  style: BorderStyle.solid,
                  color: Color(0XFFD7D7EA),
                  width: 1),
            ),
            filled: true,
            fillColor: Colors.white,
          ),
          onSubmitted: (value) => _performSearch(context),
        ),
      ),
    );
  }

  void _performSearch(BuildContext context) {
    final searchModel = Provider.of<SearchProvider>(context, listen: false);
    searchModel.search(_searchController.text);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchResultsScreen(
          searchedQuery: _searchController.text,
        ),
      ),
    );
  }
}
