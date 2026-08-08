$page = Get-Content -Raw -Encoding UTF8 "$PSScriptRoot\..\index.html"
$cv = Get-Content -Raw -Encoding UTF8 "$PSScriptRoot\..\assets\giang-cv.txt"

function Assert-Contains {
    param([string]$Text, [string]$Expected, [string]$Message)

    if (-not $Text.Contains($Expected)) {
        throw $Message
    }
}

function Assert-NotContains {
    param([string]$Text, [string]$Unexpected, [string]$Message)

    if ($Text.Contains($Unexpected)) {
        throw $Message
    }
}

Assert-Contains $page 'https://github.com/hgiang7193' 'GitHub profile link is missing.'
Assert-Contains $page 'https://github.com/hgiang7193/HRmanagement' 'HR Management project link is missing.'
Assert-Contains $page 'https://github.com/hgiang7193/Gymmanagement-' 'MYFIT project link is missing.'
Assert-Contains $page 'https://github.com/hgiang7193/Tuvi' 'Tuvi side-project link is missing.'
Assert-Contains $page 'Web Management Projects' 'Project heading does not describe the portfolio focus.'
Assert-Contains $page 'mailto:gianghuongtraan1102@gmail.com' 'Portfolio email link is missing.'
Assert-Contains $page 'https://zalo.me/0353092998' 'Zalo contact link is missing.'
Assert-Contains $page 'https://www.facebook.com/giang.tran.337570' 'Facebook contact link is missing.'
Assert-NotContains $page 'Data Analysis & Quality Assurance Projects' 'Portfolio still claims data-analysis projects.'
Assert-NotContains $page 'https://www.linkedin.com' 'Placeholder LinkedIn link must not ship.'
Assert-NotContains $page 'giang@example.com' 'Placeholder email must not ship.'
Assert-Contains $cv 'gianghuongtraan1102@gmail.com' 'CV email is missing.'
Assert-Contains $cv '0353092998' 'CV Zalo number is missing.'
Assert-Contains $cv 'https://www.facebook.com/giang.tran.337570' 'CV Facebook link is missing.'
