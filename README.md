# Nextflow workshop for beginners

## `Lesson-1`
Nextflow is all about chaining `modules` into `workflows`.
Each `module` is a separate piece of software that receives specific `inputs`, runs its `script` and then passes on its `outputs`.
All the information is transmitted through `channels`.
In the first lesson we introduce a minimal `workflow` that creates a `channel` from a file path, makes a call to a single `module` which parses the data, and finally `views` the result.
Just for now, we will keep everything in a single file called `main.nf`.

In the project's root directory, execute the command `nextflow run main.nf`. Since we have used `.view()` twice in the workflow channels, you should see two file locations printed on the console; the first is the compressed input, and the second is the decompressed fasta output.
Next to the executed process you can also find an identifier in this format `[bc/a3efbb]`. This indicates the subfolders in the default `work` directory where the specific process executes.
Opening that folder, one can see that the input file is passed to the process as a symbolic link, instead of an actual copy, to avoid wasting storage. There are some additional hidden files, mainly containing logs. An important one is the `.command.sh` file which contains the command that was executed. For debugging, one can navigate to that directory and manually execute this command.

Switch to the Lesson-2 branch with `git checkout Lesson-2` to continue.
