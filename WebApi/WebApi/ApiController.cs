using Microsoft.AspNetCore.Mvc;
using System.Threading;

namespace WebApi
{
    public class ApiController : Controller
    {
        [Route("json")]
        public IActionResult Hello()
        {
            Thread.Sleep(2000);

            var myHeader = Request.Headers["myHeader"];

            return Json(new
            {
                id = 123,
                name = $"webabcd, myHeader:{myHeader}",
                age = 43
            });
        }
    }
}
