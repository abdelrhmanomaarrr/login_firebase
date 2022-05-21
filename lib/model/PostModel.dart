
class PostModel {
  String? uId ;
  String? uName ;
  String? uImage ;
  String? postImage;
  String? postText ;
  String? dateTime ;
  String? postID ;


  PostModel({this.postID,this.uId, this.uName, this.uImage, this.postImage, this.postText, this.dateTime});

  PostModel.fromJson(Map<String,dynamic>? json){
    uId = json!['id'];
    uName = json['uName'];
    uImage = json['uImage'];
    postImage = json['postImage'];
    postText = json['postText'];
    dateTime = json['dateTime'];
    postID = json['postID'];

  }

  Map<String,dynamic> toMap(){
    return {
      'id':uId ,
      'uName':uName ,
      'uImage':uImage ,
      'postImage':postImage ,
      'postText':postText ,
      'dateTime':dateTime,
      'postID':postID,
    };
  }
}