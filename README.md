# Nextflow workshop for beginners

## `Lesson-4`
For this lesson we have created a local module named `filter_fasta` that runs a custom, executable python script.
Custom scripts are located inside the `bin` folder.
The `filter_fasta.py` script parses sequences from an input fasta file, filtering out sequences with less than `110` amino acids (`length_threshold` parameter).
Finally, we have used the `collectFile` Nextflow operator to concatenate all filtered fasta chunks back into a single file.

Command to run: `nextflow run main.nf -resume`
