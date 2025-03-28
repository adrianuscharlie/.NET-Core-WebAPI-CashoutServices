﻿using Microsoft.AspNetCore.Mvc;
using CashoutServices.Models;
using CashoutServices.Services;
using Serilog;

namespace CashoutServices.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class Cashout : ControllerBase
    {
        private readonly ICashoutServices services;
        public Cashout(ICashoutServices cashoutServices)
        {
            services = cashoutServices;
        }

        [HttpPost]
        public IActionResult Post([FromBody]Request request)
        {
            try
            {
                Log.Information($"Request Received  CACODE:{request.cacode};customerNumber:{request.customerNumber};amount:{request.amount};trxType:{request.trxType}");
                Response response = services.Cashout(request);
                if (response.responseCode.StartsWith("50")) return StatusCode(500, response);
                return Ok(response);
            }
            catch (Exception ex)
            {
                return StatusCode(500, "Internal Server Error");
            }
        }
    }
}
