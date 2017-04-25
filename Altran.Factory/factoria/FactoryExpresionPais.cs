using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Linq.Expressions;
using Altran.Data.Entities;

namespace Altran.Factory.factoria
{
    public static class FactoryExpresionPais
    {

        //este metodo se encarga de buscar un pais por nombre
        public static Expression<Func<CatPai, bool>> GetCatPaisByNombre(string nombre)
        {
            Expression<Func<CatPai, bool>> predicado = p => p.strValor == nombre;
            return predicado;
        } 
    }
}
