using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Altran.Data.Entities;
using System.Linq.Expressions;
namespace Altran.Factory.factoria
{
    public static class FactoryExpresionCatColonia
    {
        public static Expression<Func<CatColonia, bool>> GetCatMunicipio(string nombre)
        {
            Expression<Func<CatColonia, bool>> predicado = p => p.strValor == nombre;
            return predicado;
        }
        public static Expression<Func<CatColonia, bool>> GetCatColoniaByIdMunicipio(int id)
        {
            Expression<Func<CatColonia, bool>> predicado = p => p.idMunicipio == id;
            return predicado;
        }

       

    }
}
