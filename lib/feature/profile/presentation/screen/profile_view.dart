import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/service_locator.dart';
import '../../domain/entities/profile.dart';
import '../bloc/profile_bloc.dart';
import 'about_us_view.dart';
import 'edit_profile_view.dart';
import 'help_feedback_view.dart';
import 'legal_policy_view.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: sl<ProfileBloc>()..add(GetProfileEvent()),
      child: Scaffold(
        backgroundColor: const Color(0xFF181727), // Dark background
        appBar: AppBar(
          backgroundColor: const Color(0xFF181727),
          title: const Text("Profile", style: TextStyle(color: Colors.white)),
          centerTitle: true,
          elevation: 0,
        ),
        body: BlocConsumer<ProfileBloc, ProfileState>(
          listenWhen: (prev, curr) =>
              curr is SetNameProfileSuccess ||
              curr is SetEmailProfileSuccess ||
              curr is SetPhoneNumberProfileSuccess ||
              curr is ClearCacheProfileSuccess ||
              curr is ProfileError ||
              curr is SetNameProfileError ||
              curr is SetEmailProfileError ||
              curr is SetPhoneNumberProfileError ||
              curr is ClearCacheProfileError,
          listener: (context, state) {
            if (state is SetNameProfileSuccess) {
              _showSnack(context, "Name updated successfully");
            }
            if (state is SetEmailProfileSuccess) {
              _showSnack(context, "Email updated successfully");
            }
            if (state is SetPhoneNumberProfileSuccess) {
              _showSnack(context, "Phone updated successfully");
            }
            if (state is ClearCacheProfileSuccess) {
              _showSnack(context, "Cache cleared successfully");
            }

            if (state is ProfileError) _showSnack(context, state.message);
            if (state is SetNameProfileError)
              _showSnack(context, state.message);
            if (state is SetEmailProfileError)
              _showSnack(context, state.message);
            if (state is SetPhoneNumberProfileError)
              _showSnack(context, state.message);
            if (state is ClearCacheProfileError)
              _showSnack(context, state.message);
          },
          buildWhen: (prev, curr) =>
              curr is ProfileInitial ||
              curr is ProfileLoading ||
              curr is ProfileLoaded,
          builder: (context, state) {
            if (state is ProfileLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProfileLoaded) {
              return _buildProfileContent(context, state.profile);
            } else if (state is ProfileInitial) {
              return const Center(
                child: Text(
                  "Loading profile...",
                  style: TextStyle(color: Colors.white),
                ),
              );
            } else {
              return const Center(
                child: Text(
                  "Something went wrong",
                  style: TextStyle(color: Colors.white),
                ),
              );
            }
          },
        ),
      ),
    );
  }

  void _showSnack(BuildContext context, String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  Widget _buildProfileContent(BuildContext context, Profile profile) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // User Card (No avatar, no premium card)
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF232138),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        profile.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        profile.email,
                        style: const TextStyle(
                          color: Color(0xFFB2B1C3),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.edit, color: Color(0xFF1EC6B6)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BlocProvider.value(
                          value: context.read<ProfileBloc>(),
                          child: EditProfilePage(
                            currentName: profile.name,
                            currentEmail: profile.email,
                            currentPhone: profile.phoneNumber ?? "",
                          ),
                        ),
                      ),
                    );
                  },
                  tooltip: "Edit Profile",
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Account Section
          _sectionHeader("Account"),
          _sectionCard([
            _listTile(icon: Icons.person, label: "Member", onTap: () {}),
            _divider(),
            _listTile(
              icon: Icons.lock_outline,
              label: "Change Password",
              onTap: () {},
            ),
          ]),

          const SizedBox(height: 24),

          // General Section
          _sectionHeader("General"),
          _sectionCard([
            _listTile(
              icon: Icons.notifications_none,
              label: "Notification",
              onTap: () {},
            ),
            _divider(),
            _listTile(icon: Icons.language, label: "Language", onTap: () {}),
            _divider(),
            _listTile(
              icon: Icons.flag_outlined,
              label: "Country",
              onTap: () {},
            ),
            _divider(),
            _listTile(
              icon: Icons.delete_outline,
              label: "Clear Cache",
              onTap: () {
                context.read<ProfileBloc>().add(ClearCacheProfileEvent());
              },
            ),
          ]),

          const SizedBox(height: 24),

          // More Section
          _sectionHeader("More"),
          _sectionCard([
            _listTile(
              icon: Icons.shield_outlined,
              label: "Legal and Policies",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const LegalPoliciesPage()),
                );
              },
            ),
            _divider(),
            _listTile(
              icon: Icons.help_outline,
              label: "Help & Feedback",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const HelpFeedbackPage()),
                );
              },
            ),
            _divider(),
            _listTile(
              icon: Icons.info_outline,
              label: "About Us",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const AboutUsPage()),
                );
              },
            ),
          ]),

          const SizedBox(height: 32),

          // Log Out button
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color(0xFF1EC6B6), width: 1.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.transparent,
              ),
              onPressed: () {
                // TODO: Add log out logic
              },
              child: const Text(
                "Log Out",
                style: TextStyle(
                  color: Color(0xFF1EC6B6),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 8),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      ),
    );
  }

  Widget _sectionCard(List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF232138),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(children: children),
    );
  }

  Widget _divider() => const Divider(
    color: Color(0xFF35344C),
    height: 0,
    thickness: 1,
    indent: 16,
    endIndent: 16,
  );

  Widget _listTile({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.white, size: 26),
      title: Text(
        label,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        color: Color(0xFF1EC6B6),
        size: 20,
      ),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    );
  }
}
