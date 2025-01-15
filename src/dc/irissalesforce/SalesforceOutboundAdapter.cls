Class dc.irissalesforce.SalesforceOutboundAdapter Extends Ens.OutboundAdapter
{

Property SFVersion As %String(VALUELIST = ",v62.0,v61.0,v60.0,v59.0,v58.0,v57.0,v56.0,v55.0,v54.0,v53.0,v52.0,v51.0,v50.0,v49.0,v48.0,v47.0,v46.0,v45.0,v44.0,v43.0,v42.0,v41.0,v40.0,v39.0,v38.0,v37.0,v36.0,v35.0,v34.0,v33.0,v32.0,v31.0") [ InitialExpression = "v62.0" ];

Property SFCredsFile As %String(MAXLEN = 1000);

Property SSLConfig As %String;

Parameter SETTINGS = "SFVersion:Connect,SFCredsFile:Connect:fileSelector,SSLConfig:Connect:sslConfigSelector";

Method PrepareRequest(sfToken As %DynamicObject) As %Net.HttpRequest
{
    Set sfReq = ##class(%Net.HttpRequest).%New()
    Set sfReq.Server = sfToken.instance
    Set sfReq.Https = 1
    Set sfReq.SSLConfiguration = ..SSLConfig
    Do sfReq.SetHeader("Authorization", "Bearer "_sfToken."access_token")
    Return sfReq
}

/// Query Salesforce with SQL query to get a JSON response with business data
Method Query(queryRequest As dc.irissalesforce.QueryMessage, Output queryResponse As Ens.StreamContainer) As %Status
{
    Set sc = $$$OK
    Set sfToken = {}
    Set queryResponse = ##class(Ens.StreamContainer).%New()
    
    Try {
        Do ..GetAuthotizationToken(.sfToken) 
        
        Set sfReq = ..PrepareRequest(sfToken)
        Do sfReq.SetParam("q", queryRequest.Query)
        Do sfReq.Get("/services/data/"_..SFVersion_"/query")
        Do queryResponse.StreamSet(sfReq.HttpResponse.Data)
    }
    Catch ex {
        Set sc = ex.AsStatus()
    }

    Return sc
}

/// Get Salesforce data with ID to get a JSON response with business data
Method GetById(idRequest As dc.irissalesforce.ByIdMessage, Output queryResponse As Ens.StreamContainer) As %Status
{
    Set sc = $$$OK
    Set sfToken = {}
    Set queryResponse = ##class(Ens.StreamContainer).%New()
    
    Try {
        Do ..GetAuthotizationToken(.sfToken) 
        
        Set sfReq = ..PrepareRequest(sfToken)
        Do sfReq.Get("/services/data/"_..SFVersion_"/sobjects/"_idRequest.ClassName_"/"_idRequest.Id)
        Do queryResponse.StreamSet(sfReq.HttpResponse.Data)
    }
    Catch ex {
        Set sc = ex.AsStatus()
    }

    Return sc
}

/// Create a new Salesforce object with json data
Method Create(createRequest As dc.irissalesforce.CreateMessage, Output createResponse As Ens.StreamContainer) As %Status
{
    Set sc = $$$OK
    Set sfToken = {}
    Set createResponse = ##class(Ens.StreamContainer).%New()
    
    Try {
        Do ..GetAuthotizationToken(.sfToken) 
        
        Set sfReq = ..PrepareRequest(sfToken)
        Set sfReq.ContentType = "application/json"
        Do sfReq.EntityBody.Write(createRequest.Content)
        Do sfReq.Post("/services/data/"_..SFVersion_"/sobjects/"_createRequest.ClassName_"/")
        Do createResponse.StreamSet(sfReq.HttpResponse.Data)
    }
    Catch ex {
        Set sc = ex.AsStatus()
    }

    Return sc
}

/// Update the Salesforce object with json data
Method Update(updateRequest As dc.irissalesforce.UpdateMessage, Output updateResponse As Ens.StreamContainer) As %Status
{
    Set sc = $$$OK
    Set sfToken = {}
    Set updateResponse = ##class(Ens.StreamContainer).%New()
    
    Try {
        Do ..GetAuthotizationToken(.sfToken) 
        
        Set sfReq = ..PrepareRequest(sfToken)
        Set sfReq.ContentType = "application/json"
        Do sfReq.EntityBody.Write(updateRequest.Content)
        Do sfReq.Patch("/services/data/"_..SFVersion_"/sobjects/"_updateRequest.ClassName_"/"_updateRequest.Id_"/")
        Do sfReq.HttpResponse.OutputToDevice()
        Do updateResponse.StreamSet(sfReq.HttpResponse.Data)
    }
    Catch ex {
        Set sc = ex.AsStatus()
    }

    Return sc
}

/// Delete the Salesforce object by id
Method Delete(deleteRequest As dc.irissalesforce.DeleteMessage, Output deleteResponse As Ens.StreamContainer) As %Status
{
    Set sc = $$$OK
    Set sfToken = {}
    Set deleteResponse = ##class(Ens.StreamContainer).%New()
    
    Try {
        Do ..GetAuthotizationToken(.sfToken) 
        
        Set sfReq = ..PrepareRequest(sfToken)
        Set sfReq.ContentType = "application/json"
        Do sfReq.Delete("/services/data/"_..SFVersion_"/sobjects/"_deleteRequest.ClassName_"/"_deleteRequest.Id_"/")
        Do sfReq.HttpResponse.OutputToDevice()
        Do deleteResponse.StreamSet(sfReq.HttpResponse.Data)
    }
    Catch ex {
        Set sc = ex.AsStatus()
    }

    Return sc
}

/// Get OAuth token
Method GetAuthotizationToken(Output oauthToken As %DynamicObject) As %Status
{
    Set sc = $$$OK
    Set sfCreds = {}

    Try { 
        Set sfCreds = {}.%FromJSONFile(..SFCredsFile)
        
        Set sfReq = ##class(%Net.HttpRequest).%New()
        Set sfReq.Server = sfCreds.instance
        Set sfReq.Https = 1
        Set sfReq.SSLConfiguration = ..SSLConfig
        Do sfReq.InsertFormData("grant_type", "password")
        Do sfReq.InsertFormData("client_id", sfCreds.clientId)
        Do sfReq.InsertFormData("client_secret", sfCreds.clientSecret)
        Do sfReq.InsertFormData("username", sfCreds.username)
        Do sfReq.InsertFormData("password", sfCreds.password)
        Do sfReq.Post("/services/oauth2/token")
        Set oauthToken = {}.%FromJSON(sfReq.HttpResponse.Data.Read())
        Set oauthToken.instance = sfCreds.instance
    }
    Catch ex {
        Set sc = ex.AsStatus()
    }
    
    Return sc
}

}
