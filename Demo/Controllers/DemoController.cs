using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using System.Web.Mvc;
using Demo.Models;
using Demo.Providers;

namespace Demo.Controllers
{
    public class DemoController : Controller
    {
        public ActionResult Index()
        {

            return View();
        }

        public ActionResult Redir()
        {
            return RedirectToAction("Index", "Demo", new { SelectedClassification = "test" });
        }
        /// <summary>
        /// Using pivot extension to create datatable with one key
        /// </summary>
        /// <returns></returns>
        public ActionResult ToPivotTable()
        {
            var products = DemoProvider.GetProducts()
                .ToPivotTable(x => x.Month, x => x.Brand, v => v.Any() ? v.Sum(x => x.Value) : 0);
            return View(products);
        }

        /// <summary>
        /// Using Linq to create pivot with 2 step
        /// 1. group data 
        /// 2. create datatable and fill 
        /// </summary>
        /// <returns></returns>
        public ActionResult LinqPivot()
        {
            //get data  
            var products = DemoProvider.GetProducts();
            //get month list for later use
            var months = products.Select(x => x.Month).Distinct().ToList();
            #region using linq group by month
            var list = DemoProvider.GetProducts().GroupBy(x => new {x.Brand, x.Product})
                .Select(g => new
                {
                    g.Key.Brand,
                    g.Key.Product,
                    Month = g.GroupBy(x => x.Month).OrderBy(x => x.Key)
                        .Select(y => new { y.Key, Value = y.Sum(z => z.Value) })
                });
            #endregion

            #region create datatable
            var dt = new DataTable();
            dt.Columns.Add("Brand");
            dt.Columns.Add("Product");
            foreach (var m in months)
            {
                dt.Columns.Add(m);
            }
            dt.Columns.Add("Sum");
            #endregion region

            #region fill data
            foreach (var d in list)
            {
                int sum = 0;
                var row = dt.NewRow();
                row["Brand"] = d.Brand;
                row["Product"] = d.Product;
                foreach (string m in months)
                {
                    var item = d.Month.Where(x => x.Key == m).ToList();
                    var value = item.Count == 1 ? item.First().Value : 0;
                    row[m] = value;
                    sum += value;
                }
                dt.Rows.Add(row);
                row["Sum"] = sum;
            }
            #endregion

            return View(dt);
        }

        public ActionResult CheckList()
        {
            var list = DemoProvider.GetDemoUsers();
            return View(list);
        }

        [HttpPost]
        public ActionResult CheckList(List<DemoUser> list)
        {
            
            foreach (var item in list)
            {
                //save things
            }
            return View(list);
        }

        [HttpGet]
        public ActionResult Upload()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Upload(HttpPostedFileBase dummy)
        {
            var nameList = new List<string>();
            if (Request.Files.Count > 0)
            {
                for (var i=0;i<Request.Files.Count;i++)
                {
                    HttpPostedFileBase file = Request.Files[i];
                    
                    if(file!=null)
                        nameList.Add($"{file.FileName}\tLength:{file.ContentLength}\tType:{file.ContentType}");
                }
            }

            ViewBag.NameList = nameList;
            return View();
        }
    }

}



public static class PivotClass
{
    /// <summary>
    /// 
    /// </summary>
    /// <typeparam name="T"></typeparam>
    /// <typeparam name="TColumn"></typeparam>
    /// <typeparam name="TRow"></typeparam>
    /// <typeparam name="TData"></typeparam>
    /// <param name="source"></param>
    /// <param name="columnSelector"></param>
    /// <param name="rowSelector">row group by</param>
    /// <param name="dataSelector"></param>
    /// <returns></returns>
    public static DataTable ToPivotTable<T, TColumn, TRow, TData>(this IEnumerable<T> source,
        Func<T, TColumn> columnSelector,
        Expression<Func<T, TRow>> rowSelector,
        Func<IEnumerable<T>, TData> dataSelector)
    {
        DataTable table = new DataTable();
        var rowName = ((MemberExpression)rowSelector.Body).Member.Name;
        table.Columns.Add(new DataColumn(rowName));
        var columns = source.Select(columnSelector).Distinct().OrderBy(x => x);

        foreach (var column in columns)
            table.Columns.Add(new DataColumn(column.ToString()));

        var rows = source.GroupBy(rowSelector.Compile())
            .Select(rowGroup => new
            {
                Key = rowGroup.Key,
                Values = columns.GroupJoin(
                    rowGroup,
                    c => c,
                    r => columnSelector(r),
                    (c, columnGroup) => dataSelector(columnGroup))
            });

        foreach (var row in rows)
        {
            var dataRow = table.NewRow();
            var items = row.Values.Cast<object>().ToList();
            items.Insert(0, row.Key);
            dataRow.ItemArray = items.ToArray();
            table.Rows.Add(dataRow);
        }

        return table;
    }
}