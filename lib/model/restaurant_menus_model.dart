class RestaurantMenusModel {
  bool? status;
  List<RestaurantMenu>? data;
  RestaurantMenusData? payload;
  String? message;
  RestaurantMenusModel({this.status, this.data, this.payload, this.message});
  factory RestaurantMenusModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return RestaurantMenusModel();
    final rawData = json['data'];
    RestaurantMenusData? parsedPayload;
    List<RestaurantMenu> parsedMenus = [];
    if (rawData is Map<String, dynamic>) {
      parsedPayload = RestaurantMenusData.fromJson(rawData);
      parsedMenus = parsedPayload.restaurantMenuItems?.data ?? [];
    } else if (rawData is List) {
      parsedMenus =
          rawData
              .map((e) => RestaurantMenu.fromJson(e as Map<String, dynamic>?))
              .toList();
    }

    return RestaurantMenusModel(
      status: json['status'] == 'true' || json['status'] == true,
      data: parsedMenus,
      payload: parsedPayload,
      message: json['message']?.toString(),
    );
  }
}

class RestaurantMenusData {
  RestaurantMenusPagination? restaurantMenuItems;
  String? limit;
  String? page;
  int? total;
  int? totalPages;

  RestaurantMenusData({
    this.restaurantMenuItems,
    this.limit,
    this.page,
    this.total,
    this.totalPages,
  });

  factory RestaurantMenusData.fromJson(Map<String, dynamic>? json) {
    if (json == null) return RestaurantMenusData();

    return RestaurantMenusData(
      restaurantMenuItems: json['restaurant_menu_items'] != null
          ? RestaurantMenusPagination.fromJson(
              json['restaurant_menu_items'] as Map<String, dynamic>?,
            )
          : null,
      limit: json['limit']?.toString(),
      page: json['page']?.toString(),
      total: _toInt(json['total']),
      totalPages: _toInt(json['total_pages']),
    );
  }

  static int _toInt(dynamic value) =>
      value is int ? value : int.tryParse(value?.toString() ?? '') ?? 0;
}

