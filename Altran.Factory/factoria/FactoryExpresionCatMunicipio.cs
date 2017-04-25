using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Altran.Data.Entities;
using System.Linq.Expressions;

namespace Altran.Factory.factoria
{
    public static class FactoryExpresionCatMunicipio
    {
        public static Expression<Func<CatMunicipio, bool>> GetCatEstado(string nombre)
        {
            Expression<Func<CatMunicipio, bool>> predicado = p => p.strValor == nombre;
            return predicado;
        }
        public static Expression<Func<CatMunicipio, bool>> GetCatEstadosByIdEstado(int id)
        {
            Expression<Func<CatMunicipio, bool>> predicado = p => p.CatEstado.id == id;
            return predicado;
        }
    }
}
