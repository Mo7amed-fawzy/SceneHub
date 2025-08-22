import 'package:ai_movie_app/core/database/cache/app_shared_preferences.dart';
import 'package:ai_movie_app/feature/profile/data/models/profile_model.dart';

import '../../../../core/constants/cache_keys.dart';
import '../../../auth/data/models/user_model.dart';

abstract class ProfileLocalDataSource {
  ///Get cached User and return as Profile
  Future<ProfileModel> getCachedUser();

  Future<void> clearCache();

  Future<void> setUserName(String name);

  Future<void> setUserEmail(String email);

  Future<void> setPhoneNumber(String phoneNumber);
}

class ProfileLocalDataSourceImplementation implements ProfileLocalDataSource {
  final AppPreferences sharedPreferences;

  ProfileLocalDataSourceImplementation({required this.sharedPreferences});

  @override
  Future<void> clearCache() async {
    try {
      await sharedPreferences.clearExceptCredentials();
    } catch (e) {
      throw Exception('Failed to clear cached user: $e');
    }
  }

  @override
  Future<ProfileModel> getCachedUser() async {
    try {
      final UserModel? user = sharedPreferences.getModel(
        CacheKeys.user,
        (json) => UserModel.fromJson(json),
      );

      if (user == null) {
        throw Exception("No cached user found");
      }

      final fullName = [
        user.firstName ?? "",
        user.lastName ?? "",
      ].where((part) => part.isNotEmpty).join(" ");

      return ProfileModel(
        name: fullName, // getter inside UserModel (see below)
        email: user.email ?? "",
      );
    } catch (e) {
      throw Exception('Failed to retrieve Profile Cached Data: $e');
    }
  }

  @override
  Future<void> setUserEmail(String email) async {
    try {
      // Update cached UserModel instead of storing separately
      final UserModel? user = sharedPreferences.getModel(
        CacheKeys.user,
        (json) => UserModel.fromJson(json),
      );

      if (user == null) {
        throw Exception("No cached user found to update email");
      }

      final updatedUser = user.copyWith(email: email);
      await sharedPreferences.saveModel(
        CacheKeys.user,
        updatedUser,
        (updatedUser) => updatedUser.toJson(),
      );
    } catch (e) {
      throw Exception('Failed to Set New Email: $e');
    }
  }

  @override
  Future<void> setUserName(String name) async {
    try {
      final UserModel? user = sharedPreferences.getModel(
        CacheKeys.user,
        (json) => UserModel.fromJson(json),
      );

      if (user == null) {
        throw Exception("No cached user found to update name");
      }

      // Split name into first/last safely
      final parts = name.trim().split(" ");
      final firstName = parts.isNotEmpty ? parts.first : "";
      final lastName = parts.length > 1 ? parts.sublist(1).join(" ") : "";

      final updatedUser = user.copyWith(
        firstName: firstName,
        lastName: lastName,
      );

      await sharedPreferences.saveModel(
        CacheKeys.user,
        updatedUser,
        (updatedUser) => updatedUser.toJson(),
      );
    } catch (e) {
      throw Exception('Failed to Set New Name: $e');
    }
  }

  @override
  Future<void> setPhoneNumber(String phoneNumber) async {
    try {
      // Update cached UserModel instead of storing separately
      final UserModel? user = sharedPreferences.getModel(
        CacheKeys.user,
        (json) => UserModel.fromJson(json),
      );

      if (user == null) {
        throw Exception("No cached user found to update Phone Number");
      }

      final updatedUser = user.copyWith(phoneNumber: phoneNumber);
      await sharedPreferences.saveModel(
        CacheKeys.user,
        updatedUser,
        (updatedUser) => updatedUser.toJson(),
      );
    } catch (e) {
      throw Exception('Failed to Set New Phone Number: $e');
    }
  }
}
