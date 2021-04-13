class DealHotEntity {
  List<Data> data;
  List<Categories> categories;
  List<Tabs> tabs;
  String version;

  DealHotEntity({this.data, this.categories, this.tabs, this.version});

  DealHotEntity.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = new List<Categories>();
      json['categories'].forEach((v) {
        categories.add(new Categories.fromJson(v));
      });
    }
    if (json['tabs'] != null) {
      tabs = new List<Tabs>();
      json['tabs'].forEach((v) {
        tabs.add(new Tabs.fromJson(v));
      });
    }
    version = json['version'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    if (this.categories != null) {
      data['categories'] = this.categories.map((v) => v.toJson()).toList();
    }
    if (this.tabs != null) {
      data['tabs'] = this.tabs.map((v) => v.toJson()).toList();
    }
    data['version'] = this.version;
    return data;
  }
}

class Data {
  int dealId;
  String dealStatus;
  int dealVersion;
  int status;
  String url;
  String tags;
  int discountPercent;
  int specialPrice;
  int specialFromDate;
  String fromDate;
  int specialToDate;
  Progress progress;
  Product product;

  Data(
      {this.dealId,
        this.dealStatus,
        this.dealVersion,
        this.status,
        this.url,
        this.tags,
        this.discountPercent,
        this.specialPrice,
        this.specialFromDate,
        this.fromDate,
        this.specialToDate,
        this.progress,
        this.product});

  Data.fromJson(Map<String, dynamic> json) {
    dealId = json['deal_id'];
    dealStatus = json['deal_status'];
    dealVersion = json['deal_version'];
    status = json['status'];
    url = json['url'];
    tags = json['tags'];
    discountPercent = json['discount_percent'];
    specialPrice = json['special_price'];
    specialFromDate = json['special_from_date'];
    fromDate = json['from_date'];
    specialToDate = json['special_to_date'];
    progress = json['progress'] != null
        ? new Progress.fromJson(json['progress'])
        : null;
    product =
    json['product'] != null ? new Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['deal_id'] = this.dealId;
    data['deal_status'] = this.dealStatus;
    data['deal_version'] = this.dealVersion;
    data['status'] = this.status;
    data['url'] = this.url;
    data['tags'] = this.tags;
    data['discount_percent'] = this.discountPercent;
    data['special_price'] = this.specialPrice;
    data['special_from_date'] = this.specialFromDate;
    data['from_date'] = this.fromDate;
    data['special_to_date'] = this.specialToDate;
    if (this.progress != null) {
      data['progress'] = this.progress.toJson();
    }
    if (this.product != null) {
      data['product'] = this.product.toJson();
    }
    return data;
  }
}

class Progress {
  int qty;
  int qtyOrdered;
  int qtyRemain;
  int percent;
  String status;
  String progressText;

  Progress(
      {this.qty,
        this.qtyOrdered,
        this.qtyRemain,
        this.percent,
        this.status,
        this.progressText});

  Progress.fromJson(Map<String, dynamic> json) {
    qty = json['qty'];
    qtyOrdered = json['qty_ordered'];
    qtyRemain = json['qty_remain'];
    percent = json['percent'];
    status = json['status'];
    progressText = json['progress_text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['qty'] = this.qty;
    data['qty_ordered'] = this.qtyOrdered;
    data['qty_remain'] = this.qtyRemain;
    data['percent'] = this.percent;
    data['status'] = this.status;
    data['progress_text'] = this.progressText;
    return data;
  }
}

class Product {
  int id;
  Null sku;
  String name;
  String urlPath;
  int price;
  int listPrice;
  List<Null> badges;
  int discount;
  int ratingAverage;
  int reviewCount;
  int orderCount;
  String thumbnailUrl;
  bool isVisible;
  bool isFresh;
  bool isFlower;
  bool isGiftCard;
  Inventory inventory;
  String urlAttendantInputForm;
  int masterId;
  int sellerProductId;
  String pricePrefix;

  Product(
      {this.id,
        this.sku,
        this.name,
        this.urlPath,
        this.price,
        this.listPrice,
        this.badges,
        this.discount,
        this.ratingAverage,
        this.reviewCount,
        this.orderCount,
        this.thumbnailUrl,
        this.isVisible,
        this.isFresh,
        this.isFlower,
        this.isGiftCard,
        this.inventory,
        this.urlAttendantInputForm,
        this.masterId,
        this.sellerProductId,
        this.pricePrefix});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sku = json['sku'];
    name = json['name'];
    urlPath = json['url_path'];
    price = json['price'];
    listPrice = json['list_price'];
    discount = json['discount'];
    ratingAverage = json['rating_average'];
    reviewCount = json['review_count'];
    orderCount = json['order_count'];
    thumbnailUrl = json['thumbnail_url'];
    isVisible = json['is_visible'];
    isFresh = json['is_fresh'];
    isFlower = json['is_flower'];
    isGiftCard = json['is_gift_card'];
    inventory = json['inventory'] != null
        ? new Inventory.fromJson(json['inventory'])
        : null;
    urlAttendantInputForm = json['url_attendant_input_form'];
    masterId = json['master_id'];
    sellerProductId = json['seller_product_id'];
    pricePrefix = json['price_prefix'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sku'] = this.sku;
    data['name'] = this.name;
    data['url_path'] = this.urlPath;
    data['price'] = this.price;
    data['list_price'] = this.listPrice;
    data['discount'] = this.discount;
    data['rating_average'] = this.ratingAverage;
    data['review_count'] = this.reviewCount;
    data['order_count'] = this.orderCount;
    data['thumbnail_url'] = this.thumbnailUrl;
    data['is_visible'] = this.isVisible;
    data['is_fresh'] = this.isFresh;
    data['is_flower'] = this.isFlower;
    data['is_gift_card'] = this.isGiftCard;
    if (this.inventory != null) {
      data['inventory'] = this.inventory.toJson();
    }
    data['url_attendant_input_form'] = this.urlAttendantInputForm;
    data['master_id'] = this.masterId;
    data['seller_product_id'] = this.sellerProductId;
    data['price_prefix'] = this.pricePrefix;
    return data;
  }
}

class Inventory {
  Null productVirtualType;
  String fulfillmentType;

  Inventory({this.productVirtualType, this.fulfillmentType});

  Inventory.fromJson(Map<String, dynamic> json) {
    productVirtualType = json['product_virtual_type'];
    fulfillmentType = json['fulfillment_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_virtual_type'] = this.productVirtualType;
    data['fulfillment_type'] = this.fulfillmentType;
    return data;
  }
}

class Categories {
  int id;
  String queryValue;
  String name;
  String thumbnailUrl;

  Categories({this.id, this.queryValue, this.name, this.thumbnailUrl});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    queryValue = json['query_value'];
    name = json['name'];
    thumbnailUrl = json['thumbnail_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['query_value'] = this.queryValue;
    data['name'] = this.name;
    data['thumbnail_url'] = this.thumbnailUrl;
    return data;
  }
}

class Tabs {
  int queryValue;
  String fromDate;
  String toDate;
  String display;
  bool active;

  Tabs(
      {this.queryValue, this.fromDate, this.toDate, this.display, this.active});

  Tabs.fromJson(Map<String, dynamic> json) {
    queryValue = json['query_value'];
    fromDate = json['from_date'];
    toDate = json['to_date'];
    display = json['display'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['query_value'] = this.queryValue;
    data['from_date'] = this.fromDate;
    data['to_date'] = this.toDate;
    data['display'] = this.display;
    data['active'] = this.active;
    return data;
  }
}