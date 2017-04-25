using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Linq.Expressions;
using Altran.Factory.factoria;
using Altran.Data.Entities;
using Altran.Data;
namespace Altran.Factory.flow
{
    public class FlowCatColonia
    {
        public List<CatColonia> GetCatColonias(Expression<Func<CatColonia, bool>> predicado)
        {
            List<CatColonia> colonias = new List<CatColonia>();
            try
            {
                using (DCAltranDataContext contexto = new DCAltranDataContext())
                {
                    colonias = contexto.CatColonias.Where(predicado.Compile()).ToList<CatColonia>();
                }
            }
            catch (Exception ex)
            {
                string mensajeErr = ex.Message;
            }
            System.GC.Collect();
            return colonias;
        }


        public CatColonia GetCatColoniaByNombreColonia(string nombre)
        {
            CatColonia colonia = new CatColonia();
            try
            {
                using (DCAltranDataContext contexto = new DCAltranDataContext())
                {
                    colonia = contexto.CatColonias.Where(p => p.strValor == nombre).FirstOrDefault<CatColonia>();
                }
            }
            catch (Exception ex)
            {
                string mensajeErr = ex.Message;
            }
            System.GC.Collect();
            return colonia;
        }


        public CatColonia GetCatColoniaById(int id)
        {
            CatColonia colonia = new CatColonia();
            try
            {
                using (DCAltranDataContext contexto = new DCAltranDataContext())
                {
                    colonia = contexto.CatColonias.Where(p => p.id == id).FirstOrDefault<CatColonia>();
                }
            }
            catch (Exception ex)
            {
                string mensajeErr = ex.Message;
            }
            System.GC.Collect();
            return colonia;
        }


    }
}
