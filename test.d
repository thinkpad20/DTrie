import std.stdio, std.conv, trie;

void foo(Trie!string t, string name) {
	string s = "hello";
	t.addElement(name, &s);
	string *sp = t.getElement("Mikey");
	if (s)
		writeln(*sp);
	else
		writeln(":(");

}

void main(string[] args) {
	Trie!string trie = new Trie!string();
	int i;
	string[] vals = ["123", "234", "345", "239487"];
	string*[] stored_vals = new string*[args.length-1];

	foo(trie, "Mikey");
	string *s = trie.getElement("Mikey");
	if (s)
		writeln(*s);
	else
		writeln(":(");

	//if (args.length == 1) {
	//	writeln("Error: please enter >= 1 arguments\n");
	//	return;
	//}

	//for (i=1; i<args.length; ++i) {
	//	writef("Adding %s with value %s\n", args[i], vals[i-1]);
	//	trie.addElement(args[i], &vals[i-1]);
	//}



	//for (i=1; i<args.length; ++i)
	//	stored_vals[i-1] = trie.getElement(args[i]);

	//for (i=0; i<args.length-1; ++i) {
	//	if (stored_vals[i])
	//		writef("Name: %s, val: %s\n", args[i+1], *stored_vals[i]);
	//}
}