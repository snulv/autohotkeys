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

Invoke-Expression (&starship init powershell)
Import-Module git-aliases -DisableNameChecking
