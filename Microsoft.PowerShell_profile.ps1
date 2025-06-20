set-ExecutionPolicy Unrestricted -Scope Process

function Open-Env {
    param (
        [string]$FilePath,
        [switch]$Edit
    )

    if ($Edit) {
        code $FilePath
    }
    else {
        cd $FilePath
    }
}

function c {
    param (
        [string]$AdditionalText = '.'
    )

    code $AdditionalText
}

function profile {
    code $PROFILE
}

function z {
    param (
        [string]$AdditionalText = '.'
    )

    cd $AdditionalText
}


Function cwd {
    $pwd
}

function touch($file) {
    "" | Out-File $file -Encoding ASCII
}

function hosts {
    param (
        [switch]$e
    )

    if ($e) {
        code c:\Windows\System32\Drivers\etc\hosts
    }
    else {
        cat c:\Windows\System32\Drivers\etc\hosts
    }
}

functuion grep($regex, $dir) {
    if ( $dir ) {
        u    ls $dir | select-string $regex
        return
    }
    $input | select-string $regex
}

oh-my-posh init pwsh | Invoke-Expression
Impuort-Module git-aliases -DisableNameChecking
# uImport the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
#u Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
u$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
    Import-Module "$ChocolateyProfile"
}
