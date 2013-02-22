#include <stdio.h>
#include "trie.h"

int main(int argc, char **argv) {
	Trie *trie;
	int i, vals[argc-1], *stored_vals[argc-1];
	if (argc == 1) {
		fprintf(stderr, "Error: please enter >= 1 arguments\n");
		return 0;
	}

	trie = trie_init();
	for (i=1; i<argc; ++i) {
		vals[i-1] = i*i;
		printf("Adding %s with value %d\n", argv[i], i*i);
		trie_addElement(trie, argv[i], (void *) &vals[i-1]);
	}

	trie_printElements(trie);

	for (i=1; i<argc; ++i) {
		stored_vals[i-1] = NULL;
		trie_getElement(trie, argv[i], &stored_vals[i-1]);
	}

	for (i=0; i<argc-1; ++i) {
		if (stored_vals[i])
			printf("Name: %s, val: %d\n", argv[i+1], *stored_vals[i]);
	}
	return 0;
}