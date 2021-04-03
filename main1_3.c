#include <stddef.h>
#include <stdbool.h>
#include <stdio.h>
#include <dlfcn.h>


void (*func)(const char*);

bool init_lib()
{
  void *libp = dlopen("./libHello.so",RTLD_LAZY);
  if(libp==NULL)
   return false;
   
   func = (void(*)(const char*))dlsym(libp,"hello");
   if(func==NULL)
     return false;
   
  return true;
  
}

int main()
{
 if(init_lib())
 {
   func("Ariel");
 }
 else
 {
   printf("sorry couldnt find lib Hello\n");
 }
 return 0;
}

