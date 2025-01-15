// cookie_hacked_properties.dart

class CookieHackedProperties {
  String name;
  String value;
  DateTime? expiration;
  String path;
  bool httpOnly;
  bool secure;

  CookieHackedProperties({
    required this.name,
    required this.value,
    this.expiration,
    required this.path,
    this.httpOnly = false,
    this.secure = false,
  });

  // Method to check if the cookie is expired
  bool isExpired() {
    if (expiration == null) {
      return false; // No expiration set, cookie is not expired
    }
    return DateTime.now().isAfter(expiration!);
  }

  // Method to represent the cookie as a string
  @override
  String toString() {
    return '$name=$value; Path=$path; ${httpOnly ? "HttpOnly; " : ""}${secure ? "Secure; " : ""}${expiration != null ? "Expires=${expiration!.toUtc().toIso8601String()}; " : ""}';
  }
}

void main() {
  // Example usage
  var cookie = CookieHackedProperties(
    name: 'session_id',
    value: 'abc123',
    expiration: DateTime.now().add(Duration(days: 7)), // Expires in 7 days
    path: '/',
    httpOnly: true,
    secure: true,
  );

  print(cookie);
  print('Is cookie expired? ${cookie.isExpired()}');
}
