import 'dart:convert';

class UserModel{
  final int id;
  final String name;
  final String email;
  final int totalAlbum;
  final int totalStickers;
  final int totalDuplicates;
  final int totalComplete;
  final int totalCompletePercent;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.totalAlbum,
    required this.totalStickers,
    required this.totalDuplicates,
    required this.totalComplete,
    required this.totalCompletePercent,
  });

  Map<String, dynamic> toMap(){
    return{
      'id': id,
      'name': name,
      'email': email,
      'totalAlbum': totalAlbum,
      'totalStickers': totalStickers,
      'totalDuplicates': totalDuplicates,
      'totalComplete': totalComplete,
      'totalCompletePercent': totalCompletePercent,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map){
    return UserModel(
        id: map['id']?.toInt() ?? '',
        name: map['name'] ?? '',
        email: map['email'] ?? '',
        totalAlbum: map['total_album']?.toInt() ?? '',
        totalStickers: map['total_stickers']?.toInt() ?? '',
        totalDuplicates: map['total_duplicates']?.toInt() ?? '',
        totalComplete: map['total_complete']?.toInt() ?? '',
        totalCompletePercent: map['total_complete_percent']?.toInt() ?? ''
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));

}