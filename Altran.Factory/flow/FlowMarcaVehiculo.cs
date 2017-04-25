using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Altran.Factory.Ifactory;
using Altran.Data.Entities;
using Altran.Data;
using System.Data.Linq;
namespace Altran.Factory.flow
{
    public class FlowMarcaVehiculo:IFactory<CatMarcaVehiculo>
    {
        public bool Insert(CatMarcaVehiculo entidad)
        {
            bool respuesta = false;
            try
            {
                using (DCAltranDataContext contexto = new DCAltranDataContext())
                {
                    contexto.CatMarcaVehiculos.InsertOnSubmit(entidad);
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

        public bool upadte(CatMarcaVehiculo entidad)
        {
            bool respuesta = false;
            try
            {
                using (DCAltranDataContext contexto = new DCAltranDataContext())
                {
                    CatMarcaVehiculo tipoVehiculoOld = contexto.CatMarcaVehiculos.Where(p => p.id == entidad.id).First<CatMarcaVehiculo>();
                    tipoVehiculoOld = entidad;
                    contexto.CatMarcaVehiculos.Attach(tipoVehiculoOld, true);
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

        public bool Delete(CatMarcaVehiculo entidad)
        {
            bool respuesta = false;
            try
            {
                using (DCAltranDataContext contexto = new DCAltranDataContext())
                {
                    CatMarcaVehiculo catTipoVehiculo = contexto.CatMarcaVehiculos.Where(p => p.id == entidad.id).First<CatMarcaVehiculo>();
                    contexto.CatMarcaVehiculos.DeleteOnSubmit(catTipoVehiculo);
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

        public List<CatMarcaVehiculo> GetListData()
        {

            using (DCAltranDataContext contexto = new DCAltranDataContext())
            {
                return contexto.CatMarcaVehiculos.ToList<CatMarcaVehiculo>();
            }

        }

        public CatMarcaVehiculo GetEntity(int id)
        {
            CatMarcaVehiculo tipoVehiculo = null;
            try
            {
                using (DCAltranDataContext contexto = new DCAltranDataContext())
                {
                    tipoVehiculo = contexto.CatMarcaVehiculos.Where(p => p.id == id).First<CatMarcaVehiculo>();
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
