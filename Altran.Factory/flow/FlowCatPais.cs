using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Altran.Data;
using Altran.Factory.factoria;
using Altran.Data.Entities;
using System.Linq.Expressions;
namespace Altran.Factory.flow
{
    public class FlowCatPais
    {
        /// <summary>
        /// este metodo se encarga de consultar un pais por el nombre
        /// </summary>
        /// <param name="predicado">es la condición por la cual buscara el metodo</param>
        /// <returns>un objeto del tipo</returns>
        public CatPai GetCatPais(Expression<Func<CatPai, bool>> predicado)
        {
            CatPai catPais = null;
            try
            {
                using (DCAltranDataContext contexto = new DCAltranDataContext())
                {
                    catPais = contexto.CatPais.Where(predicado.Compile()).FirstOrDefault<CatPai>();
                }
                 
            }
            catch (Exception ex)
            {
                string mensajeErr = ex.Message;
            }
            System.GC.Collect();
            return catPais;
        }

        public CatPai GetCatPais(string nombre)
        {
            CatPai catPais = null;
            try
            {
                using (DCAltranDataContext contexto = new DCAltranDataContext())
                {
                    catPais = contexto.CatPais.Where(p=> p.strValor== nombre).FirstOrDefault<CatPai>();
                    
                }

            }
            catch (Exception ex)
            {
                string mensajeErr = ex.Message;
            }
            System.GC.Collect();
            return catPais;
        }
     


    }
}
