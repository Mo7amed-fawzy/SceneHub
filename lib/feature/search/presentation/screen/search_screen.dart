import 'package:ai_movie_app/feature/search/data/models/search_model.dart';
import 'package:ai_movie_app/feature/search/presentation/bloc/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/constants/endpoint_constants.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorsDark.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // Search Header
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              decoration: BoxDecoration(
                color: AppColorsDark.backgroundColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: AppColorsDark.text,
                      size: 20.sp,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColorsDark.tertiaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(
                          color: AppColorsDark.tertiaryColor.withOpacity(0.3),
                          width: 1,
                        ),
                      ),
                      child: TextField(
                        controller: _searchController,
                        focusNode: _searchFocusNode,
                        autofocus: true,
                        style: TextStyle(
                          color: AppColorsDark.text,
                          fontSize: 16.sp,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Search movies, TV shows, people...',
                          hintStyle: TextStyle(
                            color: AppColorsDark.hashedText.withOpacity(0.7),
                            fontSize: 16.sp,
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                            color: AppColorsDark.hashedText.withOpacity(0.7),
                            size: 20.sp,
                          ),
                          suffixIcon: _searchController.text.isNotEmpty
                              ? IconButton(
                                  onPressed: () {
                                    _searchController.clear();
                                    setState(() {});
                                  },
                                  icon: Icon(
                                    Icons.clear,
                                    color: AppColorsDark.hashedText.withOpacity(
                                      0.7,
                                    ),
                                    size: 20.sp,
                                  ),
                                )
                              : null,
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 12.h,
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {});
                        },
                        onSubmitted: (query) {
                          if (query.trim().isNotEmpty) {
                            context.read<SearchBloc>().add(
                              PerformSearch(query.trim()),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Search Results
            Expanded(
              child: BlocConsumer<SearchBloc, SearchState>(
                listener: (context, state) {
                  if (state is SearchError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.message),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is SearchInitial) {
                    return _buildInitialState();
                  } else if (state is SearchLoading) {
                    return _buildLoadingState();
                  } else if (state is SearchLoaded) {
                    return _buildSearchResults(state.searchResults);
                  } else if (state is SearchError) {
                    return _buildErrorState(state.message);
                  }
                  return _buildInitialState();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInitialState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search,
            size: 80.sp,
            color: AppColorsDark.hashedText.withOpacity(0.5),
          ),
          SizedBox(height: 16.h),
          Text(
            'Search for movies, TV shows, and people',
            style: TextStyle(
              color: AppColorsDark.hashedText.withOpacity(0.7),
              fontSize: 16.sp,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8.h),
          Text(
            'Type in the search box above to get started',
            style: TextStyle(
              color: AppColorsDark.hashedText.withOpacity(0.5),
              fontSize: 14.sp,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(color: AppColorsDark.selectedIcon),
          SizedBox(height: 16.h),
          Text(
            'Searching...',
            style: TextStyle(color: AppColorsDark.text, fontSize: 16.sp),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 80.sp,
            color: Colors.red.withOpacity(0.7),
          ),
          SizedBox(height: 16.h),
          Text(
            'Something went wrong',
            style: TextStyle(
              color: AppColorsDark.text,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            message,
            style: TextStyle(
              color: AppColorsDark.hashedText.withOpacity(0.7),
              fontSize: 14.sp,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 24.h),
          ElevatedButton(
            onPressed: () {
              if (_searchController.text.trim().isNotEmpty) {
                context.read<SearchBloc>().add(
                  PerformSearch(_searchController.text.trim()),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColorsDark.selectedIcon,
              foregroundColor: AppColorsDark.text,
            ),
            child: const Text('Try Again'),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchResults(SearchingModel searchResults) {
    final results = searchResults.results ?? [];

    if (results.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search_off,
              size: 80.sp,
              color: AppColorsDark.hashedText.withOpacity(0.5),
            ),
            SizedBox(height: 16.h),
            Text(
              'No results found',
              style: TextStyle(
                color: AppColorsDark.text,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'Try searching with different keywords',
              style: TextStyle(
                color: AppColorsDark.hashedText.withOpacity(0.7),
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(16.w),
          child: Text(
            '${results.length} result${results.length != 1 ? 's' : ''} found',
            style: TextStyle(
              color: AppColorsDark.text,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            itemCount: results.length,
            itemBuilder: (context, index) {
              final result = results[index];
              return _buildSearchResultItem(result);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSearchResultItem(result) {
    String title = '';
    String subtitle = '';
    String imagePath = '';
    String mediaType = result.mediaType ?? 'unknown';

    // Determine title, subtitle, and image based on media type
    switch (mediaType) {
      case 'movie':
        title = result.title ?? result.originalTitle ?? 'Unknown Movie';
        subtitle = result.releaseDate != null
            ? 'Movie • ${result.releaseDate!.split('-')[0]}'
            : 'Movie';
        imagePath = result.posterPath ?? '';
        break;
      case 'tv':
        title = result.name ?? result.originalName ?? 'Unknown TV Show';
        subtitle = result.firstAirDate != null
            ? 'TV Show • ${result.firstAirDate!.split('-')[0]}'
            : 'TV Show';
        imagePath = result.posterPath ?? '';
        break;
      case 'person':
        title = result.name ?? 'Unknown Person';
        subtitle = result.knownForDepartment ?? 'Person';
        imagePath = result.profilePath ?? '';
        break;
      default:
        title = result.name ?? result.title ?? 'Unknown';
        subtitle = mediaType;
        imagePath = result.posterPath ?? result.profilePath ?? '';
    }

    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        color: AppColorsDark.tertiaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: AppColorsDark.tertiaryColor.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: InkWell(
        onTap: () {
          if (result.id != null && mediaType != 'person') {
            // Navigate to details screen
            // You can implement navigation here based on your routing system
          }
        },
        borderRadius: BorderRadius.circular(12.r),
        child: Padding(
          padding: EdgeInsets.all(12.w),
          child: Row(
            children: [
              // Poster/Profile Image
              ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: Container(
                  width: 80.w,
                  height: 120.h,
                  decoration: BoxDecoration(
                    color: AppColorsDark.tertiaryColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: imagePath.isNotEmpty
                      ? Image.network(
                          '${EndpointConstants.imageBaseUrl}$imagePath',
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return _buildPlaceholderImage(mediaType);
                          },
                        )
                      : _buildPlaceholderImage(mediaType),
                ),
              ),
              SizedBox(width: 12.w),
              // Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: AppColorsDark.text,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: AppColorsDark.hashedText.withOpacity(0.8),
                        fontSize: 14.sp,
                      ),
                    ),
                    if (result.voteAverage != null && result.voteAverage! > 0)
                      Padding(
                        padding: EdgeInsets.only(top: 4.h),
                        child: Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber, size: 16.sp),
                            SizedBox(width: 4.w),
                            Text(
                              result.voteAverage!.toStringAsFixed(1),
                              style: TextStyle(
                                color: AppColorsDark.text,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    if (result.overview != null && result.overview!.isNotEmpty)
                      Padding(
                        padding: EdgeInsets.only(top: 8.h),
                        child: Text(
                          result.overview!,
                          style: TextStyle(
                            color: AppColorsDark.hashedText.withOpacity(0.7),
                            fontSize: 12.sp,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                  ],
                ),
              ),
              // Media type indicator
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: _getMediaTypeColor(mediaType).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(4.r),
                ),
                child: Text(
                  _getMediaTypeLabel(mediaType),
                  style: TextStyle(
                    color: _getMediaTypeColor(mediaType),
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlaceholderImage(String mediaType) {
    IconData icon;
    switch (mediaType) {
      case 'movie':
        icon = Icons.movie;
        break;
      case 'tv':
        icon = Icons.tv;
        break;
      case 'person':
        icon = Icons.person;
        break;
      default:
        icon = Icons.help_outline;
    }

    return Container(
      width: 80.w,
      height: 120.h,
      color: AppColorsDark.tertiaryColor.withOpacity(0.3),
      child: Icon(
        icon,
        color: AppColorsDark.hashedText.withOpacity(0.6),
        size: 30.sp,
      ),
    );
  }

  Color _getMediaTypeColor(String mediaType) {
    switch (mediaType) {
      case 'movie':
        return Colors.blue;
      case 'tv':
        return Colors.green;
      case 'person':
        return Colors.orange;
      default:
        return AppColorsDark.hashedText;
    }
  }

  String _getMediaTypeLabel(String mediaType) {
    switch (mediaType) {
      case 'movie':
        return 'MOVIE';
      case 'tv':
        return 'TV';
      case 'person':
        return 'PERSON';
      default:
        return 'OTHER';
    }
  }
}
