class AuthService {
  String usuarioCadastrado = "admin@ecotrack.com";
  String senhaCadastrada = "admin0";

  bool login(String email, String password) {
    if (email != this.usuarioCadastrado) {
      return false;
    }

    if (password != this.senhaCadastrada) {
      return false;
    }

    return true;
  }

  bool register(String email, String password) {
    this.usuarioCadastrado = email;
    this.senhaCadastrada = password;
    return true;
  }
}
