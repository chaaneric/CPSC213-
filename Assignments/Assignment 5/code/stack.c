#include <stdlib.h>
#include <stdio.h>
#include <string.h>

struct Element {
  char   name[200];
  struct Element *next;
};

struct Element *top = 0;
char* current;

void push (char* aName) {
  struct Element* e = malloc (sizeof (*e));    // Not the bug: sizeof (*e) == sizeof(struct Element)
  strncpy (e->name, aName, sizeof (e->name));  // Not the bug: sizeof (e->name) == 200
  e->next  = top;
  top = e;
}

char* pop(struct Element* e) {
  top = e->next;
  return e->name;
}

int main (int argc, char** argv) {
  push ("A");
  push ("B");
  char* w = pop(top);
  push ("C");
  push ("D");
  char* x = pop(top);
  char* y = pop(top);
  char* z = pop(top);
    printf ("%s %s %s %s\n", w, x, y, z);
    free(w);
    free(x);
    free(y);
    free(z);
}
