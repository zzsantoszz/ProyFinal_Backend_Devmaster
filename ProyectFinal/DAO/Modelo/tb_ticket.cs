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
    
    public partial class tb_ticket
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tb_ticket()
        {
            this.tb_responsable_ticket = new HashSet<tb_responsable_ticket>();
        }
    
        public int idTicket { get; set; }
        public string codticket { get; set; }
        public string detalle_ticket { get; set; }
        public int idCliente { get; set; }
        public int idEstado_ticket { get; set; }
        public int idModo_ticket { get; set; }
        public int idNivel_ticket { get; set; }
        public int idPrioridad_ticket { get; set; }
        public int idCategoria_ticket { get; set; }
        public int idAsunto_ticket { get; set; }
    
        public virtual tb_asunto_ticket tb_asunto_ticket { get; set; }
        public virtual tb_categoria_ticket tb_categoria_ticket { get; set; }
        public virtual tb_cliente tb_cliente { get; set; }
        public virtual tb_estado_ticket tb_estado_ticket { get; set; }
        public virtual tb_modo_ticket tb_modo_ticket { get; set; }
        public virtual tb_nivel_ticket tb_nivel_ticket { get; set; }
        public virtual tb_prioridad_ticket tb_prioridad_ticket { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tb_responsable_ticket> tb_responsable_ticket { get; set; }
    }
}