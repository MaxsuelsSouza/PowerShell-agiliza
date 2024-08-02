param (
    [switch]$c,
    [switch]$r
)

$projectPaths = @{
    "nomeSeuProjeto1"  = "Caminho do seu projeto"
}

function Run-Project($projectName) {
    $commands = @{
        "Convenio" = "comandoParaExecutarProjetoConvenio"
    }

    if ($commands.ContainsKey($projectName)) {
        Write-Host "Executando comando especifico para o projeto '$projectName'"
        Start-Process "cmd.exe" "/c $($commands[$projectName])"
    }
    else {
        Write-Error "Projeto '$projectName' não encontrado."
    }
}

function Open-Project($projectName) {
    if ($projectPaths.ContainsKey($projectName)) {
        Write-Host "Abrindo o projeto '$projectName' no Visual Studio Code"
        Start-Process "code" -ArgumentList $projectPaths[$projectName]
    }
    else {
        Write-Error "Projeto '$projectName' não encontrado."
    }
}

if ($c) {
    Open-Project "seuProjeto1"
    if ($r) {
        Write-Host "Executando comando PowerShell para o projeto"
        Start-Process "powershell.exe" -ArgumentList "-NoExit", "-Command", "cd D:\Caminho\do\seu\projeto; .\comandoParaExecutarProjetoConvenio"
    }
}
else {
    Write-Error "sua mensagem de erro"
}

