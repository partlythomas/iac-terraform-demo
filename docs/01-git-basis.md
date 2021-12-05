# Git - Basis

## Hva er Git?
Git er et versjonskontrollsystem som ble utviklet av Linus Thorvalds i 2005. Det er i dag verdens mest brukte distribuerte versjonskontrollsystem.

Git sporer historikken over alle endringer når flere mennesker og team samarbeider på prosjekter sammen. Alle tidligere versjoner av et prosjekt er alltid tilgjengelig for utviklerne.

I korte trekk kan Git-historikken i et prosjekt hjelpe utviklere med å finne ut:
* Hvilke endringer ble utført?
* Hvem utførte endringene?
* Når ble endringene skrevet?
* Hvorfor var endringene nødvendige?

Ved å være et <i>distribuert</i> versjonskontrollsystem vil det si at utviklere laster ned all kode og historikk til lokal maskin. Kommunikasjon med det sentrale systemet (f.eks. GitHub, GitLab, Azure DevOps osv.) skjer i hovedsak kun ved nedlasting eller opplasting av endret kode.

## Begreper
To begreper på basisnivå som er nyttige å kjenne til:

* Repository
    * Et repository er samlingen av et helt prosjekt, inkludert kode, versjoner m.m. <p>
    [partlythomas/iac-terraform-demo](https://github.com/partlythomas/iac-terraform-demo) er et repository.
* Branch
    * En branch er en avgrening fra et prosjekt. En branch kan f.eks. brukes til å skrive endringer eller tillegg til kode uten å påvirke andre grener i prosjektet. Disse endringene kan senere sammenslås inn i prosjektet ved bruk av merge eller pull request.


## Basis-kommandoer i Git
Disse kommandoene er essensielle for basis bruk av Git:
* git init
    
    Initialiserer et nytt Git repository og begynner sporing av endringer i katalogen (mappen). En skjult undermappe `.git` blir opprettet i repository-katalogen. Denne inneholder datastrukturen nødvendig for versjonskontroll.
    
* git clone
    
    Oppretter en lokal kopi av et prosjekt som allerede eksisterer "remotely". Klonen inkluderer alle prosjektfiler, historikk og branches.
    Eksempel:

    ```console
    developer@machine$ git clone git@github.com:partlythomas/iac-terraform-demo.git
    ```

* git add
    
    Iscenesetter (stager) en endring. Dette er del én av en to-stegs prosess. Alle endringer som blir staged blir del av neste snapshot og del av prosjektets historikk.
    Eksempel:

    ```console
    developer@machine$ git add readme.md
    ```

* git commit
    
    Lagrer et "snapshot" og fullfører endringssporingen. Alt som blir staget med `git add` blir del av snapshotet som skapes med `git commit`.<p>
    Eksempel:

    ```console
    developer@machine$ git commit -m "Change text in readme.md file"
    ```
* git status
    
    Viser status over endringer som `untracked`, `modified` eller `staged`
    Eksempel:

    ```console
    developer@machine$ git status
    Untracked files:
  (use "git add <file>..." to include in what will be committed)
        docs/02-infrastruktur-som-kode.md
    ```
* git branch
    
    Viser hvilke branches som er tilgjengelige og hvilken branch du arbeider i.
    Eksempel:

    ```console
    developer@machine$ git branch
    * main
    development-branch
    development-branch2
    ```
* git merge

    Slår linjer med kode sammen. Kommandoen benyttes for å kombinere endringer utført i to ulike branches. F.eks. endringer fra en `feature branch` inn til `main` branchen for utrulling av en ny funksjon.


* git push
    * Oppdaterer sentralt repository (remote) med alle endringer i `commits` som er lagret lokalt i en branch.




# Demo

## GitHub SSH-nøkler for autentisering

## Fork kildekoden i partlythomas/iac-terraform-demo
1. Fork this repository: https://github.com/partlythomas/iac-terraform-demo



# Kilder
* [About Git - Github.com](https://docs.github.com/en/get-started/using-git/about-git)
* [Basic Git commands - GitHub.com](https://docs.github.com/en/get-started/using-git/about-git#basic-git-commands)