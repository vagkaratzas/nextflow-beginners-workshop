# Nextflow workshop for beginners

## `Lesson-2`
In this lesson we have separated the code from `main.nf` into different files, according to best practices.
It's never a good thing to have everything in one script. From here on, we will keep everything organized in its respective folder.
The main workflow has remained in the `main.nf` file, inside the root directory, while the `gunzip` module has been moved to the `modules` folder, in the `local/gunzip` subfolder and inside its own `main.nf` file. 
We have now included that module in our workflow, at the first line.
Finally, the input data filepath has been defined as a parameter in a `nextflow.config` file in the root directory.
The path points at the input data file, which has now been moved inside the `assets` folder.

The command to execute now is `nextflow run main.nf -resume`.
We have added the `-resume` flag which prevents wasting compute resources, by avoiding re-running processes that have already been executed successfully, given that their signature and inputs have remained the same.
For this example, we changed the input file path by moving it into another folder, so the process will re-run. Execute the run command once more and the process will now show as `cached`.
