import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/service_locator.dart';
import '../../domain/entities/profile.dart';
import '../bloc/profile_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: sl<ProfileBloc>()..add(GetProfileEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Profile"),
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
              return const Center(child: Text("Loading profile..."));
            } else {
              return const Center(child: Text("Something went wrong"));
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
    final bloc = context.read<ProfileBloc>();
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Editable fields (No Avatar)
          _buildEditableField(
            label: "Name",
            initial: profile.name,
            onSave: (val) => bloc.add(SetNameProfileEvent(name: val)),
          ),
          _buildEditableField(
            label: "Email",
            initial: profile.email,
            onSave: (val) => bloc.add(SetEmailProfileEvent(email: val)),
          ),
          _buildEditableField(
            label: "Phone",
            initial: profile.phoneNumber ?? "",
            onSave: (val) =>
                bloc.add(SetPhoneNumberProfileEvent(phoneNumber: val)),
          ),

          const SizedBox(height: 32),

          // Clear Cache Button
          ElevatedButton.icon(
            onPressed: () => bloc.add(ClearCacheProfileEvent()),
            icon: const Icon(Icons.delete_forever),
            label: const Text("Clear Cache"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
              minimumSize: const Size(double.infinity, 48),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEditableField({
    required String label,
    required String initial,
    required void Function(String) onSave,
  }) {
    final controller = TextEditingController(text: initial);
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                labelText: label,
                border: const OutlineInputBorder(),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.check, color: Colors.green),
            onPressed: () => onSave(controller.text.trim()),
          ),
        ],
      ),
    );
  }
}
