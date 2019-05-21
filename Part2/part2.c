#include <stdio.h>
int main()
{
#ifdef LRB_DEBUG
   const char* line2="This executable was built for debugging!\n";
#else
   const char* line2="";
#endif
   printf("Hello Part 2!\n%s", line2);
   return 0;
}
