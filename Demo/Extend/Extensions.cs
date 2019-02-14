using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;

namespace Demo.Extend
{
    public static class Extensions
    {
        public static IHtmlString CheckBoxList(this HtmlHelper helper, string name, IEnumerable<SelectListItem> items)
        {
            var output = new StringBuilder();
            foreach (var item in items.ToList())
            {
                output.AppendFormat("<label class='form-check-inline'>");
                output.AppendFormat($"<input name='{name}' value='{item.Value}' {(item.Selected ? "Checked" : "")}  type='checkbox' class='form-check-input'>");
                output.AppendFormat($"{item.Text}</label>");
            }
            return new HtmlString(output.ToString());
        }
    }
}