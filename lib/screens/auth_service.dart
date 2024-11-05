import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  // Registers a new user if the username is not already in use
  Future<bool> registerUser(String username, String password) async {
    try {
      // Check if the user already exists
      bool userExists = await checkIfUserExists(username);
      if (userExists) {
        return false; // Registration failed due to existing username
      } else {
        // Register the new user
        await registerNewUser(username, password);
        return true; // Registration successful
      }
    } catch (e) {
      print("Registration error: $e");
      return false; // Return false if any error occurs during registration
    }
  }

  // Helper method to check if a username already exists
  Future<bool> checkIfUserExists(String username) async {
    final prefs = await SharedPreferences.getInstance();
    // Check if the username key exists in SharedPreferences
    return prefs.containsKey('user_$username');
  }

  // Helper method to register a new user by storing credentials
  Future<void> registerNewUser(String username, String password) async {
    final prefs = await SharedPreferences.getInstance();
    // Save the username and password to SharedPreferences
    await prefs.setString('user_$username', password);
  }

  // Logs in the user by checking stored credentials
  Future<bool> loginUser(String username, String password) async {
    final prefs = await SharedPreferences.getInstance();
    // Retrieve the stored password for the given username
    final storedPassword = prefs.getString('user_$username');
    // Check if the password matches
    return storedPassword != null && storedPassword == password;
  }
}
