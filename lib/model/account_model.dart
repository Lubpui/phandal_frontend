class Account {
  String? username;
  String? password;
  String? email;
  String? birth;

  Account({
    this.username,
    this.password,
    this.email,
    this.birth,
  });
}

class ErrorAccount extends Account {
  String? conpassword;
  String? response;

  ErrorAccount({
    this.conpassword,
    this.response,
  });
}
