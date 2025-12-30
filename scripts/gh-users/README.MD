# GH Multi-Account Switcher

This script allows you to **switch GitHub accounts and update git config** automatically for multiple accounts on the same system.

---

### Purpose

Many developers have **multiple GitHub accounts** (personal, work, etc.) on the same machine.

* `gh auth switch` only changes the **GitHub CLI identity**.
* Git commits are still attributed to whatever is set in `git config`.

This script **ties them together**, so when you switch accounts:

1. Your **GH CLI identity** changes.
2. Your **git commit author** changes globally.

Result: **no accidental commits under the wrong account**, and a smoother workflow when juggling multiple accounts.

---

## Structure

* `gh-users/` — folder containing per-account files (no extension).
  Each file should contain **4 lines**:

  1. GitHub username (case-sensitive)
  2. `gh auth switch --user <username>`
  3. `git config --global user.name "<username>"`
  4. `git config --global user.email "<email>"`

Example `amor3novilunio` file:

```
Amor3Novilunio
gh auth switch --user Amor3Novilunio
git config --global user.name "Amor3Novilunio"
git config --global user.email "amor.3.novilunio@gmail.com"
```

* `README.md` — this file, explaining usage.

## Usage

1. You will see a **menu of GitHub accounts** (excluding `README.md`).
2. Pick the account you want to switch to.
3. The script will:

   * Try to switch GH account using `gh auth switch`.
   * If the account exists → update git config automatically.
   * If the account does **not exist** → prompt to login with `gh auth login`.

---

## Notes

* **Case-sensitive usernames**: `gh auth switch --user` requires the exact GitHub username casing.
* The script updates **global git config**, so commits will match the selected account.
* To add a new account:

  1. Create a new file in `gh-users/`.
  2. Follow the 3-line format above.
