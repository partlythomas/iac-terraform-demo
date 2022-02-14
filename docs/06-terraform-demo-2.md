# Terraform demo 2 - Endre infrastruktur
I forrige demo-modul provisjonerte du en ressursgruppe i Azure ved hjelp av Terraform og Azure CLI. I denne modulen vil du i tillegg til å opprette ressursgruppen fra tidligere også opprette et virtuelt nettverk (`vnet`) i Azure for deretter å endre ressursen ved å legge til tags.


## Forutsetninger
- Terraform installert lokalt - Se [Forberedelser](./00-forberedelser.md)
- Azure CLI installert lokalt - Se [Forberedelser](./00-forberedelser.md)
- Windows Terminal instalert - Se [Forberedelser](./00-forberedelser.md)
- Brukerkonto i en Azure AD tenant med aktiverte PIM-rettigheter til å opprette ressurser i Azure (tildeles under demoen).

---

## Initialisering og provisjonering av infrastruktur
1. I Visual Studio Code-vinduet som ble åpnet fra tidligere demo-modul, åpne og inspiser filen `main.tf` i katalogen `modules\06-terraform-demo-2`.
    
    Her vil du se at Terraform-konfigurasjonen benytter `azurerm` som provider og at ressurser som er definert er av typen `azurerm_resource_group` og `azurerm_virtual_network`. 
    
    Legg merke til at `azurerm_virtual_network`-ressursen referer til ressursgruppen's navn direkte via Terraform-strukturen.
    
    Eksempel:
    ```console
    resource_group_name = azurerm_resource_group.rg.name
    ```

2. Basert på tilsvarende steg som i forrige demo-modul, provisjoner ressursene definert i Terraform-konfigurasjonen i katalogen `modules\06-terraform-demo-2`.

3. Etter at ressursene er vellykket 

