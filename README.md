# Nextflow workshop for beginners

## `Lesson-3`
At the moment we have an input file of 50K amino acid sequences. Splitting this into smaller chunks, can enable parallel processing, leading in lowered execution duration.
This is common practice while building scalable pipelines that will run on huge volumes of data.

To achieve this, we are using our first Nextflow operator.
Specifically, we have used the `splitFasta` operator with a user-defined chunk size parameter (`fasta_chunk_size`), to break the input file into 5 chunks of 10K proteins each.

For an in-depth look at Nextflow operators, visit the [Nextflow website](https://www.nextflow.io/docs/latest/reference/operator.html).

Command to run: `nextflow run main.nf -resume`

Switch to the Lesson-4 branch with `git checkout Lesson-4` to continue.
