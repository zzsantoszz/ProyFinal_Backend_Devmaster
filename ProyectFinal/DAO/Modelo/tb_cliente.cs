//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DAO.Modelo
{
    using System;
    using System.Collections.Generic;
    
    public partial class tb_cliente
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tb_cliente()
        {
            this.tb_ticket = new HashSet<tb_ticket>();
        }
    
        public int idCliente { get; set; }
        public string cod_cliente { get; set; }
        public string nombre_cliente { get; set; }
        public string apellido_paterno_cliente { get; set; }
        public string apellido_materno_cliente { get; set; }
        public string correo_cliente { get; set; }
        public string cargo_cliente { get; set; }
        public int idUsuario { get; set; }
        public bool estado_cliente { get; set; }
    
        public virtual tb_usuario tb_usuario { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tb_ticket> tb_ticket { get; set; }
    }
}
