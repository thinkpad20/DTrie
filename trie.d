/* Initially, the data will only be ints. 
Later, this will be templatized. */

class Trie {
	char key;
	int *data;
	Trie[char] subTries;
	this() {}
	this(char key) {
		this.key = key;
	}
	void addElement(string keys, int element) {
		if (keys == "") {
			data = new int; *data = element;
			return;
		}
		char k = keys[0];
		if (!(k in subTries)) 
			subTries[k] = new Trie(k);
		subTries[k].addElement(keys[1..$]);
	}

	int *getElement(string keys) {
		if (keys == "")
			return data;
		if (keys[0] in subTries)
			return subTries[keys[0]].lookupElement(keys[1..$]);
		return null;
	}
}