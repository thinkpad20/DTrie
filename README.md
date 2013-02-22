for info on Tries, look at http://en.wikipedia.org/wiki/Trie

I implemented a basic trie in C. The trie supports only two operations thus far, add and get. Both of these operations are O(l) where l is the length of the key string. Note that I lazily implemented the "dictionary" as simply a pointer array of length 256, therefore able to be uniquely indexed by any ASCII char. A more sophisticated implementation might use a variable-sized hash table. The advantages to what I did are simplicity and speed; the disadvantage is that it's not space efficient: it requires 256 * sizeof(void *), or one or two kilobytes, per node. Of course the number of nodes grows probably logarithmically with the number of names in the trie, so it's not so bad.