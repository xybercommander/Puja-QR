class FeedbackForm {

  String id;
  String name;
  String date;
  String event;

  FeedbackForm({this.id, this.name, this.date, this.event});

  String toParams() => "?id=$id&name=$name&date=$date&event=$event";

}