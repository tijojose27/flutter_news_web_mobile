class News {
  String sectionName;
  String webPublicationDate;
  String webTitle;
  Fields fields;

  News(
      {
      this.sectionName,
      this.webPublicationDate,
      this.webTitle,
      this.fields,});

  News.fromJson(Map<String, dynamic> json) {
    sectionName = json['sectionName'];
    webPublicationDate = json['webPublicationDate'];
    webTitle = json['webTitle'];
    fields =
        json['fields'] != null ? new Fields.fromJson(json['fields']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sectionName'] = this.sectionName;
    data['webPublicationDate'] = this.webPublicationDate;
    data['webTitle'] = this.webTitle;
    if (this.fields != null) {
      data['fields'] = this.fields.toJson();
    }
    return data;
  }
}

class Fields {
  String headline;
  String thumbnail;
  String bodyText;

  Fields(
      {this.headline,
  
      this.thumbnail,
   
      this.bodyText,
    });

  Fields.fromJson(Map<String, dynamic> json) {
    headline = json['headline'];
  
    thumbnail = json['thumbnail'];
   
    bodyText = json['bodyText'];
   
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['headline'] = this.headline;
  
    data['thumbnail'] = this.thumbnail;
  
    data['bodyText'] = this.bodyText;
   
    return data;
  }
}