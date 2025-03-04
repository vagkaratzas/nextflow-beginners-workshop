# Nextflow workshop for beginners

## `Lesson-6`
Quite a few bioinformatics (and not only!) tools have already been converted into modules, following nf-core standards.
Before creating a custom module from a tool process, it is highly recommended to check the [nf-core modules repository](https://nf-co.re/modules/).
Chances are that someone else has already gone through the pain of creating that module, which has also been reviewed by the nf-core community.

For this lesson, we have replaced the initial `gunzip` module with the one from the [nf-core github repository](https://github.com/nf-core/modules/tree/master/modules/nf-core/),
which now resides in the `modules/nf-core` folder.

If you already have [nf-core tools](https://nf-co.re/docs/nf-core-tools/installation) installed (recommended), you can easily do that by executing the `nf-core modules install gunzip` command.
This will also prompt you to define your current repository as a `pipeline`, and automatically create the `modules.json` file, which keeps track of every installed nf-core module, and its version, in the pipeline.
Some required `manifest` options (pipeline `name`, `description` and `version`) must be also appended to the `nextflow.config` file beforehand.
The other option is to simply copy-paste the `gunzip` files from the module's respective [nf-core github folder](https://github.com/nf-core/modules/tree/master/modules/nf-core/gunzip).

The nf-core modules contain a supplementary `meta.yml` file with documentation regarding the tool, its inputs and outputs.
The `tests` folder, contains unit tests to ensure the module will not break with future updates.
Some overheads have been also added to the module's `main.nf` file;
- tag: an identifier that shows some extra text next to the process chunk during execution.
- label: another tag to choose from one of the pre-made resource configurations from the `conf/base.config` configuration file, which has now been included in `nextflow.config`.
- meta: a very important identifier that helps name and distinguish outputs, keeps track of the executed process chunk (when being used in `tag`), and allows joining results from different processes downstream.
- versions: a supplementary output file that states the specific version of the tool that was used.
- emit: since there are multiple outputs now, we can tell them (and use them) apart with their emitted name.
- stub: a complementary section that allows testing for a dry-run (just creating the empty minimal required outputs).

In the `main.nf` workflow, we have now added a `meta` identifier on our input file with the `map` operator, to create the proper channel required by the updated `gunzip` module's input.
We have also used the `map` operator again on the `gunzip` output, to only split the uncompressed fasta file (can't split the meta!).
Then we have combined that with the `flatten` operator to emit each item separately to the next module (before `flatten`, it was one list of items).

Command to run: `nextflow run main.nf -profile conda -resume`
