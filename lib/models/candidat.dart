class Candidat {
  String? name;
  String? surname;
  String? description;
  String? url;
  Candidat({this.name, this.surname, this.description, this.url});

    Map<String, dynamic> toJson() {
      return {
        "nom": name,
        "surname": surname,
        "description": description,
        "url": url,
      };
    }
}
