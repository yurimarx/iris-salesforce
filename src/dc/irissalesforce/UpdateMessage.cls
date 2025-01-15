Class dc.irissalesforce.UpdateMessage Extends (%Persistent, Ens.Util.RequestBodyMethods)
{

/// Object Id
Property Id As %String;

/// new content
Property Content As %String(MAXLEN = "");

Property ClassName As %String;

Storage Default
{
<Data name="UpdateMessageDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Id</Value>
</Value>
<Value name="3">
<Value>Content</Value>
</Value>
<Value name="4">
<Value>ClassName</Value>
</Value>
</Data>
<DataLocation>^dc.irissalesfA76.UpdateMessageD</DataLocation>
<DefaultData>UpdateMessageDefaultData</DefaultData>
<IdLocation>^dc.irissalesfA76.UpdateMessageD</IdLocation>
<IndexLocation>^dc.irissalesfA76.UpdateMessageI</IndexLocation>
<StreamLocation>^dc.irissalesfA76.UpdateMessageS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
