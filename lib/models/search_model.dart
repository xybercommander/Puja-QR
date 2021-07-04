class SearchForm {

  String uuid;

  SearchForm({this.uuid});

  String toParams() => "?uuid=$uuid";

}