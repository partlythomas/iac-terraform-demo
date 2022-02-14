# Git demo 3 - Git clone til lokal maskin
Vi ønsker å arbeide med koden i repositoriet `iac-terraform-demo` på lokal maskin. For å kunne gjøre dette må Git repositoriet klones ved hjelp av `git clone` kommandoen.

1. Åpne din personlige utgave/fork av `iac-terraform-demo` repositoriet på `https://github.com/%dittbrukernavn%/iac-terraform-demo`.

2. Klikk på den grønne `Code`-knappen

3. Velg `SSH` som valgt `Clone`-metode og kopier strengen som dukker opp til utklippstavlen din.
    Eksempel:
    ```console
    git@github.com:partlythomas/iac-terraform-demo.git
    ```

4. På din lokale maskin, åpne `Git Bash` programvaren eller et annet shell med Git-funksjonalitet (f.eks. WSL2).

5. Opprett katalogn `code` i brukerprofil-katalogn din og endre aktiv katalog/working directory til denne
    ```sh
    mkdir code
    ```

    ```sh
    cd code
    ```

6. Skriv `git clone` etterfulgt av den kopierte strengen fra steg 3 og eksekver kommandoen.
    ```sh
    git clone git@github.com:%dittbrukernavn%/iac-terraform-demo.git
    ```

7. Du vil få en advarsel om at tjeneren github.com's autentisitet ikke kan bekreftes og at SSH-nøkkelen vi opprettet tidligere er den som blir benyttet for å utføre klone.operasjonen. Skriv `yes` for å fortsette. Du vil dermed se at data blir hentet ned.
Eksempel på vellykket initiell kloning:
    ```console
    Cloning into 'iac-terraform-demo'...
    The authenticity of host 'github.com (140.82.114.4)' can't be established.
    ED25519 key fingerprint is SHA256:############/#################.
    This key is not known by any other names
    Are you sure you want to conitnue connecting (yes/no/[fingerprint])? yes
    Warning: Permanently added 'github.com' (ED25519) to the list of known hosts.
    remote: Enumerating objects: 93, done.
    remote: Counting objects: 100% (4/4), done.
    remote: Compressing objects: 100% (4/4), done.
    remote: Total 93 (delta 0), reused 1 (delta 0), pack-reused 89
    Receiving objects: 100% (93/93), 69.42 KiB | 935.00 KiB/s, done.
    Resolvind deltas: 100% (39/39), done.
    ```

8. Verifiser at repositoriet er klonet til forventet katalog, `/code/iac-terraform-demo` ved å åpne katalogen i Visual Studio Code og inspiser innholdet. Behold vinduet åpent for de neste demo-modulene.
    ```sh
    code iac-terraform-demo/
    ```

# **Gå videre til: [Terraform demo 1 - Initialisering og provisjonering av infrastruktur](./05-terraform-demo-1.md)**