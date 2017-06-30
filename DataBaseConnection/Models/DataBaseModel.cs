using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DataBaseConnection.Models
{
    public class DataBaseModel
    {
        public bool isConnected { get; set; }
        public string connectionMessage { get { return isConnected ? "connected successfully" : "unable to connect"; } }
    }
}