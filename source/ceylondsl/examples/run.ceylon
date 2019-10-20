/** runs all the examples, with some separator inbetween */ 
shared void run() {
	print("---- 0 Iterables only ---");
	mainIterable();
	print("---- 1 Sequences only ---");
	mainSequence();
	print("---- 2 Iterables + Sequences ---");
	mainIterableAndSequence();
	print("---- 3 Sequences + varargs ---");
	mainSequenceVarargs();
	print("---- 4 Iterable with alternative type");
	mainIterableWithEntry();
	print("---- 5 Iterable with alternative type + sequence ---");
	mainIterableWithEntryAndSequence();
	print("---- 6 Varargs with entry ---");
	mainSequenceVarargsWithEntry();
}