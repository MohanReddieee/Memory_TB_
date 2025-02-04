class mem_common;
  static mailbox mbox = new();
  static mailbox mon2cov = new();
  static mailbox mon2ref = new();
  static string testname;
  static virtual mem_intf vintf;
  static int tx_count = 5;
  static int mismatch_count;
  static int match_count;
endclass
