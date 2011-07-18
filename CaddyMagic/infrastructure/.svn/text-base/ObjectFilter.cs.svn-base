using System.Web.Mvc;
using System;
using System.Runtime.Serialization.Json;

public class ObjectFilter : ActionFilterAttribute
{

    public string Param { get; set; }
    public Type RootType { get; set; }

    public override void OnActionExecuting(ActionExecutingContext filterContext)
    {
        if ((filterContext.HttpContext.Request.ContentType ?? string.Empty).Contains("application/json"))
        {
            object o =
            new DataContractJsonSerializer(RootType).ReadObject(filterContext.HttpContext.Request.InputStream);
            filterContext.ActionParameters[Param] = o;
        }

    }
}