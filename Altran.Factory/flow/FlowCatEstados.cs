using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Altran.Data.Entities;
using System.Linq.Expressions;
using System.Data.Linq;
using Altran.Data;

namespace Altran.Factory.flow
{
    public class FlowCatEstados
    {
        public List<CatEstado> GetCatEstados(Expression<Func<CatEstado, bool>> predicado)
        {
            List<CatEstado> paises = new List<CatEstado>();
            try
            {
                using (DCAltranDataContext contexto = new DCAltranDataContext())
                {
                    paises = contexto.CatEstados.Where(predicado.Compile()).ToList<CatEstado>();
                }
            }
            catch (Exception ex)
            {
                string mensajeErr = ex.Message;
            }
            System.GC.Collect();
            return paises;
        }

    }
}
