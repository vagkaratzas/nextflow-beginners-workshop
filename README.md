# Nextflow workshop for beginners
This repository contains a small list of Nextflow-related branch-lessons for beginners.
Each lesson is a different branch, so make sure to change branches incrementally.
Each branch/lesson contains all required files, along with the command to execute.
The point is to see step by step, how a Nextflow pipeline can be minimally built and then extended step-by-step.

Clone this repository on your local machine with the command `git clone https://github.com/vagkaratzas/nextflow-beginners-workshop.git`, open the downloaded directory with your favorite editor (highly recommend [VS code](https://code.visualstudio.com/)), and fetch all branches/lessons with `git fetch --all`. If using VS code, make sure to download the `Nextflow extension`, that comes with language support for scripts and config files, enabling syntax highlighting, code navigation, formatting and more.

Make sure to install Nextflow by following the steps [here](https://www.nextflow.io/docs/latest/install.html).
To check if Nextflow was installed correctly, execute the command `nextflow -v`. If you see the software's version, you can proceed!

## Overview of lessons

- **Lesson 1**: Simple workflow with one module
- **Lesson 2**: Code organization in a clean architecture
- **Lesson 3**: Data chunking, the `splitFasta` operator
- **Lesson 4**: Running custom scripts, a python module example, and the `collectFile` operator
- **Lesson 5**: Containers and profiles
- **Lesson 6**: nf-core modules (gunzip), meta identifiers, `map` and `flatten` operators
- **Lesson 7**: Subworkflows, test and module configs

Switch to the `Lesson-1` branch with `git checkout Lesson-1` to begin.
