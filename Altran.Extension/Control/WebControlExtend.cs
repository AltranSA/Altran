using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI.WebControls;
using Altran.Data;
using System.Data.Linq;
using System.Linq.Expressions;

namespace Altran.Extension.Control
{
    public static class WebControlExtend
    {
        

        public static void GetData<T>(this DropDownList _control, List<T> lista) where T :class
        {
            _control.Items.Add("Seleccionar");
            _control.DataValueField = "id";
            _control.DataTextField = "strValor";
            _control.DataSource = lista;
            _control.DataBind();
            
        }

     


        public static void GetData<T>(this DropDownList _control) where T : class
        {
            DCAltranDataContext contexto = new DCAltranDataContext();
            _control.AppendDataBoundItems = true;
            _control.Items.Add("Seleccionar");
            _control.DataValueField = "id";
            _control.DataTextField = "strValor";
            _control.DataSource = contexto.GetTable<T>().ToList<T>();
            _control.DataBind();
            System.GC.Collect();
        }

        public static void GetData<T>(this GridView _control) where T : class
        {
            DCAltranDataContext contexto = new DCAltranDataContext();
            
            _control.DataSource = contexto.GetTable<T>().ToList<T>();
            _control.DataBind();
            System.GC.Collect();
        }
        public static void GetData<T>(this GridView _control,List<T> lista) where T : class
        {
            _control.DataSource = lista;
            _control.DataBind();
            System.GC.Collect();
        }

        public static void GetData<T>(this GridView _control, int id) where T : class, IBaseTable
        {
            DCAltranDataContext contexto = new DCAltranDataContext();
            _control.DataSource = contexto.GetTable<T>().Where(p => p.id == id).ToList<T>();
            _control.DataBind();
            System.GC.Collect();
        }

        public static decimal ConvertDecimal(this TextBox _control)
        {
            return Convert.ToDecimal(_control.Text.Trim());
        }

        public static Int64 ConvertInt64(this TextBox _control)
        {
            return Int64.Parse(_control.Text.ToString().Trim());
        }
        public static int ConvertInt(this TextBox _control)
        {
            return int.Parse(_control.Text.ToString().Trim());
        }
        public static double ConvertDouble(this TextBox _control)
        {
            return double.Parse(_control.Text.ToString().Trim());
        }

        public static DateTime ConvertDate(this TextBox _control)
        {
            return DateTime.Parse(_control.Text.Trim());
        }

    }
}
