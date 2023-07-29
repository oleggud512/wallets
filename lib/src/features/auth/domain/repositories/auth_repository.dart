abstract interface class AuthRepository {
  Future<String?> signInWithEmailAndPassword(String email, String password);
  Future<String?> registerWithEmailAndPassword(String email, String password);
  Future<void> signOut();
  Future<void> deleteAccount(String email, String password);
  Future<void> sendVerificationEmail();
}