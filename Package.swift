let package = Package(
  name: "Quantities",
  targets: [
    Target(name: "Quantities")
 ],
#if os(OSX)
  exclude: [
    "iOS",
    "Linux"
  ])
#elseif os(iOS)
  exclude: [
    "Linux",
    "Mac"
  ])
#elseif os(Linux)
  exclude: [
    "iOS",
    "Mac"
  ])
#endif
  