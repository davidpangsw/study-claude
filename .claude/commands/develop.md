Given a taskId as argument (e.g., `/develop task123`).

For the given task id, the following files will be used:
- taskFile: `./{taskId}/task.md`
- exploreFile: `./{taskId}/explore.md`
- planFile: `./{taskId}/plan.md`
- planReviewFile: `./{taskId}/planReview.md`
- reviewImplementFile: `./{taskId}/reviewImplement.md`

Perform as follows:
1. /develop01-explore
2. /develop02-plan
3. /develop03-review-plan
    - If there are any items with priority higher than "Low" in planReviewFile, go back to step 2
4. Human Review, pause here. Ask human to review and understand the plan. Human may give comments.
    - If human is unsatisfied with the plan, judge the comment by yourself and either:
        - Explain in more detail to address the human's concerns, then return to this step for approval
        - Add the comments into planReviewFile, and go back to step 2
        - Stop immediately, if human asks for it.
5. /develop04-implement
6. /develop05-review-implement
    - If there are issues in reviewImplementFile, go back to step 5
