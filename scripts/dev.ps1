$ErrorActionPreference = "Stop"

$projectRoot = Resolve-Path (Join-Path $PSScriptRoot "..")
Set-Location $projectRoot

$env:BUNDLE_PATH = Join-Path $projectRoot "vendor/bundle"

function Test-Command {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Name
    )

    return $null -ne (Get-Command $Name -ErrorAction SilentlyContinue)
}

function Get-IsWindows {
    return $env:OS -eq "Windows_NT"
}

function Add-PathEntry {
    param(
        [Parameter(Mandatory = $true)]
        [string]$PathEntry
    )

    $normalized = $PathEntry.TrimEnd([IO.Path]::DirectorySeparatorChar, [IO.Path]::AltDirectorySeparatorChar)
    $separator = [IO.Path]::PathSeparator
    $current = @()

    if ($env:Path) {
        $current = $env:Path -split [regex]::Escape($separator)
    }

    if ($current -notcontains $normalized) {
        if ([string]::IsNullOrWhiteSpace($env:Path)) {
            $env:Path = $normalized
        }
        else {
            $env:Path = $normalized + $separator + $env:Path
        }
    }
}

function Ensure-RubyOnPath {
    if (Test-Command "ruby") {
        return $true
    }

    if (-not (Get-IsWindows)) {
        return $false
    }

    $candidateBins = @(
        "$env:SystemDrive\Ruby40-x64\bin",
        "$env:SystemDrive\Ruby40\bin",
        "$env:SystemDrive\Ruby34-x64\bin",
        "$env:SystemDrive\Ruby34\bin",
        "$env:SystemDrive\Ruby33-x64\bin",
        "$env:SystemDrive\Ruby33\bin"
    )

    foreach ($bin in $candidateBins) {
        if (Test-Path (Join-Path $bin "ruby.exe")) {
            Add-PathEntry $bin
            return $true
        }
    }

    return $false
}

function Get-BundlerVersionFromLock {
    $lockPath = Join-Path $projectRoot "Gemfile.lock"
    if (-not (Test-Path $lockPath)) {
        return $null
    }

    $lines = Get-Content $lockPath
    for ($i = 0; $i -lt $lines.Length; $i++) {
        if ($lines[$i].Trim() -eq "BUNDLED WITH") {
            if ($i + 1 -lt $lines.Length) {
                $version = $lines[$i + 1].Trim()
                if ($version) {
                    return $version
                }
            }
            break
        }
    }

    return $null
}

function Ensure-Bundle {
    if (-not (Ensure-RubyOnPath)) {
        throw "Ruby is not available. Install Ruby and ensure it is on PATH, then rerun."
    }

    if (-not (Test-Command "gem")) {
        throw "RubyGems is not available. Reinstall Ruby and ensure it is on PATH."
    }

    $bundlerVersion = Get-BundlerVersionFromLock
    if ($bundlerVersion) {
        $env:BUNDLER_VERSION = $bundlerVersion
    }
    else {
        Remove-Item Env:BUNDLER_VERSION -ErrorAction SilentlyContinue
    }

    if (-not (Test-Command "bundle")) {
        if ($bundlerVersion) {
            Write-Host ("Bundler not found. Installing Bundler " + $bundlerVersion + "...")
            & gem install bundler -v $bundlerVersion --no-document
        }
        else {
            Write-Host "Bundler not found. Installing the latest Bundler..."
            & gem install bundler --no-document
        }

        if ($LASTEXITCODE -ne 0) {
            throw "Failed to install Bundler. Review the output above for details."
        }
    }

    if ($bundlerVersion) {
        & gem list bundler -i -v $bundlerVersion | Out-Null
        if ($LASTEXITCODE -ne 0) {
            Write-Host ("Bundler " + $bundlerVersion + " is required. Installing...")
            & gem install bundler -v $bundlerVersion --no-document
            if ($LASTEXITCODE -ne 0) {
                throw ("Failed to install Bundler " + $bundlerVersion + ". Review the output above for details.")
            }
        }
    }

    & bundle check
    if ($LASTEXITCODE -ne 0) {
        & bundle install
        if ($LASTEXITCODE -ne 0) {
            throw "bundle install failed. Review the output above for details."
        }
    }
}

function Start-DecapServer {
    $decapScript = Join-Path $projectRoot "node_modules/decap-server/dist/index.js"
    $node = Get-Command "node" -ErrorAction SilentlyContinue
    if (-not $node -or -not (Test-Path $decapScript)) {
        Write-Warning "Decap local backend unavailable. Install the documented Node.js version and run npm ci."
        return $null
    }

    try {
        if (Get-IsWindows) {
            return Start-Process -FilePath $node.Source -ArgumentList ('"' + $decapScript + '"') -WorkingDirectory $projectRoot -WindowStyle Hidden -PassThru -ErrorAction Stop
        }

        return Start-Process -FilePath $node.Source -ArgumentList ('"' + $decapScript + '"') -WorkingDirectory $projectRoot -PassThru -ErrorAction Stop
    } catch {
        Write-Warning ("Failed to start the Decap local backend: " + $_.Exception.Message)
        return $null
    }
}

Ensure-Bundle
$decap = Start-DecapServer

try
{
    bundle exec jekyll serve --config _config.yml,_config.local.yml
    if ($LASTEXITCODE -ne 0) {
        throw "Jekyll failed. Review the output above for details."
    }
}
finally
{
    if ($decap -and -not $decap.HasExited)
    {
        Stop-Process -Id $decap.Id -Force -ErrorAction SilentlyContinue
    }
}
