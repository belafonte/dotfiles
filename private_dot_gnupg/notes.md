# How to add user id

- Find out the key ID using gpg --list-secret-keys --keyid-format=long.
- Edit the key with `gpg --edit-key <ID>`
- On the GnuPG prompt, use gpg> adduid.
- Answer to the interactive prompts for details.
- Confirm the details.
- Passphrase for the key will be asked.
- Remember to save with gpg> save.

You could also remove the old user ID without email address using gpg> deluid.

## Backup

### export

**private keys**
gpg --export-secret-keys --armor > all-private-keys.asc

**public keys**
gpg --export --armor > all-public-keys.asc

### import

**private keys**
gpg --import my-private-key.asc

**public keys**
gpg --import my-public-key.asc

### whole folder

**backup**
tar -czf gnupg-backup.tar.gz ~/.gnupg/
**restore**
tar -xzf gnupg-backup.tar.gz -C ~
