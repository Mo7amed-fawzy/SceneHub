abstract class AuthRepository {
  dynamic getCurrentUser();
}
//! The domain layer must not depend on any external library (as per the principles of Clean Architecture).