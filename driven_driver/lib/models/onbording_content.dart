class OnbordingContent {
  String asset;
  String title;
  String description;

  OnbordingContent(
      {required this.asset, required this.title, required this.description});
}

List<OnbordingContent> content = [
  OnbordingContent(
    title: "Bookings",
    asset:
        "https://lottie.host/2327e1a1-8151-40a0-9fbb-0f56ffe2a0dc/glfE2rLgni.json",
    description: "Select a date and time, suitable for your schedule",
  ),
  OnbordingContent(
    title: "Safe Rides",
    asset:
        "https://lottie.host/f872fa4f-2427-437a-91a1-1d82c1699aa7/oFjVyHic5a.json",
    description:
        "With Geo-location enabled, you can share your ride details as well as your location on the move.",
  ),
  OnbordingContent(
    title: "In-App Communication",
    asset:
        "https://lottie.host/d3848a81-556d-45bf-afd2-db8405804e4d/tkbpEKp37u.json",
    description:
        "Driven Driver provides in-app seemless communication between the driver and passenger+",
  ),
];
