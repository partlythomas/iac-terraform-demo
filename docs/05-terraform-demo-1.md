# Terraform demo 1 - Initialisering og provisjonering av infrastruktur
I denne demoen skal du provisjonere en ressursgruppe i Azure ved hjelp av Terraform og Azure CLI. Denne ressursgruppen vil bli brukt videre i de neste demoene.

## Forutsetninger
- Terraform installert lokalt - Se [Forberedelser](./00-forberedelser.md)
- Azure CLI installert lokalt - Se [Forberedelser](./00-forberedelser.md)
- Windows Terminal instalert - Se [Forberedelser](./00-forberedelser.md)
- Brukerkonto i en Azure AD tenant med aktiverte PIM-rettigheter til å opprette ressurser i Azure (tildeles under demoen).

---

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

---

## Initialisering og provisjonering av infrastruktur
Terraform må initialiseres i den aktuelle katalogen hvor konfigurasjonen ligger. Når dette er gjort kan Terraform-kommandoer som `terraform plan/apply/destroy` benyttes.

1. I Visual Studio Code-vinduet som ble åpnet fra tidligere demo-modul, åpne og inspiser filen `main.tf` i katalogen `modules\05-terraform-demo-1`.
    
    Her vil du se at Terraform-konfigurasjonen benytter `azurerm` som provider og at ressurser som er definert kun er av typen `azurerm_resource_group`.

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

4. Planlegg provisjoneringen av ressursgruppen ved å kjøre følgende kommando
    
    ```sh
    terraform plan
    ```

    Skriv inn inn ditt demo-brukernavn (uten @domene.eksempel) når du blir bedt om dette. Dette er basert på `variables.tf`-filen som blant annet benyttes for å lage unike ressursgrupper i dette tilfellet.
    
    Kjøring av kommandoen vil resultere i en en *hypotetisk* plan for hva Terraform vil utføre basert på konfigurasjonen i `main.tf`-filen og eventuelt andre `.tf` filer i samme katalog. `terraform plan` vil aldri faktisk utføre noen potensielt skadelige handlinger.
    
    Eksempel på `terraform plan` resultat:
    ```console
    Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the
    following symbols:
    + create

    Terraform will perform the following actions:

    # azurerm_resource_group.rg will be created
    + resource "azurerm_resource_group" "rg" {
        + id       = (known after apply)
        + location = "westeurope"
        + name     = "terraform-demo-jzygex"
        }

    Plan: 1 to add, 0 to change, 0 to destroy.
    ```

    Ut i fra eksempelet over er det tydelig at Terraform-konfigurasjonen vår kun vil opprette (`Add`) én ressursgruppe i Azure ved navn `terraform-demo-jzygex`.

    Se [Command: plan - Terraform.io](https://www.terraform.io/cli/commands/plan) for mer informasjon om kommandoen.

5. Når du er komfortabel med hva `terraform plan` resultatet viser kan du kjøre følgende kommando for å provisjonere ressursen(e) i Azure

    ```sh
    terraform apply
    ```

    Igjen, skriv inn inn ditt demo-brukernavn (uten @domene.eksempel) når du blir bedt om dette.

    Kjøring av kommandoen vil igjen resultere i en en *hypotetisk* plan for hva Terraform vil utføre basert på konfigurasjonen i `main.tf`-filen og eventuelt andre `.tf` filer i samme katalog. I tillegg vil Terraform be om bekreftelse om å utføre handlingene som er oppsummert i planen.

    Eksempel:
    ```console
    Do you want to perform these actions?
    Terraform will perform the actions described above.
    Only 'yes' will be accepted to approve.
    ```

    Skriv `yes` og trykk ENTER.

    Se [Command: apply - Terraform.io](https://www.terraform.io/cli/commands/apply) for mer informasjon om kommandoen.

6. Når `terraform apply`-kommandoen er ferdig kjørt vil du se en oppsummering i konsollet over hva som er utført.

    Eksempel:
    ```console
    azurerm_resource_group.rg: Creating...
    azurerm_resource_group.rg: Creation complete after 0s [id=/subscriptions/########-####-####-####-#########/resourceGroups/terraform-demo-jzygex]

    Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
    ```

---

## Manuell verifikasjon i Azure-portalen
For å verifisere at ressursen faktisk har blitt opprettet kan du finne frem til den i Azure-portalen eller med Azure CLI.

1. Logg inn i Azure-portalen (https://portal.azure.com) med demo-brukeren din og navigér deg til `Subscriptions` via søkefeltet.

2. Åpne Subscriptionen du har tilgang til og åpne menybladet `Resource groups`.

3. Verifiser at du i ressursgruppelisten finner en ressursgruppe med ditt demo-brukernavn, eksempel: `terraform-demo-jzygex`.

---

## Opprydding
1. Kjør følgende kommando for å rydde opp og slette ressursen(e) som ble opprettet i Azure med Terraform

    ```sh
    terraform destroy
    ```

    Igjen, skriv inn inn ditt demo-brukernavn (uten @domene.eksempel) når du blir bedt om dette.

    Kjøring av kommandoen vil oppsummere alle ressursene som vil bli slettet (`destroy`) i Azure basert på konfigurasjonen i `main.tf`-filen og eventuelt andre `.tf` filer i samme katalog. I tillegg vil Terraform be om bekreftelse om å utføre slette-handlingene

    Skriv `yes` og trykk ENTER.

    Eksempel:

    ```console
    Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the
    following symbols:
    - destroy

    Terraform will perform the following actions:

    # azurerm_resource_group.rg will be destroyed
    - resource "azurerm_resource_group" "rg" {
        - id       = "/subscriptions/########-####-####-####-#########/resourceGroups/terraform-demo-jzygex" -> null
        - location = "westeurope" -> null
        - name     = "terraform-demo-jzygex" -> null
        - tags     = {} -> null
        }

    Plan: 0 to add, 0 to change, 1 to destroy.

    Do you really want to destroy all resources?
    Terraform will destroy all your managed infrastructure, as shown above.
    There is no undo. Only 'yes' will be accepted to confirm.
    ```

3. Når `terraform destroy`-kommandoen er ferdig kjørt vil du se en oppsummering i konsollet over hva som er utført.

    Eksempel:
    ```console
    azurerm_resource_group.rg: Destroying... [id=/subscriptions/########-####-####-####-#########/resourceGroups/terraform-demo-jzygex]
    azurerm_resource_group.rg: Still destroying... [id=/subscriptions/########-####-####-####-#########/resourceGroups/terraform-demo-jzygex, 10s elapsed]
    azurerm_resource_group.rg: Destruction complete after 15s

    Destroy complete! Resources: 1 destroyed.
    ```


# **Gå videre til: [Terraform demo 2 - Endre infrastruktur](./06-terraform-demo-2.md)**