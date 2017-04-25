using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Altran.Factory.Ifactory;
using Altran.Data;
using System.Data.Linq;
///cargamos las transacciones
using System.Activities.Statements;



namespace Altran.Factory.factoria
{
    public class Factory<T>: IFactory<T> where T : class,IBaseTable
    {
        
        /// <summary>
        /// Este metodo se encarga de insertar en la tabla que sea
        /// </summary>
        /// <param name="entidad">cualquier entidad</param>
        /// <returns>respuesta boolean</returns>
        public bool Insert(T entidad)
        {
            bool respuesta = false;
            try
            {
                using (DCAltranDataContext contexto = new DCAltranDataContext())
                {
                    
                    contexto.GetTable<T>().InsertOnSubmit(entidad);
                    contexto.SubmitChanges();
                    respuesta = true;
                }
                System.GC.Collect();
                
            }
            catch (Exception ex)
            {
                string mensajeErr = ex.Message;
                
            }
            return respuesta;
        }

        public bool Delete(T entidad)
        {
            bool respuesta = false;
            try
            {
                using (DCAltranDataContext contexto = new DCAltranDataContext())
                {
                    T entity = contexto.GetTable<T>().Where(c => c.id == entidad.id).FirstOrDefault<T>();
                    contexto.GetTable<T>().DeleteOnSubmit(entity);
                    contexto.SubmitChanges();
                    respuesta = true;
                }
            }
            catch (Exception ex)
            {
                string mensajeErr = ex.Message;

            }
            System.GC.Collect();
            return respuesta;
        }

        public bool upadte(T entidad)
        {
            bool respuesta = false;
            try
            {
                using (DCAltranDataContext contexto = new DCAltranDataContext())
                {
                    T entity = contexto.GetTable<T>().Where(c => c.id == entidad.id).FirstOrDefault<T>();
                    entity = entidad;
                    contexto.SubmitChanges();
                    contexto.Refresh(RefreshMode.KeepCurrentValues);
                    respuesta = true;
                }
            }
            catch (Exception ex)
            {

                string mensajeErr = ex.Message;

            }
            System.GC.Collect();
            return respuesta;
        }
        public List<T> GetListData()
        {
            List<T> lista = new List<T>();
            try
            {
                using (DCAltranDataContext contexto = new DCAltranDataContext())
                {
                    lista = contexto.GetTable<T>().ToList<T>();
                    
                }
            }
            catch (Exception ex)
            {
                string mensajeErr = ex.Message;
            }
            System.GC.Collect();
            return lista;

        }

        
    }
}
