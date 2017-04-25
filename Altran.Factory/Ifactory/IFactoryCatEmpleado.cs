using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Altran.Data;
using Altran.Data.Entities;
using System.Linq.Expressions;

namespace Altran.Factory.Ifactory
{
    public  interface IFactoryCatEmpleado
    {
        CatEmpleado GetCatEmpleado(int id);
        CatEmpleado GetCatEmpleadoNombre(string nombre);
        CatEmpleado GetCatEmpleadoByExpresionEntity(Expression<Func<CatEmpleado, bool>> predicado);
    }
}
