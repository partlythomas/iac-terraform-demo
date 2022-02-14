
# Git demo 1 - Konfigurer GitHub-autentisering

## Generere SSH-nøkkelpar for autentisering i GitHub
SSH-nøkler benyttes for autentisering mellom lokal maskin og GitHub. Ved å knytte en offentlig SSH-nøkkel mot en privat del av nøkkelen vil GitHub kunne verifisere at maskinen som forespørselen kommer fra er tillatt å koble seg opp i konteksten av din GitHub-brukerkonto.

1. Åpne Git Bash på lokal maskin
2. Lim inn teksten under, men med din egen e-postadresse tilknyttet din GitHub-brukerkonto for å generere et SSH-nøkkelpar.

```sh
ssh-keygen -t ed25519 -C "your_email@example.com"
``` 

3. Ved spørsmål om hvor du ønsker å lagre nøkkelparet, trykk ENTER for å velge standard lokasjon.

```
> Enter a file in which to save the key (/c/Users/you/.ssh/id_algorithm):[Press enter]
```

4. Ved spørsmål om å skrive inn passord for SSH-nøkkelen, skriv et passord som er sikkert og memorerbart. Det anbefales ikke å bruke passordløse SSH-nøkler!

```
> Enter passphrase (empty for no passphrase): [Type a passphrase]
> Enter same passphrase again: [Type passphrase again]
```

>Tips: For å unngå å skrive passord for SSH-nøkkelen hver gang den brukes brukes ved f.eks. `git pull` eller `git push` kan en konfigurere `ssh-agent` til å sikkert håndtere dette f.eks. ved hver omstart av maskinen.
>
>Se [Working with SSH key passphrases - github.com](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/working-with-ssh-key-passphrases).


## Legg privat SSH-nøkkel til i ssh-agent
1. Start ssh-agent prosessen med kommandoen under.

```sh
eval "$(ssh-agent -s)"
```

2. Legg den private ssh-nøkkelen som ble generert til i ssh-agent med kommandoen under.

```sh
ssh-add ~/.ssh/id_ed25519
```


## Legg til SSH-nøkkel i GitHub
1. Åpne den *offentlige* delen av SSH-nøkkelparet, `C:\users\%USERNAME%\.ssh\id_ed25519.pub` i Notepad eller et annen tekstredigerings-program og kopier hele innholdet.

2. På [github.com](https://github.com), klikk på profilbildet ditt og velg `Settings` fra menyen.

3. Fra `Settings`-menyen, klikk deg inn på `SSH and GPG keys`.

4. Velg `New SSH key` og navngi denne til noe som er identifiserbart med din maskin. F.eks. `Laptop jobb` i `Title`-feltet.

5. Lim inn innholdet fra den offentlige delen av SSH-nøkkelparet i `Key`-feltet.

6. Klikk `Add SSH key`

7. Bekreft handlingen med GitHub-passordet ditt om nødvendig.



# Kilder
* [Generating a new SSH key and adding it to the ssh-agent - github.com](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
* [Adding a new SSH key to your GitHub account - github.com](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account)


# **Gå videre til: [Git demo 2 - Fork dette repositoriet!](./03-git-demo-2.md)**