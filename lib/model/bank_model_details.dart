

// To parse this JSON data, do
//
//     final bankLoanDetails = bankLoanDetailsFromJson(jsonString);

import 'dart:convert';

BankLoanDetails bankLoanDetailsFromJson(String str) => BankLoanDetails.fromJson(json.decode(str));

String bankLoanDetailsToJson(BankLoanDetails data) => json.encode(data.toJson());

class BankLoanDetails {
    String title;
    String name;
    String slug;
    String description;
    BankLoanDetailsSchema schema;

    BankLoanDetails({
        required this.title,
        required this.name,
        required this.slug,
        required this.description,
        required this.schema,
    });

    factory BankLoanDetails.fromJson(Map<String, dynamic> json) => BankLoanDetails(
        title: json["title"],
        name: json["name"],
        slug: json["slug"],
        description: json["description"],
        schema: BankLoanDetailsSchema.fromJson(json["schema"]),
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "name": name,
        "slug": slug,
        "description": description,
        "schema": schema.toJson(),
    };
}

class BankLoanDetailsSchema {
    List<PurpleField> fields;

    BankLoanDetailsSchema({
     required this.fields,
    
    });

    factory BankLoanDetailsSchema.fromJson(Map<String, dynamic> json) => BankLoanDetailsSchema(
        fields: List<PurpleField>.from(json["fields"].map((x) => PurpleField.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "fields": List<dynamic>.from(fields.map((x) => x.toJson())),
    };
}

class PurpleField {
    String type;
    int version;
    PurpleSchema schema;

    PurpleField({
        required this.type,
        required this.version,
        required this.schema,
    });

    factory PurpleField.fromJson(Map<String, dynamic> json) => PurpleField(
        type: json["type"],
        version: json["version"],
        schema: PurpleSchema.fromJson(json["schema"]),
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "version": version,
        "schema": schema.toJson(),
    };
}

class PurpleSchema {
    String name;
    String label;
    dynamic hidden;
    bool? readonly;
    List<Option>? options;
    List<FluffyField>? fields;

    PurpleSchema({
        required this.name,
        required this.label,
        this.hidden,
        this.readonly,
        this.options,
        this.fields,
    });

    factory PurpleSchema.fromJson(Map<String, dynamic> json) => PurpleSchema(
        name: json["name"],
        label: json["label"],
        hidden: json["hidden"],
        readonly: json["readonly"],
        options: json["options"] == null ? [] : List<Option>.from(json["options"]!.map((x) => Option.fromJson(x))),
        fields: json["fields"] == null ? [] : List<FluffyField>.from(json["fields"]!.map((x) => FluffyField.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "label": label,
        "hidden": hidden,
        "readonly": readonly,
        "options": options == null ? [] : List<dynamic>.from(options!.map((x) => x.toJson())),
        "fields": fields == null ? [] : List<dynamic>.from(fields!.map((x) => x.toJson())),
    };
}

class FluffyField {
    String type;
    int version;
    FluffySchema schema;

    FluffyField({
        required this.type,
        required this.version,
        required this.schema,
    });

    factory FluffyField.fromJson(Map<String, dynamic> json) => FluffyField(
        type: json["type"],
        version: json["version"],
        schema: FluffySchema.fromJson(json["schema"]),
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "version": version,
        "schema": schema.toJson(),
    };
}

class FluffySchema {
    String name;
    String label;
    bool? hidden;
    bool? readonly;
    List<Option>? options;

    FluffySchema({
        required this.name,
        required this.label,
        this.hidden,
        this.readonly,
        this.options,
    });

    factory FluffySchema.fromJson(Map<String, dynamic> json) => FluffySchema(
        name: json["name"],
        label: json["label"],
        hidden: json["hidden"],
        readonly: json["readonly"],
        options: json["options"] == null ? [] : List<Option>.from(json["options"]!.map((x) => Option.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "label": label,
        "hidden": hidden,
        "readonly": readonly,
        "options": options == null ? [] : List<dynamic>.from(options!.map((x) => x.toJson())),
    };
}

class Option {
    String key;
    String value;

    Option({
        required this.key,
        required this.value,
    });

    factory Option.fromJson(Map<String, dynamic> json) => Option(
        key: json["key"],
        value: json["value"],
    );

    Map<String, dynamic> toJson() => {
        "key": key,
        "value": value,
    };
}
