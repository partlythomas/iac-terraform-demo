# Forberedelser
Følgende er nødvendig å utføre selv i forkant av hands-on demoen som blir kjørt i plenum.


## GitHub-konto
Om du ikke har en eksisterende GitHub-konto, opprett en på [GitHub](https://github.com).

>GitHub-kontoen må ikke nødvendigvis være knyttet til din jobb-epost. Det er ofte foretrukket å opprette denne mot en personlig e-post. Det er vanlig praksis hos flere bedrifter å la utviklere benytte sine private GitHub-kontoer inn i prosjekter.


## Programvare som må installeres
## Windows Terminal
Ikke strengt nødvendig, men det er et hendig terminal-verktøy uansett som vi kommer til å benytte under demoen.

[Microsoft Store - Windows Terminal](https://www.microsoft.com/en-us/p/windows-terminal)

## Visual Studio Code
Koderedigerings-verktøy med bred støtte for mange språk og tillegg.

[Visual Studio Code - Download](https://code.visualstudio.com)

### Visual Studio Code Extension: Terraform
[Visual Studio Marketplace - Terraform](https://marketplace.visualstudio.com/items?itemName=HashiCorp.terraform)


## Azure CLI
Verktøy for å kunne benytte Azure CLI bash-type (Linux) kommandoer mot Azure.

[Install Azure CLI on Windows](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-windows?tabs=azure-cli)

## Git for Windows
Verktøy for å kunne benytte Git versjonskontroll-verktøy i Windows.

[Git for Windows - Downloads](https://git-scm.com/download/win) (Velg 64-bit installasjon)

> Det er mange steg i installasjonen, men du kan velge standardvalgene for alt.

### Git alternativ: Windows Subsystem for Linux 2 (Ubuntu) med innebygget Git
Om du har Windows Subsystem for Linux 2 installert på din Windows-maskin er dette ofte en bedre opplevelse ved bruk av Git og Visual Studio Code.
Ved bruk av WSL2 anbefales også bruk av Visual Studio Code extension, <Remote - WSL>
https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-wsl
Obs: Ikke bruk WSL2-alternativet for denne demoen om du ikke er kjent med bruken av det fra før.