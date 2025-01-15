Class dc.irissalesforce.QueryMessage Extends (%Persistent, Ens.Util.RequestBodyMethods)
{

/// Select sentence
Property Query As %String;

Storage Default
{
<Data name="QueryMessageDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Query</Value>
</Value>
</Data>
<DataLocation>^dc.irissalesfoA76.QueryMessageD</DataLocation>
<DefaultData>QueryMessageDefaultData</DefaultData>
<IdLocation>^dc.irissalesfoA76.QueryMessageD</IdLocation>
<IndexLocation>^dc.irissalesfoA76.QueryMessageI</IndexLocation>
<StreamLocation>^dc.irissalesfoA76.QueryMessageS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
