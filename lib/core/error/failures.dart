abstract class Failure {
  final String message;
  const Failure({required this.message});
}

// Auth specific failures
class InvalidEmailFailure extends Failure {
  const InvalidEmailFailure() : super(message: 'Invalid email address.');
}

class WrongPasswordFailure extends Failure {
  const WrongPasswordFailure() : super(message: 'Wrong password.');
}

class UserNotFoundFailure extends Failure {
  const UserNotFoundFailure() : super(message: 'No account found with this email.');
}

class EmailAlreadyInUseFailure extends Failure {
  const EmailAlreadyInUseFailure() : super(message: 'Email is already registered.');
}

class GoogleSignInCancelledFailure extends Failure {
  const GoogleSignInCancelledFailure() : super(message: 'Google sign in was cancelled.');
}

class NetworkFailure extends Failure {
  const NetworkFailure() : super(message: 'No internet connection.');
}

class OfflineFailure extends Failure {
  const OfflineFailure() : super(message: 'You are offline. Showing cached data.');
}

class UnknownFailure extends Failure {
  const UnknownFailure({super.message = 'Something went wrong.'});
}