void mainSequenceVarargsWithEntry() {
	
	class Order(shared OrderItem* items) {
		string => "Order: ``items``";
	}
	class Discount(shared String code, shared Float percentValue) {
		string => "``code`` -> ``percentValue``";
	}
	class OrderItem(shared String sku, <Discount|<String->Float>>* _discounts) {
		shared [Discount*] discounts =
			_discounts.collect((d) => switch (d) case (is Discount) d case (String c -> Float p) Discount(c, p));
		string => "»sku: ``sku``, discounts: ``discounts``«";
	}
	
	// positional argument list
	value order1 = Order(
		OrderItem(
			"AD115G00N-M11",
			"B11"->13.0, "B01"->5.5
		),
		OrderItem(
			"AD115G00N-A11",
			"B11"->10.0, "B01"->7.5
		),
		OrderItem(
			"AD115G00N-C11"
		)
	);
	print(order1);
	
	// also mixed parameters
	value order1a = Order(
		OrderItem(
			"AD115G00N-M11",
			"B11"->13.0, Discount("B01", 5.5)
		),
		OrderItem(
			"AD115G00N-A11",
			Discount("B11", 10.0), "B01"->7.5
		),
		OrderItem(
			"AD115G00N-C11"
		)
	);
	print(order1a);
	
	// we can still use the named argument syntax, though it's not that useful here.
	value order2 = Order {
		items = [
			OrderItem {
				sku = "AD115G00N-M11";
				_discounts = ["B11"->13.0, "B01"->5.5];
			},
			OrderItem {
				sku = "AD115G00N-A11";
				_discounts = ["B11"->10.0, "B01"->7.5];
			},
			OrderItem {
				sku = "AD115G00N-C11";
				_discounts = [];
			}
		];
	};
	print(order2);
}
