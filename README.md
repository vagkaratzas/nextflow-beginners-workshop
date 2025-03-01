# Nextflow workshop for beginners
This repository contains a small list of Nextflow-related branch-lessons for beginners.
Each lesson is a different branch, so make sure to change branches incrementally.
Each branch/lesson contains all required files, along with the command to execute.
The point is to see step by step, how a Nextflow pipeline can be minimally built and then extended step-by-step.

## `Lesson-1`
Nextflow is all about chaining `modules` into `workflows`.
Each `module` is a separate piece of software that receives specific `inputs`, runs its `script` and then passes on its `outputs`.
All the information is transmitted through `channels`.
In the first lesson we introduce a minimal `workflow` that creates a `channel` from a file path, makes a call to a single `module` which parses the data, and finally `views` the result.
