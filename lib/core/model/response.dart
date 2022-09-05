/// status : {"code":200,"message":"","validation":[]}
/// content : {"access_token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiN2FiNzkwZWRjMTNmMjUwNmQ2ZjkwMzM5YzIwNDNhMmExYTJkMTg1ZTRiYjVjNTE1ZmUwYzE4M2RkY2VmZjc5YjNkM2E0ZGEyY2NlNDQyNTciLCJpYXQiOjE2MTg5MzQ4NzMuNTYzODkyLCJuYmYiOjE2MTg5MzQ4NzMuNTYzODk2LCJleHAiOjE2NTA0NzA4NzMuNTQ0NjI5LCJzdWIiOiIzIiwic2NvcGVzIjpbXX0.bADuptcDqOwx1pt39jOlsPyKKETDpbfmaGetrawPwzMT0gX5Rw7HigokvtFv2I_mRxZsgnGM37tnFsQ_127r4mpTOTNYkEZA4FoCMFZLXtbCR99nZ2e-4qAeEamSEZ1N58ZGKvSQXrCXb988oM1U5A9xXZVjfJu4oG78Cfc9dlx-mWCx3hCTP3nQ7rgfkSkpVUxIqm5ZWY52OxA8lXxHUn0ysfT06utGK9Uc3pxznlmuI1R-fKMwWnzrYhJuqASalMt5pu15OnQx9Vn-48cu915cIHb7OqWF4IRnAxc1WdEjWAhkL8MRK7UPaR5ghdu1YZkpWcfK79W8E34gET0MMb0H0_EcwZ0Vd5mSR3dzRmY9xvQ4fl3swg1oUVmssX456T57q5CpIS0A30UtnrF7hqjWG5pYkrXktDwMEQgaP73PxRaVGvL24coSO0Of6FY7A-ZxLAZDDTBo7YSF3btYAi8ER84q74t1upIoU6gzJ3k6m8USgI0UVYUtomf7tY9eoMDQR9ELpNLaaLQEbKGdyQORFMyejfCI8umR5hpBkz6rKs64HheSw7OCo6V308JcrI8SgS5n65WYq_zZLw0EWVpJPCRv2N8lD8E73HxRb0f1UtDnY44T5bFBvqtlgxIJ9CIP1cYsx4YR_0lUeq3TBQKqOxtWRVKAMIsmnGvsktE","token_type":"Bearer","expires_at":"2022-04-20 16:07:53","user":{"name":"test user 1","email":"user1@test.com","phone":"0123456789","updated_at":"2021-04-20T16:07:53.000000Z","created_at":"2021-04-20T16:07:53.000000Z","id":3,"roles":[{"id":2,"name":"client","guard_name":"web","created_at":"2021-04-18T16:01:43.000000Z","updated_at":"2021-04-18T16:01:43.000000Z","pivot":{"model_id":3,"role_id":2,"model_type":"App\\Models\\User"}}]}}

class Response {
  Content? _content;

  Content? get content => _content;

  Response({Content? content}) {
    _content = content;
  }

  Response.fromJson(dynamic json) {
    _content =
        json["content"] != null ? Content.fromJson(json["content"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_content != null) {
      map["content"] = _content?.toJson();
    }
    return map;
  }
}

/// access_token : "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiN2FiNzkwZWRjMTNmMjUwNmQ2ZjkwMzM5YzIwNDNhMmExYTJkMTg1ZTRiYjVjNTE1ZmUwYzE4M2RkY2VmZjc5YjNkM2E0ZGEyY2NlNDQyNTciLCJpYXQiOjE2MTg5MzQ4NzMuNTYzODkyLCJuYmYiOjE2MTg5MzQ4NzMuNTYzODk2LCJleHAiOjE2NTA0NzA4NzMuNTQ0NjI5LCJzdWIiOiIzIiwic2NvcGVzIjpbXX0.bADuptcDqOwx1pt39jOlsPyKKETDpbfmaGetrawPwzMT0gX5Rw7HigokvtFv2I_mRxZsgnGM37tnFsQ_127r4mpTOTNYkEZA4FoCMFZLXtbCR99nZ2e-4qAeEamSEZ1N58ZGKvSQXrCXb988oM1U5A9xXZVjfJu4oG78Cfc9dlx-mWCx3hCTP3nQ7rgfkSkpVUxIqm5ZWY52OxA8lXxHUn0ysfT06utGK9Uc3pxznlmuI1R-fKMwWnzrYhJuqASalMt5pu15OnQx9Vn-48cu915cIHb7OqWF4IRnAxc1WdEjWAhkL8MRK7UPaR5ghdu1YZkpWcfK79W8E34gET0MMb0H0_EcwZ0Vd5mSR3dzRmY9xvQ4fl3swg1oUVmssX456T57q5CpIS0A30UtnrF7hqjWG5pYkrXktDwMEQgaP73PxRaVGvL24coSO0Of6FY7A-ZxLAZDDTBo7YSF3btYAi8ER84q74t1upIoU6gzJ3k6m8USgI0UVYUtomf7tY9eoMDQR9ELpNLaaLQEbKGdyQORFMyejfCI8umR5hpBkz6rKs64HheSw7OCo6V308JcrI8SgS5n65WYq_zZLw0EWVpJPCRv2N8lD8E73HxRb0f1UtDnY44T5bFBvqtlgxIJ9CIP1cYsx4YR_0lUeq3TBQKqOxtWRVKAMIsmnGvsktE"
/// token_type : "Bearer"
/// expires_at : "2022-04-20 16:07:53"
/// user : {"name":"test user 1","email":"user1@test.com","phone":"0123456789","updated_at":"2021-04-20T16:07:53.000000Z","created_at":"2021-04-20T16:07:53.000000Z","id":3,"roles":[{"id":2,"name":"client","guard_name":"web","created_at":"2021-04-18T16:01:43.000000Z","updated_at":"2021-04-18T16:01:43.000000Z","pivot":{"model_id":3,"role_id":2,"model_type":"App\\Models\\User"}}]}

class Content {
  String? _accessToken;
  String? _tokenType;
  String? _expiresAt;
  User? _user;

