class GroceryMenusModel {
  bool? status;
  GroceryMenusData? data;
  String? message;

  GroceryMenusModel({this.status, this.data, this.message});

  factory GroceryMenusModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return GroceryMenusModel();

    return GroceryMenusModel(
      status: json['status'] == 'true' || json['status'] == true,
      data: json['data'] != null
          ? GroceryMenusData.fromJson(json['data'] as Map<String, dynamic>?)
          : null,
      message: json['message']?.toString(),
    );
  }
}

class GroceryMenusData {
  GroceryMenusPagination? groceryMenus;

  GroceryMenusData({this.groceryMenus});

  factory GroceryMenusData.fromJson(Map<String, dynamic>? json) {
    if (json == null) return GroceryMenusData();

    return GroceryMenusData(
      groceryMenus: json['grocery_menus'] != null
          ? GroceryMenusPagination.fromJson(
              json['grocery_menus'] as Map<String, dynamic>?,
            )
          : null,
    );
  }
}

class GroceryMenusPagination {
  int? currentPage;
  List<GroceryMenu>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<PaginationLink>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  GroceryMenusPagination({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  factory GroceryMenusPagination.fromJson(Map<String, dynamic>? json) {
    if (json == null) return GroceryMenusPagination();

    return GroceryMenusPagination(
      currentPage: json['current_page'] as int? ?? 0,
      data:
          (json['data'] as List?)
              ?.map((e) => GroceryMenu.fromJson(e as Map<String, dynamic>?))
              .toList() ??
          [],
      firstPageUrl: json['first_page_url']?.toString() ?? '',
      from: json['from'] as int? ?? 0,
      lastPage: json['last_page'] as int? ?? 0,
      lastPageUrl: json['last_page_url']?.toString() ?? '',
      links:
          (json['links'] as List?)
              ?.map((e) => PaginationLink.fromJson(e as Map<String, dynamic>?))
              .toList() ??
          [],
      nextPageUrl: json['next_page_url']?.toString() ?? '',
      path: json['path']?.toString() ?? '',
      perPage: _toInt(json['per_page']),
      prevPageUrl: json['prev_page_url']?.toString() ?? '',
      to: json['to'] as int? ?? 0,
      total: json['total'] as int? ?? 0,
    );
  }

  static int _toInt(dynamic v) =>
      v is int ? v : int.tryParse(v?.toString() ?? '') ?? 0;
}

class GroceryMenu {
  int? id;
  String? nameEn;
  String? nameAr;
  String? nameFr;
  String? image;
  String? categoryNameEn;
  String? categoryNameAr;
  String? categoryNameFr;

  GroceryMenu({
    this.id,
    this.nameEn,
    this.nameAr,
    this.nameFr,
    this.image,
    this.categoryNameEn,
    this.categoryNameAr,
    this.categoryNameFr,
  });

  factory GroceryMenu.fromJson(Map<String, dynamic>? json) {
    if (json == null) return GroceryMenu();

    return GroceryMenu(
      id: json['id'] as int? ?? 0,
      nameEn: json['name_en']?.toString() ?? '',
      nameAr: json['name_ar']?.toString() ?? '',
      nameFr: json['name_fr']?.toString() ?? '',
      image: json['image']?.toString() ?? '',
      categoryNameEn: json['category_name_en']?.toString() ?? '',
      categoryNameAr: json['category_name_ar']?.toString() ?? '',
      categoryNameFr: json['category_name_fr']?.toString() ?? '',
    );
  }
}

class PaginationLink {
  String? url;
  String? label;
  int? page;
  bool? active;

  PaginationLink({this.url, this.label, this.page, this.active});

  factory PaginationLink.fromJson(Map<String, dynamic>? json) {
    if (json == null) return PaginationLink();

    return PaginationLink(
      url: json['url']?.toString() ?? '',
      label: json['label']?.toString() ?? '',
      page: json['page'] is int
          ? json['page']
          : int.tryParse(json['page']?.toString() ?? ''),
      active: json['active'] as bool? ?? false,
    );
  }
}
