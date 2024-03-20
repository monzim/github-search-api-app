enum Sort {
  stars('Stars', 'stars'),
  forks('Forks', 'forks'),
  updated('Updated', 'updated');

  const Sort(this.title, this.value);

  final String title;
  final String value;
}

enum Order {
  asc('Ascending', 'asc'),
  desc('Descending', 'desc');

  const Order(this.title, this.value);
  final String title;
  final String value;
}
