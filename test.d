import std.stdio, std.conv, trie;

void main() {
	Trie trie = new Trie();
	trie.addElement("Allen", 27);
	int *allensAge = trie.getElement("Allen");
	writefln("Allen is %s years old.", *allensAge);
}