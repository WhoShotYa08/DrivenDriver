class OnbordingContent {
  String asset;
  String title;
  String description;

  OnbordingContent(
      {required this.asset, required this.title, required this.description});
}

List<OnbordingContent> content = [
  OnbordingContent(
    title: "This is the first title",
    asset:
        "https://lottie.host/ccefdb59-1052-4b05-a2b9-3ad3d7de0fa1/TdHArGc987.json",
    description: "subtitle goes in here",
  ),
  OnbordingContent(
    title: "Safe Rides",
    asset:
        "https://lottie.host/f872fa4f-2427-437a-91a1-1d82c1699aa7/oFjVyHic5a.json",
    description:
        "With Geo-location enabled, you can share your ride details as well as your location on the move.",
  ),
  OnbordingContent(
    title: "Communication",
    asset:
        "https://lottie.host/d3848a81-556d-45bf-afd2-db8405804e4d/tkbpEKp37u.json",
    description: "Driven Driver provides in-app seemless communication between the driver and passenger+",
  ),
];
