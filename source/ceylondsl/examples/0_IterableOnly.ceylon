void mainIterable() {
	
	class Order(shared {OrderItem*} items) {
		string => "Order: ``items``";
	}
	class OrderItem(shared String sku, shared {Discount*} discounts) {
		string => "»sku: ``sku``, discounts: ``discounts``«";
	}
	class Discount(shared String code, shared Float percentValue) {
		string => "``code`` -> ``percentValue``";
	}
	
	value order = Order {
		OrderItem {
			sku = "AD115G00N-M11";
			Discount("B11", 13.0),
			Discount("B01", 5.5)
		},
		OrderItem {
			sku = "AD115G00N-A11";
			Discount("B11", 10.0),
			Discount("B01", 7.5)
		},
		OrderItem {
			sku = "AD115G00N-C11";
		}
	};
	print(order);
	
	// but iterables are lazily evaluated when iterating over them:
	print("-- lazy evaluation: --");
	
	variable value discount1 = 7.7;
	variable value discount2 = 5.5;
	
	value order1 = Order {
		OrderItem {
			sku = "AD115G00N-M11";
			Discount("B11", 13.0),
			Discount("B01", discount2)
		},
		OrderItem {
			sku = "AD115G00N-A11";
			Discount("B11", 10.0),
			Discount("B01", discount1)
		},
		OrderItem {
			sku = "AD115G00N-C11";
		}
	};
	print(order1);
	discount1 = 20.0;
	discount2 = 4.2;
	print(order1);
}
