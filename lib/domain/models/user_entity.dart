class UserEntity {
  final String uid;
  final String email;
  final String? displayName;
  final String? photoUrl;

  UserEntity({
    required this.uid,
    required this.email,
    this.displayName,
    this.photoUrl,
  });

  factory UserEntity.fromMap(Map<String, dynamic> map) {
    return UserEntity(
        uid: map['uid'],
        email: map['email'],
        displayName: map['displayName'],
        photoUrl: map['photoUrl']
    );
  }
}