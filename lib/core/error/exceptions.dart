// Thrown by remote datasource when Firebase fails
class AuthException implements Exception {
  final String message;
  const AuthException({required this.message});
}

// Thrown by local datasource when Drift fails
class CacheException implements Exception {
  final String message;
  const CacheException({required this.message});
}

class ProfileException implements Exception {
  final String message;
  const ProfileException({required this.message});
}