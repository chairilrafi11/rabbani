
class Product {
  int? idProduct;
  String? productName;
  String? productSlug;
  int? idCategory;
  String? categoryName;
  int? published;
  String? sku;
  int? weight;
  int? length;
  int? width;
  int? height;
  String? createdAt;
  String? thumbnailUrl;
  int? isRecommended;
  int? price;
  int? totalPurchased;
  dynamic rating;
  int? minPriceProductDetail;
  int? maxPriceProductDetail;
  String? stock;
  List<ProductImages>? productImages;

  Product(
      {this.idProduct,
      this.productName,
      this.productSlug,
      this.idCategory,
      this.categoryName,
      this.published,
      this.sku,
      this.weight,
      this.length,
      this.width,
      this.height,
      this.createdAt,
      this.thumbnailUrl,
      this.isRecommended,
      this.price,
      this.totalPurchased,
      this.rating,
      this.minPriceProductDetail,
      this.maxPriceProductDetail,
      this.stock,
      this.productImages});

  Product.fromJson(Map<String, dynamic> json) {
    idProduct = json['id_product'];
    productName = json['product_name'];
    productSlug = json['product_slug'];
    idCategory = json['id_category'];
    categoryName = json['category_name'];
    published = json['published'];
    sku = json['sku'];
    weight = json['weight'];
    length = json['length'];
    width = json['width'];
    height = json['height'];
    createdAt = json['created_at'];
    thumbnailUrl = json['thumbnail_url'];
    isRecommended = json['is_recommended'];
    price = json['price'];
    totalPurchased = json['total_purchased'];
    rating = json['rating'];
    minPriceProductDetail = json['min_price_product_detail'];
    maxPriceProductDetail = json['max_price_product_detail'];
    stock = json['stock'];
    if (json['product_images'] != null) {
      productImages = <ProductImages>[];
      json['product_images'].forEach((v) {
        productImages!.add(new ProductImages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_product'] = this.idProduct;
    data['product_name'] = this.productName;
    data['product_slug'] = this.productSlug;
    data['id_category'] = this.idCategory;
    data['category_name'] = this.categoryName;
    data['published'] = this.published;
    data['sku'] = this.sku;
    data['weight'] = this.weight;
    data['length'] = this.length;
    data['width'] = this.width;
    data['height'] = this.height;
    data['created_at'] = this.createdAt;
    data['thumbnail_url'] = this.thumbnailUrl;
    data['is_recommended'] = this.isRecommended;
    data['price'] = this.price;
    data['total_purchased'] = this.totalPurchased;
    data['rating'] = this.rating;
    data['min_price_product_detail'] = this.minPriceProductDetail;
    data['max_price_product_detail'] = this.maxPriceProductDetail;
    data['stock'] = this.stock;
    if (this.productImages != null) {
      data['product_images'] =
          this.productImages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductImages {
  int? idProductImage;
  int? idProduct;
  String? hostPath;
  String? urlimg;
  String? imagePath;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  ProductImages(
      {this.idProductImage,
      this.idProduct,
      this.hostPath,
      this.urlimg,
      this.imagePath,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  ProductImages.fromJson(Map<String, dynamic> json) {
    idProductImage = json['id_product_image'];
    idProduct = json['id_product'];
    hostPath = json['host_path'];
    urlimg = json['urlimg'];
    imagePath = json['image_path'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_product_image'] = this.idProductImage;
    data['id_product'] = this.idProduct;
    data['host_path'] = this.hostPath;
    data['urlimg'] = this.urlimg;
    data['image_path'] = this.imagePath;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
