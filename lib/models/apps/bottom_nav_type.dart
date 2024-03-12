enum BottomNavType {
  home('/home'),
  search('/search'),
  reels('/reels'),
  account('/account');

  const BottomNavType(this.routeName);
  final String routeName;
}
