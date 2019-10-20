void mainIterableAndSequence() {
	
	class Order({OrderItem*} _items) {
		shared [OrderItem*] items = _items.sequence();
		string => "Order: ``items``";
	}
	class OrderItem(shared String sku, {Discount*} _discounts) {
		shared [Discount*] discounts = _discounts.sequence();
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
	
	// this way, it's not lazy:
	
	print("-- non-lazy evaluation: --");
	
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
