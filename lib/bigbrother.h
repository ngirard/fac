#include <sys/types.h>

#include "hashset.h"

/* bigbrother_process executes the requested program and tracks files
   (and directories?) modifed, read and deleted.  It is a blocking
   function, but is intended to be reentrant, so you can run several
   processes simultaneously in different threads.  */

int bigbrother_process(const char *workingdir,
                       pid_t *child_ptr,
                       int stdouterrfd,
                       char **args,
                       hashset *read_from_directories,
                       hashset *read_from_files,
                       hashset *written_to_files,
                       hashset *deleted_files);
