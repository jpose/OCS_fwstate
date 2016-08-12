'Author: Jérémy POSE
' v1.0 / 11/08/2016 / EN Version

option explicit

Dim CurrentProfiles
Dim LowerBound
Dim UpperBound
Dim iterate
Dim excludedinterfacesarray
Dim DomainState, PrivateState, PublicState

' Profile Type
Const NET_FW_PROFILE2_DOMAIN = 1
Const NET_FW_PROFILE2_PRIVATE = 2
Const NET_FW_PROFILE2_PUBLIC = 4

' Action
Const NET_FW_ACTION_BLOCK = 0
Const NET_FW_ACTION_ALLOW = 1

' Create the FwPolicy2 object.
Dim fwPolicy2
Set fwPolicy2 = CreateObject("HNetCfg.FwPolicy2")

CurrentProfiles = fwPolicy2.CurrentProfileTypes

' The returned 'CurrentProfiles' bitmask can
' have more than 1 bit set if multiple profiles 
' are active or current at the same time

if ( CurrentProfiles AND NET_FW_PROFILE2_DOMAIN ) then
   if fwPolicy2.FirewallEnabled(NET_FW_PROFILE2_DOMAIN) = TRUE then
      DomainState = "Firewall is ON on domain profile."
   else
      DomainState = "Firewall is OFF on domain profile."
   end if
end if

if ( CurrentProfiles AND NET_FW_PROFILE2_PRIVATE ) then
   if fwPolicy2.FirewallEnabled(NET_FW_PROFILE2_PRIVATE) = TRUE then
      PrivateState = "Firewall is ON on private profile."
   else
      PrivateState = "Firewall is OFF on private profile."
   end if
end if

if ( CurrentProfiles AND NET_FW_PROFILE2_PUBLIC ) then
   if fwPolicy2.FirewallEnabled(NET_FW_PROFILE2_PUBLIC) = TRUE then
      PublicState = "Firewall is ON on public profile."
   else
      PublicState = "Firewall is OFF on public profile."
   end if
end if

 Wscript.Echo _
  "<FWSTATE>" & vbCrLf & _
  "<DOMAINSTATE>" & DomainState & "</DOMAINSTATE>" & vbCrLf & _
  "<PRIVATESTATE>" & PrivateState & "</PRIVATESTATE>" & vbCrLf & _
  "<PUBLICSTATE>" & PublicState & "</PUBLICSTATE>" & vbCrLf & _
  "</FWSTATE>"
