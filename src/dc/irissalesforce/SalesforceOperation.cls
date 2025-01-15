Class dc.irissalesforce.SalesforceOperation Extends Ens.BusinessOperation
{

Parameter ADAPTER = "dc.irissalesforce.SalesforceOutboundAdapter";

Parameter INVOCATION = "Queue";

/// Get Salesforce data from SQL query 
Method Query(queryRequest As dc.irissalesforce.QueryMessage, Output queryResponse As Ens.StreamContainer) As %Status
{
    Set sc = $$$OK
    Set queryResponse = ##class(Ens.StreamContainer).%New()

    Set sc = ..Adapter.Query(queryRequest, .queryResponse)

    Return sc
}

/// Get Salesforce object data from Object ID
Method GetById(idRequest As dc.irissalesforce.ByIdMessage, Output queryResponse As Ens.StreamContainer) As %Status
{
    Set sc = $$$OK
    Set queryResponse = ##class(Ens.StreamContainer).%New()

    Set sc = ..Adapter.GetById(idRequest, .queryResponse)

    Return sc
}

/// Create Salesforce object with data from JSON 
Method Create(createRequest As dc.irissalesforce.CreateMessage, Output createResponse As Ens.StreamContainer) As %Status
{
    Set sc = $$$OK
    Set createResponse = ##class(Ens.StreamContainer).%New()

    Set sc = ..Adapter.Create(createRequest, .createResponse)

    Return sc
}

/// Update Salesforce object with data from JSON 
Method Update(updateRequest As dc.irissalesforce.UpdateMessage, Output updateResponse As Ens.StreamContainer) As %Status
{
    Set sc = $$$OK
    Set updateResponse = ##class(Ens.StreamContainer).%New()

    Set sc = ..Adapter.Update(updateRequest, .updateResponse)

    Return sc
}

/// Delete Salesforce object by Id 
Method Delete(deleteRequest As dc.irissalesforce.DeleteMessage, Output deleteResponse As Ens.StreamContainer) As %Status
{
    Set sc = $$$OK
    Set deleteResponse = ##class(Ens.StreamContainer).%New()

    Set sc = ..Adapter.Delete(deleteRequest, .deleteResponse)

    Return sc
}

XData MessageMap
{
<MapItems>
  <MapItem MessageType="dc.irissalesforce.QueryMessage">
    <Method>Query</Method>
  </MapItem>
  <MapItem MessageType="dc.irissalesforce.ByIdMessage">
    <Method>GetById</Method>
  </MapItem>
  <MapItem MessageType="dc.irissalesforce.CreateMessage">
    <Method>Create</Method>
  </MapItem>
  <MapItem MessageType="dc.irissalesforce.UpdateMessage">
    <Method>Update</Method>
  </MapItem>
  <MapItem MessageType="dc.irissalesforce.DeleteMessage">
    <Method>Delete</Method>
  </MapItem>
</MapItems>
}

}
