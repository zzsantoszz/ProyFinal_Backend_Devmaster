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
    
    public partial class tb_usuario
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tb_usuario()
        {
            this.tb_cliente = new HashSet<tb_cliente>();
            this.tb_responsable = new HashSet<tb_responsable>();
        }
    
        public int idUsuario { get; set; }
        public string cod_usuario { get; set; }
        public string user_acceso { get; set; }
        public byte[] user_pass { get; set; }
        public int idTipo_usuario { get; set; }
        public Nullable<bool> estado_usuario { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tb_cliente> tb_cliente { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tb_responsable> tb_responsable { get; set; }
        public virtual tb_tipo_usuario tb_tipo_usuario { get; set; }
    }
}
