# Terraform demo 1 - Initialisering og provisjonering av infrastruktur
I denne demoen skal du provisjonere en ressursgruppe i Azure. Denne ressursgruppen vil bli brukt videre i de neste demoene.

## Forutsetninger
- Terraform installert lokalt - Se [Forberedelser](./00-forberedelser.md)
- Azure CLI installert lokalt - Se [Forberedelser](./00-forberedelser.md)
- Windows Terminal instalert - Se [Forberedelser](./00-forberedelser.md)
- Brukerkonto i en Azure AD tenant med aktiverte PIM-rettigheter til å opprette ressurser i Azure (tildeles under demoen).

## Azure CLI-autentisering
For å benytte Terraform mot Azure fra lokal maskin må du først autentisere deg med Azure CLI.

1. Åpne en PowerShell-sesjon i `Windows Terminal`.

2. I PowerShell-vinduet, kjør følgende kommando
    ```sh
    az login
    ```
    Et nettleservindu for Azure AD-autentisering vil åpnes. 

3. Logg inn med brukerkontoen du er blitt tildelt for denne demoen på Azure AD-autentiseringssiden.
    
    Ved vellykket autentisering vil Azure CLI vise hvilke Subscriptions i Azure du har tilgang til.
    
    Eksempel:
    ```console
    [
    {
        "cloudName": "AzureCloud",
        "homeTenantId": "########-####-####-####-#########",
        "id": "99e6f5f2-3eec-46dd-8b9d-521e35f97677",
        "isDefault": true,
        "managedByTenants": [],
        "name": "prtly-lz-online-app1 (PAYG)",
        "state": "Enabled",
        "tenantId": "########-####-####-####-#########",
        "user": {
        "name": "demo-jzygex@partly.cloud",
        "type": "user"
        }
    }
    ]
    ```    

## Initialisering og provisjonering av infrastruktur
Terraform må initialiseres i den aktuelle katalogen hvor konfigurasjonen ligger. Når dette er gjort kan Terraform-kommandoer som `terraform plan/apply/destroy` benyttes.

1. I Visual Studio Code-vinduet som ble åpnet fra tidligere demo-modul, åpne og inspiser filen `[main.tf` i katalogen `modules\05-terraform-demo-1`.
    
    Her vil du se at Terraform-konfigurasjonen benytter `azurerm` som provider og at ressurer som er definert kun er av typen `azurerm_resource_group`.

2. I PowerShell-vinduet med den autentiserte Azure CLI-sesjonen, endre aktiv katalog til `.\code\iac-terraform-demo\modules\05-terraform-demo-1\`.
    ```sh
    cd ".\code\iac-terraform-demo\modules\05-terraform-demo-1\"
    ```

3. Initialiser katalogen med følgende kommando

    ```sh
    terraform init
    ```
    Dette klargjør Terraform til å kjøre fra katalogen ved å sørge for at riktige versjoner av Terraform, providers og moduler er installert, i tillegg til at `backend state` konfigureres.

    Se [Command: init - Terraform.io](https://www.terraform.io/cli/commands/init) for mer informasjon om kommandoen.

4. 