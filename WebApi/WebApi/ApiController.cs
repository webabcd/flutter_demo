using Microsoft.AspNetCore.Mvc;
using System.IO;
using System.Threading;

namespace WebApi
{
    public class ApiController : Controller
    {
        [Route("get")]
        public IActionResult GetDemo()
        {
            Thread.Sleep(2000);

            var myHeader = Request.Headers["myHeader"];

            return Json(new
            {
                id = 123,
                name = $"get, myHeader:{myHeader}"
            });
        }

        [Route("post")]
        [HttpPost]
        public IActionResult PostDemo()
        {
            Stream stream = HttpContext.Request.Body;
            StreamReader reader = new StreamReader(stream);
            var postData = reader.ReadToEndAsync().Result;
            reader.Close();
            stream.Close();

            Thread.Sleep(2000);

            return Json(new
            {
                id = 123,
                name = $"post, postData:{postData}"
            });
        }
    }
}