  String? get accessToken => _accessToken;

  String? get tokenType => _tokenType;

  String? get expiresAt => _expiresAt;

  User? get user => _user;

  Content(
      {String? accessToken, String? tokenType, String? expiresAt, User? user}) {
    _accessToken = accessToken;
    _tokenType = tokenType;
    _expiresAt = expiresAt;
    _user = user;
  }

  Content.fromJson(dynamic json) {
    _accessToken = json["access_token"];
    _tokenType = json["token_type"];
    _expiresAt = json["expires_at"];
    _user = json["user"] != null ? User.fromJson(json["user"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["access_token"] = _accessToken;
    map["token_type"] = _tokenType;
    map["expires_at"] = _expiresAt;
    if (_user != null) {
      map["user"] = _user?.toJson();
    }
    return map;
  }
}

/// name : "test user 1"
/// email : "user1@test.com"
/// phone : "0123456789"
/// updated_at : "2021-04-20T16:07:53.000000Z"
/// created_at : "2021-04-20T16:07:53.000000Z"
/// id : 3
/// roles : [{"id":2,"name":"client","guard_name":"web","created_at":"2021-04-18T16:01:43.000000Z","updated_at":"2021-04-18T16:01:43.000000Z","pivot":{"model_id":3,"role_id":2,"model_type":"App\\Models\\User"}}]

class User {
  String? _name;
  String? _email;
  String? _phone;
  String? _updatedAt;
  String? _createdAt;
  int? _id;
  List<Roles>? _roles;

  String? get name => _name;

  String? get email => _email;

  String? get phone => _phone;

  String? get updatedAt => _updatedAt;

  String? get createdAt => _createdAt;

  int? get id => _id;

  List<Roles>? get roles => _roles;

  User(
      {String? name,
      String? email,
      String? phone,
      String? updatedAt,
      String? createdAt,
      int? id,
      List<Roles>? roles}) {
    _name = name;
    _email = email;
    _phone = phone;
    _updatedAt = updatedAt;
    _createdAt = createdAt;
    _id = id;
    _roles = roles;
  }

  User.fromJson(dynamic json) {
    _name = json["name"];
    _email = json["email"];
    _phone = json["phone"];
    _updatedAt = json["updated_at"];
    _createdAt = json["created_at"];
    _id = json["id"];
    if (json["roles"] != null) {
      _roles = [];
      json["roles"].forEach((v) {
        _roles?.add(Roles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["name"] = _name;
    map["email"] = _email;
    map["phone"] = _phone;
    map["updated_at"] = _updatedAt;
    map["created_at"] = _createdAt;
    map["id"] = _id;
    if (_roles != null) {
      map["roles"] = _roles?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 2
/// name : "client"
/// guard_name : "web"
/// created_at : "2021-04-18T16:01:43.000000Z"
/// updated_at : "2021-04-18T16:01:43.000000Z"
/// pivot : {"model_id":3,"role_id":2,"model_type":"App\\Models\\User"}

class Roles {
  int? _id;
  String? _name;
  String? _guardName;
  String? _createdAt;
  String? _updatedAt;
  Pivot? _pivot;

  int? get id => _id;

  String? get name => _name;

  String? get guardName => _guardName;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  Pivot? get pivot => _pivot;

  Roles(
      {int? id,
      String? name,
      String? guardName,
      String? createdAt,
      String? updatedAt,
      Pivot? pivot}) {
    _id = id;
    _name = name;
    _guardName = guardName;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _pivot = pivot;
  }

  Roles.fromJson(dynamic json) {
    _id = json["id"];
    _name = json["name"];
    _guardName = json["guard_name"];
    _createdAt = json["created_at"];
    _updatedAt = json["updated_at"];
    _pivot = json["pivot"] != null ? Pivot.fromJson(json["pivot"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["name"] = _name;
    map["guard_name"] = _guardName;
    map["created_at"] = _createdAt;
    map["updated_at"] = _updatedAt;
    if (_pivot != null) {
      map["pivot"] = _pivot?.toJson();
    }
    return map;
  }
}

/// model_id : 3
/// role_id : 2
/// model_type : "App\\Models\\User"

class Pivot {
  int? _modelId;
  int? _roleId;
  String? _modelType;

  int? get modelId => _modelId;
  int? get roleId => _roleId;
  String? get modelType => _modelType;

  Pivot({int? modelId, int? roleId, String? modelType}) {
    _modelId = modelId;
    _roleId = roleId;
    _modelType = modelType;
  }

  Pivot.fromJson(dynamic json) {
    _modelId = json["model_id"];
    _roleId = json["role_id"];
    _modelType = json["model_type"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["model_id"] = _modelId;
    map["role_id"] = _roleId;
    map["model_type"] = _modelType;
    return map;
  }
}
