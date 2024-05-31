class UserClassmodel {
  String? id;
  String? username;
  String? email;
  String? password;

  UserClassmodel({this.id = '', required this.email, required this.password,
      required this.username});

  Map<String, dynamic> toFireStore() {
    return {
      'id': id,
      'username':username,
      'email': email,
      'password': password,
    };
  }

  UserClassmodel.fromfirestore(Map<String, dynamic>data):this(
    id: data['id'] ,
    username:data['username'] ,
    email: data['email']  ,
    password: data['password'] ,
  );
}