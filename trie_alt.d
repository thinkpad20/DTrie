/* Initially, the data will only be ints. 
Later, this will be templatized. */

//module trie;

class Trie(T) {
	char key = '\0';
	bool hasData = false;
	T data;
	Trie[char] subTries;

	// For when the user searches
	string lastSearch;
	T *foundData;

	this() {}
	this(char key) {
		this.key = key;
	}
	void addElement(string keys, T data) {
		if (keys == "") {
			this.data = data;
			hasData = true;
			return;
		}
		char k = keys[0];
		if (!(k in subTries)) 
			subTries[k] = new Trie(k);
		subTries[k].addElement(keys[1..$], data);
	}

	bool findElement(string keys) {
		if (keys == "") {
			if (hasData) {
				foundData = &data;
				return true;
			}
			return false;
		}
		if (keys[0] in subTries)
			return subTries[keys[0]].findElement(keys[1..$]);
		return false;
	}

	T getElement() 
	/* Returns the last piece of data found by a successful lookup operation.
	   Throws an exception if the pointer is null. */
	{
		if (foundData == null)
			throw new Exception("Error: data is not ready.");
		T returnData = *foundData;
		foundData = null;
		return returnData;
	}

	T getElementUnsafe(string keys) 
	/* Returns an element if it's in the trie but otherwise throws an exception.
	it's better to use hasElement/getElement if possible. */
	{
		if (keys == "") {
			if (hasData)
				return data;
		}
		if (keys[0] in subTries)
			return subTries[keys[0]].hasElement(keys[1..$]);
		//If control has reached this point, we have not found the searched element.
		throw new Exception("Error: string not found in trie.");
	}

	T getEl(string keys) {
		if (keys == lastSearch and foundData != null)
			return *foundData;
		
	}
}