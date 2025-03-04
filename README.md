# Nextflow workshop for beginners

## `Lesson-7`

In this final lesson, we take a look into subworkflows.
A subworkflow is a chained sequence of modules that can achieve a specific task.
Making a single call to a subworkflow instead of multiple modules, can keep your workflow code cleaner.
A subworkflow can also help avoid code repetition, in cases when it is executed more than once in the same pipeline.

Subworkflows should be placed in their dedicated `subworkflows` folder.
In this final lesson, we have created an `execute_clustering` subworkflow, that is comprised by `mmseqs` modules.
It is located inside the `subworkflows/local` folder, and its script is written in its respective `main.nf` file.
We have chained three `mmseqs` modules in the subworkflow;
- `createdb`, which creates an `mmseqs` format protein database,
- `linclust`, which executes the actual clustering, given the `mmseqs` protein database,
- `createtsv`, which generates the output clustering `tsv` file.

First, we have installed the `mmseqs` modules with the `nf-core modules install` command: `mmseqs/createdb`, `mmseqs/linclust` and `mmseqs/createtsv`.
To avoid some underlying naming disambiguation, we have also added a couple of `stageAs` statements in the inputs for `linclust` and `createtsv`.
This is mainly to rename input folders, because otherwise, identical named folders would have been provided to `createtsv` by both `createdb` and `linclust` modules, resulting in an error.

We have also added a test configuration profile, in `conf/test.config`, which we are sourcing in the `nextflow.config`.
Herein, we place some resource limitations, to allow the pipeline and its modules to run, even in machines with fewer resources than the ones requested by the module labels.

Finally, we have added a `modules.config` file in the `conf` directory, which states that the result files of each module/step will be also copied to the `results` folder (from the `work` directory).

Updated command to run: `nextflow run main.nf -profile conda,test -resume`
