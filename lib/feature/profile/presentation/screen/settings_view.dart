import 'package:ai_movie_app/feature/profile/presentation/bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  bool notificationsEnabled = true;
  String selectedLanguage = 'English';
  String selectedCountry = 'Saudi Arabia';

  final List<String> languages = ['English', 'Arabic'];
  final List<String> countries = ['Saudi Arabia', 'Egypt', 'UAE', 'USA'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF181727),
      appBar: AppBar(
        backgroundColor: const Color(0xFF181727),
        title: const Text("Settings", style: TextStyle(color: Colors.white)),
      ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "General",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SwitchListTile(
            title: const Text(
              "Enable Notifications",
              style: TextStyle(color: Colors.white),
            ),
            value: notificationsEnabled,
            onChanged: (bool value) {
              setState(() => notificationsEnabled = value);
              // TODO: Persist notification setting
            },
            activeColor: const Color(0xFF1EC6B6),
            tileColor: const Color(0xFF232138),
          ),
          ListTile(
            title: const Text(
              "Language",
              style: TextStyle(color: Colors.white),
            ),
            trailing: DropdownButton<String>(
              value: selectedLanguage,
              dropdownColor: const Color(0xFF232138),
              items: languages
                  .map(
                    (lang) => DropdownMenuItem(
                      value: lang,
                      child: Text(
                        lang,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                if (value != null) setState(() => selectedLanguage = value);
                // TODO: Handle language change
              },
            ),
            tileColor: const Color(0xFF232138),
          ),
          ListTile(
            title: const Text("Country", style: TextStyle(color: Colors.white)),
            trailing: DropdownButton<String>(
              value: selectedCountry,
              dropdownColor: const Color(0xFF232138),
              items: countries
                  .map(
                    (country) => DropdownMenuItem(
                      value: country,
                      child: Text(
                        country,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                if (value != null) setState(() => selectedCountry = value);
                // TODO: Handle country change
              },
            ),
            tileColor: const Color(0xFF232138),
          ),
          BlocConsumer<ProfileBloc, ProfileState>(
            listenWhen: (prev, curr) =>
                curr is ClearCacheProfileSuccess ||
                curr is ClearCacheProfileError,
            listener: (context, state) {
              if (state is ClearCacheProfileSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Cache cleared successfully')),
                );
              }
              if (state is ClearCacheProfileError) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.message)));
              }
            },
            builder: (context, state) {
              bool loading = state is ClearCacheProfileLoading;
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF232138),
                    foregroundColor: Colors.white,
                  ),
                  icon: const Icon(
                    Icons.delete_forever,
                    color: Color(0xFF1EC6B6),
                  ),
                  label: loading
                      ? const SizedBox(
                          height: 18,
                          width: 18,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Text("Clear Cache"),
                  onPressed: loading
                      ? null
                      : () {
                          context.read<ProfileBloc>().add(
                            ClearCacheProfileEvent(),
                          );
                        },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
