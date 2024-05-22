///
class JournalMutate {}

///
class JournalAppend extends JournalMutate {}

/// Merge so upstream can forward
class JournalMerge extends JournalMutate {}

/// Catch-up with off-line changes
class JournalForward extends JournalMutate {}

