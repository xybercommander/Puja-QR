class SearchForm {
  String action;
  String uuid;

  SearchForm({this.uuid});

  String toParams() => "?action=show_data&uuid=$uuid";
}
