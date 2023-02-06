class User{
  String id ;
  String name ;
  String email ;
  int age ;
  int num;
  String classe;
  User({this.id='',required this.name, required this.email,required this.age, required this.num, required this.classe});
  //**convertir du string to json
  Map<String, dynamic> toJson(){
    return {
      'id' : id,
      'name': name,
      'email':email,
      'age':age,
      'num':num,
      'classe':classe

    };
  }
//**convertir du json to string
factory User.fromjson(Map<String,dynamic> json){
    return User(id : json['id'], name:json['name'], email:json['email'], age:json['age'], num:json['num'], classe:json['classe']);

}
}
