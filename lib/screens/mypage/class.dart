class personalInq {
  var type;
  var category;
  var title;
  var content;
  var writer;
  var date;
  var isReply;
  var reply;
  personalInq(this.type, this.category, this.title, this.content, this.writer,
      this.date, this.isReply);
  Map<String, dynamic> toFirestore() {
    return {
      if (type != null) "type": type,
      if (category != null) "category": category,
      if (title != null) "title": title,
      if (content != null) "content": content,
      if (writer != null) "writer": writer,
      if (date != null) "date": date,
      if (isReply != null) "isReply": isReply,
      "reply": reply,
    };
  }
}

class productInq {
  var category;
  var orderNum;
  var title;
  var content;
  var writer;
  var date;
  var isReply;
  var reply;
  productInq(this.category, this.orderNum, this.title, this.content,
      this.writer, this.date, this.isReply);
  Map<String, dynamic> toFirestore() {
    return {
      if (category != null) "category": category,
      if (orderNum != null) "orderNumber": orderNum,
      if (title != null) "type": title,
      if (content != null) "content": content,
      if (writer != null) "writer": writer,
      if (date != null) "date": date,
      if (isReply != null) "isReply": isReply,
      "reply": reply,
    };
  }
}

class Address {
  var isDefault;
  var name;
  var address;
  var message;
  var phone;
  Address(this.isDefault, this.name, this.address, this.message, this.phone);
  Map<String, dynamic> toFirestore() {
    return {
      if (isDefault != null) "isDefault": isDefault,
      if (name != null) "name": name,
      if (address != null) "address": address,
      if (message != null) "content": message,
      if (phone != null) "phone": phone,
    };
  }
}

class Order {
  var orderNumber;
  var company;
  var product;
  var date;
  var payment;
  var price;
  var num;
  var state;
}

class Review {
  var orderNumber;
  var stars;
  var company;
  var product;
  var content;
}
