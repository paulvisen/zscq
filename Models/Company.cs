using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace zscq.Models
{
    public class Company : User
    {
        public String ComName { get; set; }
        public String LegalRepresentative { get; set; }
        public String BusinessLicenseNum { get; set; }
        public String LicenseImg { get; set; }
        public String Area { get; set; }
        public String Address { get; set; }
        public String Introduce { get; set; }
        public int RegMoney { get; set; }
        public String MainCustomer { get; set; }
        
    }
}