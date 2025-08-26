import '../../../../core/constants/app_data_types.dart';
import '../entities/profile.dart';

abstract class ProfileRepository {
  const ProfileRepository();

  AsyncSingleDataResponse<Profile> getUser();

  AsyncVoidResponse clearCache();

  AsyncVoidResponse setName({required String name});

  AsyncVoidResponse setEmail({required String email});

  AsyncVoidResponse setPhoneNumber({required String phoneNumber});
}
