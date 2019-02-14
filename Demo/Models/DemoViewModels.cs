using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Demo.Models
{
    public class DemoUser
    {
        public int Si { get; set; }
        public string Name { get; set; }
        public List<string> Hobby { get; set; }
    }
}