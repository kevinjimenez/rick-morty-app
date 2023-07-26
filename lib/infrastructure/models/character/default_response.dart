class DefaultResponse {
    final String name;
    final String url;

    DefaultResponse({
        required this.name,
        required this.url,
    });

    factory DefaultResponse.fromJson(Map<String, dynamic> json) => DefaultResponse(
        name: json["name"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
    };
}