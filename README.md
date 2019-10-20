# Example of building a DSL with Ceylon

This is a reply to the [Kotlin DSL](https://github.com/alexrochas/kotlin-dsl) example by my colleage Alex Rocha.

Ceylon also allows to create DSLs for creating data structures, without using hacks like mutable data structures, late initialization or confusing operator overloading,
just using the "named argument list" feature, or standard varargs.

The result is something like this:

```ceylon
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
```

Alternatively, with varargs in positional argument lists:
```ceylon
    value order1 = Order(
        OrderItem(
            "AD115G00N-M11",
           	Discount("B11", 13.0), Discount("B01", 5.5)
        ),
        OrderItem(
            "AD115G00N-A11",
            Discount("B11", 10.0), Discount("B01", 7.5)
        ),
        OrderItem(
            "AD115G00N-C11"
        )
    );
```

With a tiny bit of additional code in the OrderItem class, we can make it even nicer (though possibly less clear):
```ceylon
    value order = Order {
        OrderItem {
            sku = "AD115G00N-M11";
            "B11" -> 13.0, "B01" -> 5.5
        }, 
        OrderItem {
            sku = "AD115G00N-A11";
            "B11" -> 10.0, "B01" -> 7.5
        },
        OrderItem {
            sku = "AD115G00N-C11";
        }
    };

```

or this way using the varargs approach:
```ceylon
    value order1 = Order(
        OrderItem(
            "AD115G00N-M11",
           	"B11" -> 13.0, "B01" -> 5.5
        ),
        OrderItem(
            "AD115G00N-A11",
            "B11" -> 10.0, "B01" -> 7.5
        ),
        OrderItem(
            "AD115G00N-C11"
        )
    );
```

Each of the examples is self-contained with local classes in a main function, but it works the same with shared classes.