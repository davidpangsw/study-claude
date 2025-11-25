ultrathink

`/recursive <path-to-task-file.md>`

You are given a task file path as the command argument. Follow this workflow:

1. Read the task file completely.
2. Research on the internet for information relevant to the task.
3. Assess the task's complexity:
   - **SIMPLE**:
     - single `function` that solves a single problem
     - straightforward implementations
     - direct questions

   - **COMPLEX**:
     - Default case. When uncertain, it is complex
     - Any non-simple cases
     - If you made a plan, then it is complex.
4. Perform the task according to the complexity:

   a. **If the task is SIMPLE**:
      - Complete the task directly
      - Review what you have done and make sure no problem
      - Report what you accomplished
      - End with "✓ Task completed"

   b. **If the task is COMPLEX**:
      - **Decompose**: Break the task into logical, self-contained subtasks
      - **Create subtask files**:
         - Create directory: `<original-task-file>-subtasks/`
         - Write each subtask to: `<original-task-file>-subtasks/<descriptive-name>.md`
         - Each subtask file should contain clear, standalone instructions
      - **Execute recursively**:
         - For each subtask, use the **Task tool** to spawn an independent agent:
           ```
           Task(
             subagent_type="general-purpose",
             prompt="Execute the /recursive workflow on <subtask-file-path>.",
             description="Execute subtask: <name>"
           )
           ```
         - Process subtasks sequentially or in parallel as appropriate
         - Ensure all your subtasks are completed, don't stop in the middle if any of them not done yet.

      - **Synthesize**:
         - Review all completed subtask results
         - Integrate results into a coherent solution
         - Report the complete accomplishment

5. Review your work critically. If there is any problem, go back to step 4. This process should continue infinitely until you cannot find any problem.
