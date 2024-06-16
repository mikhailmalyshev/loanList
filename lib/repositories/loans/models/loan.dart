class Loan {
  final int id;
  final String name;
  final Mfo mfo;
  final String termOfCreditString;
  final String amountString;

  Loan({
    required this.id,
    required this.name,
    required this.mfo,
    required this.termOfCreditString,
    required this.amountString,
  });

    factory Loan.fromJson(Map<String, dynamic> json) {
    final mfo = Mfo.fromJson(json['mfo']);
    return Loan(
      id: json['id'],
      name: json['name'],
      mfo: mfo,
      termOfCreditString: json['term_of_credit_string'],
      amountString: json['amount_string'],
      );
      }
}

class Mfo {
  final int id;
  final String name;
  final String fullName;
  final String iconUrl;
  final String previewText;
  /// сделать опциональным final String detailText;
  final List<Phone> phones;

  Mfo({
    required this.id,
    required this.name,
    required this.fullName,
    required this.iconUrl,
    required this.previewText,
    required this.phones,
  });

    factory Mfo.fromJson(Map<String, dynamic> json) {
    return Mfo(
      id: json['id'],
      name: json['name'],
      fullName: json['name_full'],
      iconUrl: json['icon_url'],
      previewText: json['preview_text'],
      phones: List<Phone>.from(json['phones'].map((x) => Phone.fromJson(x))),
    );
  }
}

class Phone {
  final String phone;
  final dynamic description;

  Phone({
    required this.phone,
    this.description,
  });

    factory Phone.fromJson(Map<String, dynamic> json) => Phone(
        phone: json['phone'],
        description: json['description'],
      );
}
