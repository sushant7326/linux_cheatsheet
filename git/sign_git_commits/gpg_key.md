## install gnupg

```bash
sudo pacman -S gnupg
```

## find your git config email

```bash
git config --global --list
```

## generate new gpg key

```bash
gpg --full-generate-key
```

choose (1) RSA and RSA  
set key size to 4096 for security  
set expiration date  
enter your GitHub email when prompted  
set a paraphrase

## find your gpg key id

```bash
gpg --list-secret-keys --keyid-format=long
```

for key size 4096, keyid is the 16 characters long alphanumeric text after "rsa4096/"  
the one in the column labelled "sec" is what we need: `<gpg_key_id>`  
the one in the column labelled "ssb" is the subkey - not required for our use case

## configure Git to use the gpg key

```bash
git config --global user.signingkey <gpg_key_id>
git config --global commit.gpgsign true
```

## export your public key

```bash
gpg --armor --export <gpg_key_id>
```

add this key to GitHub -> Settings -> SSH and GPG keys -> New GPG Key


