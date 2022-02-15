# Terraform demo 2 - Endre infrastruktur
I forrige demo-modul provisjonerte du en ressursgruppe i Azure ved hjelp av Terraform og Azure CLI. I denne modulen vil du i tillegg til å opprette ressursgruppen fra tidligere også opprette et virtuelt nettverk (`vnet`) i Azure for deretter å endre ressursen ved å legge til tags.


## Forutsetninger
- Terraform installert lokalt - Se [Forberedelser](./00-forberedelser.md)
- Azure CLI installert lokalt - Se [Forberedelser](./00-forberedelser.md)
- Windows Terminal instalert - Se [Forberedelser](./00-forberedelser.md)
- Brukerkonto i en Azure AD tenant med aktiverte PIM-rettigheter til å opprette ressurser i Azure (tildeles under demoen).

---

## Initialisering og provisjonering av infrastruktur
Før infrastruktur-ressursene kan endres med Terraform må de først provisjoneres med Terraform, slik at de eksisterer i [Terraform State](https://www.terraform.io/language/state)

1. I Visual Studio Code-vinduet som ble åpnet fra tidligere demo-modul, åpne og inspiser filen `main.tf` i katalogen `modules\06-terraform-demo-2`.
    
    Her vil du se at Terraform-konfigurasjonen benytter `azurerm` som provider og at ressurser som er definert er av typen `azurerm_resource_group` og `azurerm_virtual_network`. 
    
    Legg merke til at `azurerm_virtual_network`-ressursen referer til ressursgruppen's navn direkte via Terraform-strukturen.
    
    Eksempel:
    ```console
    resource_group_name = azurerm_resource_group.rg.name
    ```

2. Basert på tilsvarende steg som i forrige demo-modul, provisjoner ressursene definert i Terraform-konfigurasjonen i katalogen `modules\06-terraform-demo-2`.

---

## Endring av infrastruktur
Etter at ressursene er provisjonert med Terraform kan konfigurasjonsfilene redigeres for å endre eller fjerne konfigurasjon på nye eller eksisterende ressurser i Azure som eksisterer i [Terraform State](https://www.terraform.io/language/state).

1. I Visual Studio Code, åpne filen `main.tf` i katalogen `modules\06-terraform-demo-2`.

2. Skriv inn følgende konfigurasjon innenfor `resource azurerm_virutal_network` ressurs-blokken og lagre filen.

    ```console
    tags = {
        Environment = "Terraform Demo"
        Team = "DevOps"
    }
    ```

3. Kjør kommando `terraform apply` på nytt og observér at Terraform vil utføre endrings-handlingen(e) (`Change`) på `azurerm_virtual_network`-ressursen ved å legge til tag-egenskapene som ble skrevet inn i konfigurasjonen.

    Eksempel:
    ```console
    Terraform will perform the following actions:

    # azurerm_virtual_network.vnet will be updated in-place
    ~ resource "azurerm_virtual_network" "vnet" {
            id                      = "/subscriptions/########-####-####-####-#########/resourceGroups/terraform-demo-jzygex/providers/Microsoft.Network/virtualNetworks/myTFVnet"
            name                    = "myTFVnet"
        ~ tags                    = {
            + "Environment" = "Terraform Demo"
            + "Team"        = "DevOps"
            }
            # (8 unchanged attributes hidden)
        }

    Plan: 0 to add, 1 to change, 0 to destroy.

    Do you want to perform these actions?
    Terraform will perform the actions described above.
    Only 'yes' will be accepted to approve.
    ``` 
    Skriv `yes` og trykk ENTER. 

4. Når `terraform apply`-kommandoen er ferdig kjørt vil du se en oppsummering i konsollet over hva som er utført.

    Eksempel:
    ```console
    azurerm_virtual_network.vnet: Modifying... [id=/subscriptions/########-####-####-####-#########/resourceGroups/terraform-demo-jzygex/providers/Microsoft.Network/virtualNetworks/myTFVnet]
    azurerm_virtual_network.vnet: Modifications complete after 0s [id=/subscriptions/########-####-####-####-#########/resourceGroups/terraform-demo-jzygex/providers/Microsoft.Network/virtualNetworks/myTFVnet]

    Apply complete! Resources: 0 added, 1 changed, 0 destroyed.
    ```

---

## Manuell verifikasjon i Azure-portalen
For å verifisere at ressursen faktisk har blitt endret kan du finne frem til den i Azure-portalen eller med Azure CLI.

1. Logg inn i Azure-portalen (https://portal.azure.com) med demo-brukeren din og navigér deg til `Subscriptions` via søkefeltet.

2. Åpne Subscriptionen du har tilgang til og åpne menybladet `Resource groups`.

3. Åpne ressursgruppen tilhørende din demo-bruker, eksempel: `terraform-demo-jzygex`.

4. Åpne Virtual Network-ressursen `myTFVnet`.

5. Verifiser at ressursen har taggene `Environment:Terraform Demo` og `Team:DevOps` definert. Dette bekrefter at endringen du utførte med Terraform var vellykket.


---

## Opprydding
1. Kjør følgende kommando for å rydde opp og slette ressursen(e) som ble opprettet i Azure med Terraform

    ```sh
    terraform destroy
    ```

    Igjen, skriv inn inn ditt demo-brukernavn (uten @domene.eksempel) når du blir bedt om dette.

    Kjøring av kommandoen vil oppsummere alle ressursene som vil bli slettet (`destroy`) i Azure basert på konfigurasjonen i `main.tf`-filen og eventuelt andre `.tf` filer i samme katalog. I tillegg vil Terraform be om bekreftelse om å utføre slette-handlingene

    Skriv `yes` og trykk ENTER.

---

### Bonus: Publiser endringene dine til GitHub med git push
Endringene du har utført i repositoriet er kun utført lokalt på din maskin. For at endringen skal publiseres til ditt "remote" repository i GitHub må du benytte kommando git push.

1. Åpne Git Bash på lokal maskin.

2. Naviger til roten av repositoriet ditt med følgende kommando

    ```sh
    cd "~\code\iac-terraform-demo"
    ```

    Tips: `~` i et Linux-type Bash shell er å anse som tilsvarende som `%USERPROFILE%` i Windows.

3. Iscenesett/legg til den endrede filen `main.tf` i katalogen `modules\06-terraform-demo-2` med følgende kommando

    ```sh
    git add .\modules\06-terraform-demo-2\main.tf
    ```

4. Commit endringene som er iscenesatt med følgende kommando

    ```sh
    git commit -m "Add tag configuration to virtual network resource"
    ```

    Kommandoen beskriver også hva som vil utføres i commiten.

    Tips: Se [How to write a Git commit message](https://chris.beams.io/posts/git-commit/) for gode råd til skrivemåte i commit-meldinger.

5. Publiser endringene til Github med følgende kommando

    ```sh
    git push --set-origin origin main
    ```
    Det kan hende du blir bedt om å skrive inn passordet for SSH-nøkkelen din. Tast inn dette og trykk ENTER.

    Kommandoen sier i essens at du ønsker å publisere endringene mot samme sted du hentet repositoriet ned fra. Ved påfølgende `git push` kommandoer innenfor samme lokale katalog behøves det ikke å ta med `--set-origin origin main`-delen.

6. Åpne GitHub-repositoriet ditt i nettleseren og verifiser at `main.tf`-filen i katalogen `modules/06-terraform-demo-02` er oppdatert med tag-konfigurasjonen du skrev inn.