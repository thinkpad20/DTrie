#ifndef __TRIE_H__
#define __TRIE_H__

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define MAX_DICT 256

typedef struct Trie_ {
	char key;
	void *data;
	struct Trie_ *subTries[MAX_DICT]; 
} Trie;

Trie *trie_initNull();
Trie *trie_init(char);
void trie_printElement(Trie *trie);
void trie_addElement(Trie *trie, const char *keys, void *data);
void trie_getElement(Trie *trie, const char *keys, void **dest);

#endif