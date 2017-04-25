using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
//cargamos librerias necesarias para el acceso a datos
using System.Data.Linq;
using Altran.Data;
using Altran.Data.Entities;
//cargamos la factoria generica
using Altran.Factory.Ifactory;

namespace Altran.Factory.flow
{
    public class FlowCatTipoVehiculo:IFactory<CatTipoVehiculo>
    {
       /// <summary>
       /// Este metodo se encarga de insertar el objeto de  la vista
       /// </summary>
       /// <param name="tipoVehiculo">tipo de objeto a insertar</param>
       /// <returns>regresa una respuesta booleana si se inserta es true si no es false</returns>
        public bool Insert(CatTipoVehiculo tipoVehiculo)
        {
            bool respuesta = false;
            try
            {
                using (DCAltranDataContext contexto = new DCAltranDataContext())
                {
                    contexto.CatTipoVehiculos.InsertOnSubmit(tipoVehiculo);
                    contexto.SubmitChanges();
                    contexto.Refresh(RefreshMode.KeepChanges);
                    respuesta = true;
                }
            }
            catch (Exception ex)
            {
                string mensajeErr = ex.Message;              
            }
            return respuesta;
        }

        public bool upadte(CatTipoVehiculo entidad)
        {
            bool respuesta = false;
            try
            {
                using (DCAltranDataContext contexto = new DCAltranDataContext())
                {
                    CatTipoVehiculo tipoVehiculoOld= contexto.CatTipoVehiculos.Where(p => p.id == entidad.id).First<CatTipoVehiculo>();
                    tipoVehiculoOld = entidad;
                    contexto.CatTipoVehiculos.Attach(tipoVehiculoOld, true);
                    contexto.SubmitChanges();
                    contexto.Refresh(RefreshMode.KeepChanges);
                    respuesta = true;
                }
            }
            catch (Exception ex)
            {
                string mensajeErr = ex.Message;
            }
            return respuesta;
        }

        public bool Delete(CatTipoVehiculo entidad)
        {
            bool respuesta = false;
            try
            {
                using (DCAltranDataContext contexto = new DCAltranDataContext())
                {
                   CatTipoVehiculo  catTipoVehiculo= contexto.CatTipoVehiculos.Where(p => p.id == entidad.id).First<CatTipoVehiculo>();
                    contexto.CatTipoVehiculos.DeleteOnSubmit(catTipoVehiculo);
                    contexto.SubmitChanges();
                    contexto.Refresh(RefreshMode.KeepChanges);
                    respuesta = true;
                }

            }
            catch (Exception ex)
            {
                string mensajeErr = ex.Message;
            }
            return respuesta;
        }

        public List<CatTipoVehiculo> GetListData()
        {

            using (DCAltranDataContext contexto = new DCAltranDataContext())
            {
                return contexto.CatTipoVehiculos.ToList<CatTipoVehiculo>();
            }

        }

        public CatTipoVehiculo GetEntity(int id)
        {
            CatTipoVehiculo tipoVehiculo = null;
            try
            {
                using (DCAltranDataContext contexto = new DCAltranDataContext())
                {
                    tipoVehiculo = contexto.CatTipoVehiculos.Where(p => p.id == id).First<CatTipoVehiculo>();
                }
            }
            catch (Exception ex)
            {
                string mensajeErr = ex.Message;
            }
            return tipoVehiculo;
        }
    }

}
