//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Ado_net_exam_delivery
{
    using System;
    using System.Collections.Generic;
    
    public partial class OrderStatus
    {
        public int Id { get; set; }
        public string Status { get; set; }
    
        public virtual Order Order { get; set; }
    }
}