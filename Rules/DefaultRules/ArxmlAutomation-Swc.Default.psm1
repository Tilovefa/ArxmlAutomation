Import-Module ArxmlAutomation-Swc
function Set-AssemblySWConnectorShortName{
    param(
        [AR430.AssemblySwConnector]
        $AssemblySwConnector,
        [AR430.AUTOSARCollection]
        $AutoSarCollection
    )
    process{
        # default naming rule
        # <P_ComponentName>_<PortName>_<R_ComponentName>_<PortName>
        $P_Component=$AssemblySwConnector.ProviderIref.ContextComponentRef|Find-ArElementFromRef -AUTOSARCollection $AutoSarCollection
        $P_Port=$AssemblySwConnector.ProviderIref.TargetPPortRef|Find-ArElementFromRef -AUTOSARCollection $AutoSarCollection
        $R_Component=$AssemblySwConnector.RequesterIref.ContextComponentRef|Find-ArElementFromRef -AUTOSARCollection $AutoSarCollection
        $R_Port=$AssemblySwConnector.RequesterIref.TargetRPortRef|Find-ArElementFromRef -AUTOSARCollection $AutoSarCollection
        return "$($P_Component)_$($P_Port)_$($R_Component)_$($R_Port)"
    }
}
function Confirm-AssemblySWConnector{
    param(
        [AR430.AssemblySwConnector]
        $AssemblySwConnector,
        [AR430.AUTOSARCollection]
        $AutoSarCollection
    )
    process{
        return true
    }
}