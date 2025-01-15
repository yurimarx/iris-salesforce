Class dc.irissalesforce.CreateMessage Extends (%Persistent, Ens.Util.RequestBodyMethods)
{

/// new content
Property Content As %String(MAXLEN = "");

Property ClassName As %String;

Storage Default
{
<Data name="CreateMessageDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Content</Value>
</Value>
<Value name="3">
<Value>ClassName</Value>
</Value>
</Data>
<DataLocation>^dc.irissalesfA76.CreateMessageD</DataLocation>
<DefaultData>CreateMessageDefaultData</DefaultData>
<IdLocation>^dc.irissalesfA76.CreateMessageD</IdLocation>
<IndexLocation>^dc.irissalesfA76.CreateMessageI</IndexLocation>
<StreamLocation>^dc.irissalesfA76.CreateMessageS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
