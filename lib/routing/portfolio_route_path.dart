/// Made by Tejas Mehta
/// Made on Saturday, May 01, 2021
/// File Name: portfolio_route_path.dart

class PortfolioRoutePath {
  final String path;

  static List<String> paths = [
    "/about",
    "/projects",
  ];

  PortfolioRoutePath.about() : path = "/about";
  PortfolioRoutePath.projects() : path = "/projects";

  PortfolioRoutePath(this.path);

  bool get isUnknown => !paths.contains(path);
}
