# Profile.ps1

Location (cf. [about profiles](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_profiles)):
- Current user, Current Host:
    - Default: $HOME\Documents\PowerShell\Microsoft.PowerShell_profile.ps1
    - VSCode: $HOME\Documents\PowerShell\Microsoft.VSCode_profile.ps1
- ...

Note:
- PowerShell supports several profile files that are scoped to users and PowerShell hosts: All Users All Hosts, All Users Current Host, Current User All Hosts, Current User Current Host
- The $PROFILE variable stores the path to the "Current User, Current Host" profile

Tips:
- code $PROFILE (open in VSCode)
- . $PROFILE (reload the profile)
