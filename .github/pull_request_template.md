<!--
Your audience for this merge request description is **code reviewers**. Help them understand the technical implications involved in this change. The JIRA ticket should outline the user-facing details.

Remember that Product and QA teams may have other test cases, verifications, and requirements associated with this change. Your Verification and QA plan should be directed towards Code Reviewers.
-->

## What and Why

<!--
What are you changing? Describe impact and scope. Why is this being changed? Provide some context that may help future developers understand the reasoning behind these changes. Quote and/or link to requirements, keeping in mind that JIRA links may not be available in the future.
-->

## Deploy Plan

<!--
Is there anything special about this deploy? Are migrations present? Are there other merge requests that need to be shipped before this one? Are there any manual steps required, such as data migrations, search reindexes, etc?
-->

## Rollback Plan

<!--
Is there anything special about this rollback plan? Does this merge request anything that may need to be cleaned up manually (data migrations, search reindexes, etc)? Are there other associated merge requests that would also need to be reverted?
-->

To roll back this change, revert the merge with: `git revert -m 1 MERGE_SHA` and perform another deploy.

## Related URLs

<!--
Links to bug tickets, user stories, or other merge requests.
-->

## Verification and QA Plan

<!--
Fill in scenarios below in checklist format and complete them before merging. Evaluate the risk level and label this merge request or indicate risk in this description. Ensure the Verification and QA Plan matches the risk level appropriately.

Consider these topics:
* regressions (did we break something else related to this change?)
* edge cases (weird scenarios we don't immediately think of, but could occur)
* happy path (testing the new feature directly)
* data model changes
  * data elements to add or remove from indexes
  * changes in data models requiring migrations to be performed
-->

- [ ] Example scenario
