class CartModel {
  int? status;
  String? message;
  Data? data;

  CartModel({this.status, this.message, this.data});

  CartModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<CartList>? cartList;
  CartDetails? cartDetails;




  Data(
      {
        this.cartList,this.cartDetails,
        });

  Data.fromJson(Map<String, dynamic> json) {
    if (json['cart_list'] != null) {
      cartList = <CartList>[];
      json['cart_list'].forEach((v) {
        cartList!.add(CartList.fromJson(v));
      });
    }
    cartDetails = json['cart_details'] != null ? CartDetails.fromJson(json['cart_details']) : null;

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (cartList != null) {
      data['cart_list'] = cartList!.map((v) => v.toJson()).toList();
    }

    if (cartDetails != null) {
      data['cart_details'] = this.cartDetails!.toJson();
    }
    return data;
  }
}

class CartList {

  dynamic id;
  dynamic productId;
  dynamic categoryId;
  dynamic quantity;
  dynamic netAmount;
  dynamic afterDiscountAmount;
  String? productName;
  String? productImage;
  dynamic shopId;
  String? productDescription;
  dynamic discount;
  String? categoryName;
  String? storeName;
  String? productPrice;
  String? uomName;
  String? imageName;
  String? createdAt;
  String? updatedAt;



  CartList(
      {
        this.id,
        this.productId,
        this.categoryId,
        this.quantity,
        this.netAmount,
        this.afterDiscountAmount,
        this.productImage,
        this.createdAt,
        this.updatedAt,
        this.shopId,
        this.productDescription,
        this.productName,
        this.discount,
        this.categoryName,
        this.storeName,
        this.uomName,
        this.imageName

      });

  CartList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    productName = json['product_name'];
    categoryId = json['category_id'];
    quantity = json['qty'];
    netAmount = json['net_amount'];
    afterDiscountAmount = json['after_discount_amount'];
    productImage = json['product_image'];
    shopId = json['shop_id'];
    productDescription = json['product_description'];
    discount = json['discount'];
    categoryName = json['category_name'];
    storeName = json['store_name'];
    uomName = json['uom_name'];
    imageName = json['image_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_id'] = productId;
    data['product_name'] = productName;
    data['category_id'] = categoryId;
    data['qty'] = quantity;
    data['net_amount'] = netAmount;
    data['after_discount_amount'] = afterDiscountAmount;
    data['product_image'] = productImage;
    data['shop_id'] = shopId;
    data['product_description'] = productDescription;
    data['discount'] = discount;
    data['category_name'] = categoryName;
    data['store_name'] = storeName;
    data['uom_name'] = uomName;
    data['image_name'] = imageName;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}


class CartDetails {

  dynamic subTotal;
  dynamic deliveryCharge;
  dynamic grandTotal;

  CartDetails(
      {
        this.subTotal,
        this.deliveryCharge,
        this.grandTotal,
      });

  CartDetails.fromJson(Map<String, dynamic> json) {
    subTotal = json['subtotal'];
    deliveryCharge = json['delivery_charge'];
    grandTotal = json['grand_total'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['subtotal'] = subTotal;
    data['delivery_charge'] = deliveryCharge;
    data['grand_total'] = grandTotal;

    return data;
  }

}



