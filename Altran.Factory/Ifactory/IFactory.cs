using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


using Altran.Data;

namespace Altran.Factory.Ifactory
{
    public interface IFactory<T>where T : class,IBaseTable
    {
        bool Insert(T entidad);
        bool Delete(T entidad);
        bool upadte(T entidad);
        List<T> GetListData();
       
    }
}
