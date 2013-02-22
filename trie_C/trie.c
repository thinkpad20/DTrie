#include "trie.h"

Trie *trie_initNull() {
	Trie *newTrie = (Trie *) malloc(sizeof(Trie));
	newTrie->key = '\0';
	return newTrie;
}

Trie *trie_init(char key) {
	Trie *newTrie = (Trie *) malloc(sizeof(Trie));
	newTrie->key = key;
	return newTrie;
}

void trie_printElements(Trie *trie) {
	int i;
	for (i=0; i< MAX_DICT; ++i) {
		if (trie->subTries[i]) {
			printf("%c", i);
			trie_printElements(trie->subTries[i]);
		}
	}
	if (trie->data) printf(":%d\n", *(int*)trie->data);
}

void trie_addElementR(Trie *trie, const char *keys, void *data, int start, int end) {
	if (start == end) {
		trie->data = data;
		return;
	}


	if (trie->subTries[keys[start]] == NULL)
		trie->subTries[keys[start]] = trie_init(keys[start]);
	
	trie_addElementR(trie->subTries[keys[start]], keys, data, start+1, end);
}

void trie_addElement(Trie *trie, const char *keys, void *data) {
	int len = strlen(keys);
	return trie_addElementR(trie, keys, data, 0, len);
}

void trie_getElementR(Trie *trie, const char *keys, void **dest, int start, int end) {
	if (start == end) {
		*dest = trie->data;
		return;
	}
	if (trie->subTries[keys[start]] != NULL) {
		return trie_getElementR(trie->subTries[keys[start]], keys, dest, start+1, end);
	}
	else {
		*dest = NULL;
	}
}

void trie_getElement(Trie *trie, const char *keys, void **dest) {
	int len = strlen(keys);
	return trie_getElementR(trie, keys, dest, 0, len);
}