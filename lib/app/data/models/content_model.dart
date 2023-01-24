class Content {
  int? id;
  String? name;
  String? source;
  String? image;
  List<Install>? install;
  HowToUse? howToUse;
  String? desc;
  String? documentation;
  List<String>? tags;

  Content(
      {this.id,
      this.name,
      this.source,
      this.image,
      this.install,
      this.howToUse,
      this.desc,
      this.documentation,
      this.tags});

  Content.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    source = json['source'];
    image = json['image'];
    if (json['install'] != null) {
      install = <Install>[];
      json['install'].forEach((v) {
        install?.add(Install.fromJson(v));
      });
    }
    howToUse = json['how_to_use'] != null
        ? HowToUse?.fromJson(json['how_to_use'])
        : null;
    desc = json['desc'];
    documentation = json['documentation'];
    tags = json['tags'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['source'] = source;
    data['image'] = image;
    if (install != null) {
      data['install'] = install?.map((v) => v.toJson()).toList();
    }
    if (howToUse != null) {
      data['how_to_use'] = howToUse?.toJson();
    }
    data['desc'] = desc;
    data['documentation'] = documentation;
    data['tags'] = tags;
    return data;
  }
}

class Install {
  String? desc;
  String? command;

  Install({this.desc, this.command});

  Install.fromJson(Map<String, dynamic> json) {
    desc = json['desc'];
    command = json['command'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['desc'] = desc;
    data['command'] = command;
    return data;
  }
}

class HowToUse {
  String? desc;
  List<Install>? commands;

  HowToUse({this.desc, this.commands});

  HowToUse.fromJson(Map<String, dynamic> json) {
    desc = json['desc'];
    if (json['commands'] != null) {
      commands = <Install>[];
      json['commands'].forEach((v) {
        commands?.add(Install.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['desc'] = desc;
    if (commands != null) {
      data['commands'] = commands?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
