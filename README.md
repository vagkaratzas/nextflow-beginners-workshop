# Nextflow workshop for beginners

## `Lesson-1`
Nextflow is all about chaining `modules` into `workflows`.
Each `module` is a separate piece of software that receives specific `inputs`, runs its `script` and then passes on its `outputs`.
All the information is transmitted through `channels`.
In the first lesson we introduce a minimal `workflow` that creates a `channel` from a file path, makes a call to a single `module` which parses the data, and finally `views` the result.
Just for now, we will keep everything in a single file called `main.nf`.

In the project's root directory, execute the command `nextflow run main.nf`. You should see two file locations on the console; the first is the compressed input, and the second is the uncompressed fasta output.
