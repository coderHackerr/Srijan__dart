// Mixin for user authentication
mixin Authenticator {
  bool authenticateUser(String username, String password) {
    // Here you can implement your authentication logic
    // For simplicity, let's assume username and password are valid if they are not empty
    return username.isNotEmpty && password.isNotEmpty;
  }
}

// Mixin for user authorization
mixin AuthorizationManager {
  bool authorizeAccess(String role, String resource) {
    // Here you can implement your authorization logic
    // For simplicity, let's assume all users have access to all resources
    return true;
  }
}

// User class implementing Authenticator and AuthorizationManager mixins
class User with Authenticator, AuthorizationManager {
  String username;
  String password;
  String role;

  User(this.username, this.password, this.role);

  // Method to perform user login
  bool login(String username, String password) {
    return authenticateUser(username, password);
  }

  // Method to check access to a resource
  bool hasAccessToResource(String resource) {
    return authorizeAccess(role, resource);
  }
}

void main() {
  // Create a user
  var user = User("john_doe", "password123", "admin");

  // Attempt login
  var loggedIn = user.login("john_doe", "password123");
  print("Login successful: $loggedIn");

  // Check access to a resource
  var resourceAccess = user.hasAccessToResource("admin_dashboard");
  print("Has access to resource: $resourceAccess");
}
