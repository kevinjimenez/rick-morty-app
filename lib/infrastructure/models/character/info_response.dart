class InfoResponse {
    final int count;
    final int pages;
    final String? next;
    final String? prev;

    InfoResponse({
        required this.count,
        required this.pages,
        this.next,
        this.prev,
    });

    factory InfoResponse.fromJson(Map<String, dynamic> json) => InfoResponse(
        count: json["count"],
        pages: json["pages"],
        next: json["next"] ?? '',
        prev: json["prev"] ?? '',
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "pages": pages,
        "next": next,
        "prev": prev,
    };
}
