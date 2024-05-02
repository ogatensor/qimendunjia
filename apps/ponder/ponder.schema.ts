import { createSchema } from "@ponder/core";

export default createSchema((p) => ({
  /**
   * Table representing user accounts.
   * Fields:
   * - id: Unique identifier for the account (hexadecimal).
   * - balance: Balance of the account (bigint).
   * - isOwner: Boolean indicating if the account is the owner.
   * - allowances: Many-to-many relationship with Allowance table based on ownerId.
   * - approvalOwnerEvents: Many-to-many relationship with ApprovalEvent table based on ownerId.
   * - approvalSpenderEvents: Many-to-many relationship with ApprovalEvent table based on spenderId.
   * - transferFromEvents: Many-to-many relationship with TransferEvent table based on fromId.
   * - transferToEvents: Many-to-many relationship with TransferEvent table based on toId.
   */
  Account: p.createTable({
    id: p.hex(),
    balance: p.bigint(),
    isOwner: p.boolean(),

    allowances: p.many("Allowance.ownerId"),
    approvalOwnerEvents: p.many("ApprovalEvent.ownerId"),
    approvalSpenderEvents: p.many("ApprovalEvent.spenderId"),
    transferFromEvents: p.many("TransferEvent.fromId"),
    transferToEvents: p.many("TransferEvent.toId"),
  }),
  /**
   * Table representing allowances between accounts.
   * Fields:
   * - id: Unique identifier for the allowance (string).
   * - amount: Amount of the allowance (bigint).
   * - ownerId: Reference to the owner's account id in the Account table.
   * - spenderId: Reference to the spender's account id in the Account table.
   * - owner: One-to-one association with ownerId.
   * - spender: One-to-one association with spenderId.
   */
  Allowance: p.createTable({
    id: p.string(),
    amount: p.bigint(),

    ownerId: p.hex().references("Account.id"),
    spenderId: p.hex().references("Account.id"),

    owner: p.one("ownerId"),
    spender: p.one("spenderId"),
  }),
  /**
   * Table representing transfer events between accounts.
   * Fields:
   * - id: Unique identifier for the transfer event (string).
   * - amount: Amount transferred (bigint).
   * - timestamp: Timestamp of the transfer (integer).
   * - fromId: Reference to the sender's account id in the Account table.
   * - toId: Reference to the receiver's account id in the Account table.
   * - from: One-to-one association with fromId.
   * - to: One-to-one association with toId.
   */
  TransferEvent: p.createTable({
    id: p.string(),
    amount: p.bigint(),
    timestamp: p.int(),

    fromId: p.hex().references("Account.id"),
    toId: p.hex().references("Account.id"),

    from: p.one("fromId"),
    to: p.one("toId"),
  }),
  /**
   * Table representing approval events for transactions.
   * Fields:
   * - id: Unique identifier for the approval event (string).
   * - amount: Amount approved (bigint).
   * - timestamp: Timestamp of the approval (integer).
   * - ownerId: Reference to the owner's account id in the Account table.
   * - spenderId: Reference to the spender's account id in the Account table.
   * - owner: One-to-one association with ownerId.
   * - spender: One-to-one association with spenderId.
   */
  ApprovalEvent: p.createTable({
    id: p.string(),
    amount: p.bigint(),
    timestamp: p.int(),

    ownerId: p.hex().references("Account.id"),
    spenderId: p.hex().references("Account.id"),

    owner: p.one("ownerId"),
    spender: p.one("spenderId"),
  }),
}));
