import 'package:flutter/material.dart';
import 'package:ai_movie_app/feature/auth/presentation/manager/auth_presentation_manager.dart';

/// Base class for all authentication views
abstract class BaseAuthView extends StatelessWidget {
  const BaseAuthView({super.key});

  /// Get the presentation manager instance
  AuthPresentationManager get presentationManager => AuthPresentationManager();

  /// Build the main content of the view
  Widget buildContent(BuildContext context);

  /// Build the app bar (optional)
  PreferredSizeWidget? buildAppBar(BuildContext context) => null;

  /// Build the background decoration
  BoxDecoration? buildBackgroundDecoration() => null;

  /// Get the page title
  String get pageTitle;

  /// Get the page subtitle (optional)
  String? get pageSubtitle => null;

  /// Get the background image (optional)
  String? get backgroundImage => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Container(
        decoration: buildBackgroundDecoration(),
        child: SafeArea(
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              // Header section
              if (backgroundImage != null)
                SliverToBoxAdapter(child: _buildHeaderSection(context)),

              // Content section
              SliverToBoxAdapter(
                child: Padding(
                  padding: presentationManager.buildResponsivePadding(context),
                  child: buildContent(context),
                ),
              ),

              // Bottom spacing
              SliverToBoxAdapter(
                child: SizedBox(
                  height: presentationManager.buildResponsiveSpacing(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Build the header section with background image and title
  Widget _buildHeaderSection(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(backgroundImage!),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                pageTitle,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (pageSubtitle != null) ...[
                const SizedBox(height: 8),
                Text(
                  pageSubtitle!,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  /// Build a responsive container with proper constraints
  Widget buildResponsiveContainer({
    required Widget child,
    EdgeInsetsGeometry? padding,
    double? maxWidth,
  }) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth ?? 400),
        child: Padding(padding: padding ?? EdgeInsets.zero, child: child),
      ),
    );
  }

  /// Build a section with title and content
  Widget buildSection({
    required String title,
    required Widget content,
    EdgeInsetsGeometry? padding,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Padding(padding: padding ?? EdgeInsets.zero, child: content),
      ],
    );
  }
}
