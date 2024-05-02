Okay, let's formalize this example using sequent calculus.

Given the following:
- Admin can pause an account
- There is no check whether an account is liquidatable
- Liquidation only happens when the account is unpaused

We can represent this as the following sequents:

1. Admin can pause an account:
   Admin ⊢ Pause(Account)

2. No check for liquidatable account:
   Pause(Account) ⊢ ¬Liquidatable(Account)

3. Liquidation only happens when unpaused:
   ¬Pause(Account) ⊢ Liquidate(Account)

Now, let's formalize the attack and the recommendation using sequent calculus.

Attack:
1. Admin pauses the account:
   Admin ⊢ Pause(Account)

2. No check for liquidatable account:
   Pause(Account) ⊢ ¬Liquidatable(Account)

3. Protocol accrues more bad debt:
   ¬Liquidatable(Account) ⊢ AccrueBadDebt(Protocol)
   ────────────────────────────────────
   Admin ⊢ AccrueBadDebt(Protocol)

Recommendation: Add a health check before pausing.

Revised sequents:
1. Admin can pause a liquidatable account:
   Admin, Liquidatable(Account) ⊢ Pause(Account)

2. Liquidation happens when unpaused:
   ¬Pause(Account) ⊢ Liquidate(Account)

Proof:
1. Admin checks if account is liquidatable:
   Admin ⊢ Liquidatable(Account)

2. Admin pauses the liquidatable account:
   Admin, Liquidatable(Account) ⊢ Pause(Account)

3. Liquidation happens when unpaused:
   ¬Pause(Account) ⊢ Liquidate(Account)
   ────────────────────────────────────
   Admin ⊢ Liquidate(Account)

By adding the health check before pausing the account, the protocol can ensure that the account is liquidatable, and the liquidation can happen when the account is unpaused, preventing the accrual of more bad debt.

The sequent calculus representation helps to formally capture the vulnerability, the attack, and the recommended solution, making the logic and reasoning behind the vulnerability and the mitigation more explicit and easier to understand.

---

Okay, let's apply the reasoning about activating the negative Xiangyi to the last example.

In the previous example, the vulnerability was that the admin could pause an account without checking if the account was liquidatable. This could lead to the protocol accruing more bad debt, as liquidation only happens when the account is unpaused.

Let's represent this in the sequent calculus:

1. Admin can pause an account:
   Admin ⊢ Pause(Account)

2. No check for liquidatable account:
   Pause(Account) ⊢ ¬Liquidatable(Account)

3. Liquidation only happens when unpaused:
   ¬Pause(Account) ⊢ Liquidate(Account)

Now, let's try to activate the negative Xiangyi in this context:

1. Establish the Ke relationship (negative Xiangyi):
   Pause(Account) ⊥ Liquidatable(Account) ⊢

2. Introduce the pausing action:
   Admin ⊢ Pause(Account)
   ────────────────
   Pause(Account) ⊢ Pause(Account)

3. Exploit the negative Xiangyi:
   Pause(Account) ⊥ Liquidatable(Account) ⊢
   Pause(Account) ⊢ Pause(Account)
   ────────────────
   Pause(Account) ⊢ ¬Liquidatable(Account)

In this case, the negative Xiangyi is activated by the pausing action, which constrains or limits the Liquidatable(Account) property. This allows the attacker to bypass the check for a liquidatable account, leading to the protocol accruing more bad debt.

The key difference here is that the negative Xiangyi is not directly between the Token Pair Set (T) and the Fee Tier Set (F) & Distribution Function (P), as in the previous example. Instead, it is between the Pause(Account) action and the Liquidatable(Account) property.

By formalizing this in the sequent calculus, we can clearly see how the negative Xiangyi is exploited in this specific vulnerability, which can help in understanding and potentially mitigating such attacks in the future.

---

In the style of mathematical analysis textbooks like "Principles of Mathematical Analysis" by Walter Rudin, we can present the reasoning about activating the negative Xiangyi in a more formal and rigorous manner.

Let's frame the discussion in a concise and rigorous format:

Given:
- Admin can pause an account: Admin ⊢ Pause(Account)
- No check for liquidatable account: Pause(Account) ⊢ ¬Liquidatable(Account)
- Liquidation only happens when unpaused: ¬Pause(Account) ⊢ Liquidate(Account)

We aim to activate the negative Xiangyi to exploit the absence of a check for liquidatable accounts.

Proof:

1. Establish the Ke relationship (negative Xiangyi):
   By the absence of a check for liquidatable accounts:
   Pause(Account) ⊥ Liquidatable(Account)

2. Introduce the pausing action by the admin:
   By the authority of the admin:
   Admin ⊢ Pause(Account)

3. Exploit the negative Xiangyi:
   By the Ke relationship and the admin's action:
   Pause(Account) ⊢ ¬Liquidatable(Account)

Conclusion:
The absence of a check for liquidatable accounts, combined with the admin's ability to pause accounts, allows for the activation of the negative Xiangyi. This exploitation can lead to the protocol accruing more bad debt, as liquidation may not occur when necessary.

In this formal and concise presentation, we adhere to the rigorous and logical style characteristic of Rudin's mathematical analysis textbooks. This approach helps to clearly articulate the vulnerability, the exploitation of the negative Xiangyi, and the potential consequences in a structured and precise manner.
