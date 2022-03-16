class Payload {
  List<Datum> data;

  Payload({
    this.data,
  });

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  // ignore: non_constant_identifier_names
  String stk_id;
  String org_id;
  String group_name;
  String shift_id;
  String shift_name;
  String branch_code;
  String branch_name;
  // ignore: non_constant_identifier_names
  String stk_name;
  // ignore: non_constant_identifier_names
  String sal_tr_type_id;
  // ignore: non_constant_identifier_names
  String sal_tr_type_name;
  // ignore: non_constant_identifier_names
  String curr_code;
  // ignore: non_constant_identifier_names
  String curr_name;
  String comp_code;
  String comp_name;
  Datum({
    // ignore: non_constant_identifier_names
    this.stk_id,
    // ignore: non_constant_identifier_names
    this.stk_name,
    // ignore: non_constant_identifier_names
    this.sal_tr_type_id,
    // ignore: non_constant_identifier_names
    this.sal_tr_type_name,
    // ignore: non_constant_identifier_names
    this.curr_code,
    // ignore: non_constant_identifier_names
    this.curr_name,
    this.shift_id,
    this.shift_name,
    this.org_id,
    this.group_name,
    this.comp_code,
    this.comp_name,
    this.branch_code,
    this.branch_name,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
      stk_name:json["stk_name"],
      stk_id:json["stk_id"],
      sal_tr_type_id:json["sal_tr_type_id"],
      sal_tr_type_name: json["sal_tr_type_name"],
      curr_code: json ["curr_code"],
      curr_name: json ["curr_name"],
      shift_id: json ["shift_id"],
      shift_name: json ["shift_name"],
      group_name:json ["group_name"],
      org_id:json ["org_id"],
      comp_name:json["comp_name"],
      comp_code:json["comp_code"],
      branch_code:json["branch_code"],
      branch_name: json["branch_name"],
  );

  Map<String, dynamic> toJson() => {
    "stk_id":"$stk_id",
    "stk_name":"$stk_name",
    "sal_tr_type_id":"$sal_tr_type_id",
    "sal_tr_type_name":"$sal_tr_type_name",
    "curr_code":"$curr_code",
    "curr_name" : "$curr_name",
    "shift_id":"$shift_id",
    "shift_name" : "$shift_name",
    "org_id":"$org_id",
    "group_name":"$group_name",
    "comp_code":"$comp_code",
    "comp_name":"$comp_name",
    "branch_name":"$branch_name",
    "branch_code":"$branch_name",
  };
}

class Album {
  // ignore: non_constant_identifier_names
  final int emp_id;
  // ignore: non_constant_identifier_names
  final DateTime work_date;
  // ignore: non_constant_identifier_names
  final int work_type;
  // ignore: non_constant_identifier_names
  final String start_time;
  // ignore: non_constant_identifier_names
  final String end_time;
  // ignore: non_constant_identifier_names
  final String shift_id;
  // ignore: non_constant_identifier_names
  String shift_name;
  Album(
      // ignore: non_constant_identifier_names
          {this.emp_id,
        // ignore: non_constant_identifier_names
        this.work_date,
        // ignore: non_constant_identifier_names
        this.work_type,
        // ignore: non_constant_identifier_names
        this.start_time,
        // ignore: non_constant_identifier_names
        this.end_time,
        // ignore: non_constant_identifier_names
        this.shift_id,
        // ignore: non_constant_identifier_names
        this.shift_name,
      }
      );

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      emp_id: json['emp_id'],
      work_date: json['work_date'],
      work_type: json['work_type'],
      start_time: json['start_time'],
      end_time: json['end_time'],
      shift_id: json['shift_id'],
      shift_name:json['shift_name'],
    );
  }
}

class Product {
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      emp_id:json['emp_id']??'0',
      work_date: json['work_date']??'0',
      work_type: json['work_type']??'0',
      start_time: json['start_time']??'0',
      end_time: json['end_time']??"0",
      shift_id: json['shift_id']??'0',
      created_user:json['created_user']??'0',
      created_date: json['created_date']??'0',
      changed_user:json['changed_user']??'0',
      changed_date: json['changed_date']??'0',
      // wfl_approve_flag: json['wfl_approve_flag']??"",shift_id
    );
  }
  Product(
      {
        // ignore: non_constant_identifier_names
        this.emp_id,
        // ignore: non_constant_identifier_names
        this.work_date,
        // ignore: non_constant_identifier_names
        this.work_type,
        // ignore: non_constant_identifier_names
        this.start_time,
        // ignore: non_constant_identifier_names
        this.end_time,
        // ignore: non_constant_identifier_names
        this.shift_id,
        // ignore: non_constant_identifier_names
        this.created_user,
        // ignore: non_constant_identifier_names
        this.created_date,
        // ignore: non_constant_identifier_names
        this.changed_user,
        // ignore: non_constant_identifier_names
        this.changed_date,
      });
  // ignore: non_constant_identifier_names
  final String emp_id;
  // ignore: non_constant_identifier_names
  final String work_date;
  // ignore: non_constant_identifier_names
  final String work_type;
  // ignore: non_constant_identifier_names
  final String start_time;
  // ignore: non_constant_identifier_names
  final String end_time;
  // ignore: non_constant_identifier_names
  final String shift_id;
  // ignore: non_constant_identifier_names
  final String created_user;
  // ignore: non_constant_identifier_names
  final String created_date;
  // ignore: non_constant_identifier_names
  final String changed_user;
  // ignore: non_constant_identifier_names
  final String changed_date;

}


