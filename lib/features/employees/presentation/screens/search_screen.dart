import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:girman_technologies/core/functions/app_functions.dart';
import 'package:girman_technologies/core/theme/app_theme.dart';
import 'package:girman_technologies/features/employees/presentation/widgets/custom_grid_layout.dart';
import 'package:girman_technologies/gen/assets.gen.dart';
import 'package:provider/provider.dart';
import '../providers/search_provider.dart';
import '../widgets/employee_card.dart';

class SearchResultsScreen extends StatefulWidget {
  const SearchResultsScreen({super.key, this.searchedQuery});

  final String? searchedQuery;

  @override
  State<SearchResultsScreen> createState() => _SearchResultsScreenState();
}

class _SearchResultsScreenState extends State<SearchResultsScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    if (widget.searchedQuery != null) {
      _searchController.text = widget.searchedQuery!;
    }
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppFunctions.buildAppBar(context),
      body: Consumer<SearchProvider>(
        builder: (context, searchModel, child) {
          return DecoratedBox(
            decoration: AppTheme.kScaffoldBodyStyle,
            child: Padding(
              padding: EdgeInsets.fromLTRB(28.w, 37.h, 28.w, 0),
              child: Column(
                children: [
                  _buildSearchBox(context),
                  SizedBox(height: 15.h),
                  searchModel.isSearching && searchModel.searchResults.isEmpty
                      ? _buildNoResultsFound()
                      : Expanded(
                          child: CustomGridLayout(
                            itemCount: searchModel.isSearching && searchModel.searchResults.isNotEmpty
                                ? searchModel.searchResults.length
                                : searchModel.users.length,
                            crossAxisCount: screenWidth > 950
                                ? 3
                                : screenWidth > 650
                                    ? 2
                                    : 1,
                            builder: (context, index) {
                              final employee = searchModel.isSearching && searchModel.searchResults.isNotEmpty
                                  ? searchModel.searchResults[index]
                                  : searchModel.users[index];
                              return Padding(
                                padding: EdgeInsets.only(bottom: 12.3, right: screenWidth > 400 ? 12.3 : 0),
                                child: EmployeeCard(employee: employee),
                              );

                              // _buildUserCard(context, user);
                            },
                          ),
                        ),
                ],
              ),
            ),
          );
        },
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
            onChanged: (value) {
              if (value.isEmpty) {
                context.read<SearchProvider>().clearSearch();
                return;
              }
              context.read<SearchProvider>().search(value);
            }),
      ),
    );
  }

  Widget _buildNoResultsFound() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          Assets.images.noResultsFound.path,
          height: 291,
        ),
        SizedBox(height: 16),
        Text(
          'No results \nfound.',
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
