class Gallery {
  late int? id;
  late String? url;

  Gallery({
    this.id,
    this.url,
  });

  Gallery.fromJson(Map<String, dynamic> json){
    id = json['id'];
    url = json['url'];
  }

  Map<String, dynamic> toJson (){
    return {
      'id': id,
      'url': url,
    };
  }
}
