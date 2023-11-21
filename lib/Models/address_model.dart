class AddressDataModel {
  int? id; // Add an ID for database primary key
  String username;
  String label;
  String type;
  String delivery_address;
  String city;
  String zip_code;
  String country;
  String contact_person;
  String contact_no;

  AddressDataModel({
    this.id,
    required this.username,
    required this.label,
    required this.type,
    required this.delivery_address,
    required this.city,
    required this.zip_code,
    required this.country,
    required this.contact_person,
    required this.contact_no,
  });

  // Named constructor for null initialization
  AddressDataModel.nullConstructor()
      : id = null,
        username = '',
        label = '',
        type = '',
        delivery_address = '',
        city = '',
        zip_code = '',
        country = '',
        contact_person = '',
        contact_no = '';

  // Rest of your class code...

  // Convert a User Data Model to a Map
  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'label': label,
      'type': type,
      'delivery_address': delivery_address,
      'city': city,
      'zip_code': zip_code,
      'country': country,
      'contact_person': contact_person,
      'contact_no': contact_no,
    };
  }

  // Create a User Data Model from a Map
  factory AddressDataModel.fromMap(Map<String, dynamic> map) {
    return AddressDataModel(
      id: map['id'],
      username: map['username'],
      label: map['label'],
      type: map['type'],
      delivery_address: map['delivery_address'],
      city: map['city'],
      zip_code: map['zip_code'],
      country: map['country'],
      contact_person: map['contact_person'],
      contact_no: map['contact_no'],
    );
  }

  @override
  String toString() {
    return 'AddressDataModel{id: $id, username: $username, label: $label, type: $type, delivery_address: $delivery_address, city: $city, zip_code: $zip_code, country: $country, contact_person: $contact_person, contact_no: $contact_no}';
  }
}
