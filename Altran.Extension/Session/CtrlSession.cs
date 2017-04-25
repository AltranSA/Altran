using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.SessionState;

namespace Altran.Extension.Session
{
    public class CtrlSession
    {
        public void validaSession(System.Web.UI.Page _page)
        {
            HttpSessionState session = _page.Session;

            if (session == null)
            {
                _page.Response.Redirect("~/login.aspx", true);
                
            }
            else
            {
                if (session["manager"] == null)
                {
                    _page.Response.Redirect("~/login.aspx", true);
                   
                }
            }
        }
    }
}
