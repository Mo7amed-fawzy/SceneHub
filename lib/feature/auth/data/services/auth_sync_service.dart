import 'package:ai_movie_app/feature/auth/data/services/auth_data_orchestrator.dart';
import 'package:ai_movie_app/feature/auth/data/services/auth_network_service.dart';

/// Service responsible for synchronizing authentication data
/// between local and remote sources
class AuthSyncService {
  final AuthDataOrchestrator _dataOrchestrator;
  final AuthNetworkService _networkService;

  AuthSyncService({
    required AuthDataOrchestrator dataOrchestrator,
    required AuthNetworkService networkService,
  }) : _dataOrchestrator = dataOrchestrator,
       _networkService = networkService;

  /// Perform full data synchronization
  Future<void> performFullSync() async {
    try {
      // Check network availability first
      final isNetworkAvailable = await _networkService.isNetworkAvailable();
      if (!isNetworkAvailable) {
        // If no network, just return (offline mode)
        return;
      }

      // Sync user data
      await _dataOrchestrator.syncUserData();

      // Check authentication status
      await _dataOrchestrator.checkAuthenticationState();

      // Check email verification status
      await _dataOrchestrator.checkEmailVerification();
    } catch (e) {
      // Log error but don't fail the sync
      // TODO: Replace with proper logging service
      print('Full sync failed: $e');
    }
  }

  /// Perform background sync (lightweight)
  Future<void> performBackgroundSync() async {
    try {
      // Only check network if we haven't checked recently
      final isNetworkAvailable = await _networkService.isNetworkAvailable();
      if (!isNetworkAvailable) {
        return;
      }

      // Lightweight sync - just check auth status
      await _dataOrchestrator.checkAuthenticationState();
    } catch (e) {
      // Ignore background sync errors
      // TODO: Replace with proper logging service
      print('Background sync failed: $e');
    }
  }

  /// Force refresh all data from remote
  Future<void> forceRefresh() async {
    try {
      // Force refresh user data
      await _dataOrchestrator.fetchUserData(forceRefresh: true);

      // Force refresh authentication state
      await _dataOrchestrator.checkAuthenticationState(checkRemote: true);

      // Force refresh email verification
      await _dataOrchestrator.checkEmailVerification(checkRemote: true);
    } catch (e) {
      print('Force refresh failed: $e');
      rethrow;
    }
  }

  /// Sync specific data type
  Future<void> syncSpecificData(String dataType) async {
    try {
      switch (dataType) {
        case 'user':
          await _dataOrchestrator.syncUserData();
          break;
        case 'auth_status':
          await _dataOrchestrator.checkAuthenticationState();
          break;
        case 'email_verification':
          await _dataOrchestrator.checkEmailVerification();
          break;
        default:
          print('Unknown data type for sync: $dataType');
      }
    } catch (e) {
      // TODO: Replace with proper logging service
      print('Sync for $dataType failed: $e');
    }
  }

  /// Get sync status
  Future<SyncStatus> getSyncStatus() async {
    try {
      final isNetworkAvailable = await _networkService.isNetworkAvailable();
      final networkLatency = await _networkService.getNetworkLatency();

      return SyncStatus(
        isNetworkAvailable: isNetworkAvailable,
        networkLatency: networkLatency,
        lastSyncTime: DateTime.now(), // This could be stored and retrieved
        isSyncing: false, // This could be tracked
      );
    } catch (e) {
      return SyncStatus(
        isNetworkAvailable: false,
        networkLatency: Duration.zero,
        lastSyncTime: null,
        isSyncing: false,
      );
    }
  }
}

/// Represents the current sync status
class SyncStatus {
  final bool isNetworkAvailable;
  final Duration networkLatency;
  final DateTime? lastSyncTime;
  final bool isSyncing;

  const SyncStatus({
    required this.isNetworkAvailable,
    required this.networkLatency,
    this.lastSyncTime,
    required this.isSyncing,
  });

  bool get isHealthy =>
      isNetworkAvailable && networkLatency < const Duration(seconds: 5);
  bool get needsSync =>
      lastSyncTime == null ||
      DateTime.now().difference(lastSyncTime!) > const Duration(minutes: 30);
}
