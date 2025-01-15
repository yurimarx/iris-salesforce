Class dc.irissalesforce.DeleteMessage Extends (%Persistent, Ens.Util.RequestBodyMethods)
{

/// Id
Property Id As %String;

Property ClassName As %String;

Storage Default
{
<Data name="DeleteMessageDefaultData">
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
<DataLocation>^dc.irissalesfA76.DeleteMessageD</DataLocation>
<DefaultData>DeleteMessageDefaultData</DefaultData>
<IdLocation>^dc.irissalesfA76.DeleteMessageD</IdLocation>
<IndexLocation>^dc.irissalesfA76.DeleteMessageI</IndexLocation>
<StreamLocation>^dc.irissalesfA76.DeleteMessageS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
