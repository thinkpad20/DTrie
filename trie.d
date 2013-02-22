/* Initially, the data will only be ints. 
Later, this will be templatized. */

module trie;

class Trie(T) {
	char key = '\0';
	T *data;
	Trie[char] subTries;

	this() {}
	this(char key) {
		this.key = key;
	}
	void addElement(string keys, T *data) {
		if (keys == "") {
			this.data = data;
			return;
		}
		char k = keys[0];
		if (!(k in subTries)) 
			subTries[k] = new Trie(k);
		subTries[k].addElement(keys[1..$], data);
	}

	T *getElement(string keys) {
		if (keys == "") {
			return data;
		}
		
		if (keys[0] in subTries)
			return subTries[keys[0]].getElement(keys[1..$]);
		
		return null;
	}
}