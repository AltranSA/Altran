using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Linq.Expressions;
using Altran.Data.Entities;

namespace Altran.Factory.factoria
{
    public static class FactoryExpresionCatEstado
    {
        public static Expression<Func<CatEstado, bool>> GetCatEstado(string nombre)
        {
            Expression<Func<CatEstado,bool>> predicado = p => p.strValor == nombre;
            return predicado;
        }

        public static Expression<Func<CatEstado, bool>> GetCatEstadosByPais(string nombre)
        {
            Expression<Func<CatEstado, bool>> predicado = p => p.CatPai.strValor == nombre;
            return predicado;
        }
        public static Expression<Func<CatEstado, bool>> GetCatEstadosByIdPais(int id)
        {
            Expression<Func<CatEstado, bool>> predicado = p => p.CatPai.id == id;
            return predicado;
        }




    }
}
