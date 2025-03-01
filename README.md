# Nextflow workshop for beginners

## `Lesson-2`
In this lesson we have broken the `main.nf` file into different files, according to best practices.
It's never a good thing to have everything in one script. From here on, we will try to keep everything organized in their respective folders.
The main workflow will remain in the `main.nf` file in the root directory, while the `gunzip` module will be moved to the modules folder, in the gunzip subfolder and inside its own `main.nf` file. We will now just have to include that module in our workflow. Finally, the filepath is defined as a parameter in a `nextflow.config` file in the root directory.
