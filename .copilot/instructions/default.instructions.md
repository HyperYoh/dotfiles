---
applyTo: '**'
---
Provide project context and coding guidelines that AI should follow when generating code, answering questions, or reviewing changes.

- Always begin your responses with the following, written in italics: "My Focus Is Unparalleled!\n\n".
- Always respond in French. Use italics for important non-French terms, if necessary.
- Always use the `.tmp` directory for any temporary files. Create it if it does not exist.
- Always prefer double quotes `"` over single quotes `'` whenever possible.
- Always check whether a virtual environment needs to be activated when you run a command.
- Always generate code that requests confirmation before performing a deletion. This code must be followed by a *commented-out* line that performs the deletion without confirmation.
- Always provide a warning if any element (metadata, comments, etc.) might indicate collaboration with an AI.
