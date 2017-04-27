using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Linq.Expressions;
using Altran.Data.Entities;

namespace Altran.Factory.factoria
{
    public static class FactoryExpresionCatEmpresa
    {
        public static Expression<Func<CatEmpresa, bool>> GetCatEmpresaById(int id)
        {
            Expression<Func<CatEmpresa, bool>> predicado = p => p.id == id;
            return predicado;

        }
    }
}