class RestaurantMenusPagination {
  int? currentPage;
  List<RestaurantMenu>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<RestaurantMenusPaginationLink>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  RestaurantMenusPagination({
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

  factory RestaurantMenusPagination.fromJson(Map<String, dynamic>? json) {
    if (json == null) return RestaurantMenusPagination();

    return RestaurantMenusPagination(
      currentPage: _toInt(json['current_page']),
      data:
          (json['data'] as List?)
              ?.map((e) => RestaurantMenu.fromJson(e as Map<String, dynamic>?))
              .toList() ??
          [],
      firstPageUrl: json['first_page_url']?.toString() ?? '',
      from: _toInt(json['from']),
      lastPage: _toInt(json['last_page']),
      lastPageUrl: json['last_page_url']?.toString() ?? '',
      links:
          (json['links'] as List?)
              ?.map(
                (e) => RestaurantMenusPaginationLink.fromJson(
                  e as Map<String, dynamic>?,
                ),
              )
              .toList() ??
          [],
      nextPageUrl: json['next_page_url']?.toString() ?? '',
      path: json['path']?.toString() ?? '',
      perPage: _toInt(json['per_page']),
      prevPageUrl: json['prev_page_url']?.toString() ?? '',
      to: _toInt(json['to']),
      total: _toInt(json['total']),
    );
  }

  static int _toInt(dynamic value) =>
      value is int ? value : int.tryParse(value?.toString() ?? '') ?? 0;
}

class RestaurantMenusPaginationLink {
  String? url;
  String? label;
  int? page;
  bool? active;

  RestaurantMenusPaginationLink({this.url, this.label, this.page, this.active});

  factory RestaurantMenusPaginationLink.fromJson(Map<String, dynamic>? json) {
    if (json == null) return RestaurantMenusPaginationLink();

    return RestaurantMenusPaginationLink(
      url: json['url']?.toString() ?? '',
      label: json['label']?.toString() ?? '',
      page: json['page'] is int
          ? json['page'] as int
          : int.tryParse(json['page']?.toString() ?? ''),
      active: json['active'] as bool? ?? false,
    );
  }
}

class RestaurantMenu {
  int? id;
  String? nameEn;
  String? nameAr;
  String? nameFr;
  String? categoryId;
  int? restaurantId;
  String? descriptionEn;
  String? descriptionAr;
  String? descriptionFr;
  String? image;
  int? isVeg;
  int? approvalStatus;
  String? createdAt;
  String? updatedAt;
  int? restaurantMenuItemId;
  String? price;
  String? discountPrice;
  int? restaurantAttributeId;
  int? itemStatus;
  int? availableStatus;
  String? attributeNameEn;
  String? attributeNameAr;
  String? attributeNameFr;
  String? itemCreatedAt;
  String? itemUpdatedAt;
  String? categoryNameEn;
  String? categoryNameAr;
  String? categoryNameFr;
  List<dynamic>? categories;

  RestaurantMenu({
    this.id,
    this.nameEn,
    this.nameAr,
    this.nameFr,
    this.categoryId,
    this.restaurantId,
    this.descriptionEn,
    this.descriptionAr,
    this.descriptionFr,
    this.image,
    this.isVeg,
    this.approvalStatus,
    this.createdAt,
    this.updatedAt,
    this.restaurantMenuItemId,
    this.price,
    this.discountPrice,
    this.restaurantAttributeId,
    this.itemStatus,
    this.availableStatus,
    this.attributeNameEn,
    this.attributeNameAr,
    this.attributeNameFr,
    this.itemCreatedAt,
    this.itemUpdatedAt,
    this.categoryNameEn,
    this.categoryNameAr,
    this.categoryNameFr,
    this.categories,
  });

  factory RestaurantMenu.fromJson(Map<String, dynamic>? json) {
    if (json == null) return RestaurantMenu();

    return RestaurantMenu(
      id: _toInt(json['id']),
      nameEn: json['name_en']?.toString() ?? '',
      nameAr: json['name_ar']?.toString() ?? '',
      nameFr: json['name_fr']?.toString() ?? '',
      categoryId: json['category_id']?.toString() ?? '',
      restaurantId: _toNullableInt(json['restaurant_id']),
      descriptionEn: json['description_en']?.toString() ?? '',
      descriptionAr: json['description_ar']?.toString() ?? '',
      descriptionFr: json['description_fr']?.toString() ?? '',
      image: json['image']?.toString() ?? '',
      isVeg: _toInt(json['is_veg']),
      approvalStatus: _toInt(json['approval_status']),
      createdAt: json['created_at']?.toString(),
      updatedAt: json['updated_at']?.toString(),
      restaurantMenuItemId: _toNullableInt(json['restaurant_menu_item_id']),
      price: json['price']?.toString() ?? '0',
      discountPrice: json['discount_price']?.toString() ?? '0',
      restaurantAttributeId: _toNullableInt(json['restaurant_attribute_id']),
      itemStatus: _toNullableInt(json['item_status']),
      availableStatus: _toNullableInt(json['available_status']),
      attributeNameEn: json['attribute_name_en']?.toString() ?? '',
      attributeNameAr: json['attribute_name_ar']?.toString() ?? '',
      attributeNameFr: json['attribute_name_fr']?.toString() ?? '',
      itemCreatedAt: json['item_created_at']?.toString(),
      itemUpdatedAt: json['item_updated_at']?.toString(),
      categoryNameEn: json['category_name_en']?.toString() ?? '',
      categoryNameAr: json['category_name_ar']?.toString() ?? '',
      categoryNameFr: json['category_name_fr']?.toString() ?? '',
      categories: (json['categories'] as List?) ?? [],
    );
  }

  static int _toInt(dynamic value) =>
      value is int ? value : int.tryParse(value?.toString() ?? '') ?? 0;

  static int? _toNullableInt(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    return int.tryParse(value.toString());
  }
}
