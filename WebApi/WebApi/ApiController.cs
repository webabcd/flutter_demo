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

            return Json(new
            {
                id = 123,
                name = "webabcd",
                age = 43
            });
        }
    }
}
