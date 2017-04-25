using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Altran.Data.Entities;
using Altran.Factory.factoria;
using System.Linq.Expressions;
using Altran.Data;
namespace Altran.Factory.flow
{
    public class FlowCatMunicipio
    {
        public List<CatMunicipio> GetCatMunicipios(Expression<Func<CatMunicipio, bool>> predicado)
        {
            List<CatMunicipio> municipios = new List<CatMunicipio>();
            try
            {
                using (DCAltranDataContext contexto = new DCAltranDataContext())
                {
                    municipios = contexto.CatMunicipios.Where(predicado.Compile()).ToList<CatMunicipio>();
                }
            }
            catch (Exception ex)
            {
                string mensajeErr = ex.Message;
            }
            System.GC.Collect();
            return municipios;
        }
    }
}
