using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using Demo.EF;
using Demo.Extend;

namespace Demo.Providers
{
    public class DemoProvider
    {
        public static List<DemoProduct> GetProducts()
        {
            try
            {
                using (var db = new localEntities())
                {
                    var result = db.DemoProducts.ToList();
                    return result.Any() ? result : null;
                }
            }
            catch (Exception e)
            {
                LogUtility.LogError(MethodBase.GetCurrentMethod().ReflectedType, MethodBase.GetCurrentMethod().Name, e);
                return null;
            }
        }

        public static List<String> GetProductMonths()
        {
            try
            {
                using (var db = new localEntities())
                {
                    var result = db.DemoProducts.Select(x => x.Month).Distinct();
                    return result.Any() ? result.ToList() : null;
                }
            }
            catch (Exception e)
            {
                LogUtility.LogError(MethodBase.GetCurrentMethod().ReflectedType, MethodBase.GetCurrentMethod().Name, e);
                return null;
            }
        }

    }
}