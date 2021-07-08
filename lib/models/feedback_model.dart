class FeedbackForm {
  String action;
  String id;
  String name;
  String date;
  String event;

  FeedbackForm({this.id, this.name, this.date, this.event});

  String toParams() => "?action=push_data&id=$id&name=$name&date=$date&event=$event";
}
