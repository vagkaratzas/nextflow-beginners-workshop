# Nextflow workshop for beginners

## `Lesson-5`
There are many cases that the user might not have all required software packages installed, for a module to run.
By adhering to `nf-core` standards, each module should be self-contained to ensure executability and enhance reproducibility.
We have added minimal `profile` options to the `nextflow.config` file, enabling users to select between `conda`, `docker`, or `singularity` containerization options, by setting the `-profile` parameter on the run command. At least one of these three tools must be installed on the user's system.

We have extended the `filter_fasta` module with container options before stating its inputs.
For `conda`, an `environment.yml` file with the required python library has been created in the same folder as the module's `main.nf` script, and is called from within the module with its relative path.
For `singularity` and `docker`, the container urls were created through the [seqera containers](https://seqera.io/containers/) site, by specifying the required python version.

Command to run: `nextflow run main.nf -profile conda -resume`

Switch to the Lesson-6 branch with `git checkout Lesson-6` to continue.
