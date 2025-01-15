Class dc.irissalesforce.ByIdMessage Extends (%Persistent, Ens.Util.RequestBodyMethods)
{

/// Id
Property Id As %String;

Property ClassName As %String;

Storage Default
{
<Data name="ByIdMessageDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Id</Value>
</Value>
<Value name="3">
<Value>ClassName</Value>
</Value>
</Data>
<DataLocation>^dc.irissalesforce.ByIdMessageD</DataLocation>
<DefaultData>ByIdMessageDefaultData</DefaultData>
<IdLocation>^dc.irissalesforce.ByIdMessageD</IdLocation>
<IndexLocation>^dc.irissalesforce.ByIdMessageI</IndexLocation>
<StreamLocation>^dc.irissalesforce.ByIdMessageS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
