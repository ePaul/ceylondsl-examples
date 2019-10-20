void mainSequence() {
	
	class Order(shared [OrderItem*] items) {
		string => "Order: ``items``";
	}
	class OrderItem(shared String sku, shared [Discount*] discounts) {
		string => "»sku: ``sku``, discounts: ``discounts``«";
	}
	class Discount(shared String code, shared Float percentValue) {
		string => "``code`` -> ``percentValue``";
	}
	
	// full named argument list
	value order1 = Order {
		items = [
			OrderItem {
				sku = "AD115G00N-M11";
				discounts = [Discount("B11", 13.0), Discount("B01", 5.5)];
			},
			OrderItem {
				sku = "AD115G00N-A11";
				discounts = [Discount("B11", 10.0), Discount("B01", 7.5)];
			},
			OrderItem {
				sku = "AD115G00N-C11"; discounts = [];
			}
		];
	};
	print(order1);
	
	// named argument list without names
	value order2 = Order { [
			OrderItem {
				"AD115G00N-M11";
				[Discount("B11", 13.0), Discount("B01", 5.5)];
			},
			OrderItem {
				"AD115G00N-A11";
				[Discount("B11", 10.0), Discount("B01", 7.5)];
			},
			OrderItem {
				"AD115G00N-C11";
				[];
			}];
	};
	print(order2);
	
	// normal positional argument list
	value order3 = Order([
			OrderItem(
				"AD115G00N-M11",
				[Discount("B11", 13.0), Discount("B01", 5.5)]
			),
			OrderItem(
				"AD115G00N-A11",
				[Discount("B11", 10.0), Discount("B01", 7.5)]
			),
			OrderItem(
				"AD115G00N-C11",
				[]
			)
		]);
	print(order3);
}
