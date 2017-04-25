using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Altran.Data;
using Altran.Data.Entities;
using System.Linq.Expressions;
using Altran.Factory.Ifactory;
namespace Altran.Factory.flow
{
    public class FlowTblDatosFamiliares:IFactoryTblFamiliares
    {
        public List<TblFamiliar> GetTblDatosFamiliaresById(Expression<Func<TblFamiliar, bool>> predicado)
        {
            List<TblFamiliar> tblFamiliares = new List<TblFamiliar>();
            try
            {
                using (DCAltranDataContext contexto = new DCAltranDataContext())
                {
                    tblFamiliares = contexto.TblFamiliars.Where(predicado.Compile()).ToList<TblFamiliar>();
                }

            }
            catch (Exception ex)
            {
                string mensajeErr = ex.Message;
            }
            System.GC.Collect();
            return tblFamiliares;
        }
    }
}
