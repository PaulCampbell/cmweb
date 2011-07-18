using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SharpArch.Core.DomainModel;

namespace CaddyMagic.Domain
{
   
    public class GolfCourse 
	{
     

        public virtual int Id { get; set; }
        public virtual Guid UId { get; set; }
        public virtual string name { get; set; }
        public virtual decimal longitude { get; set; }
        public virtual decimal latitude { get; set; }
        public virtual decimal altitude { get; set; }
        public virtual string description { get; set; }
        public virtual string area { get; set; }
        public virtual DateTime created { get; set; }
        public virtual IList<Hole> holes { get; set; }
        public virtual string phoneID { get; set; }

        public virtual Boolean approved { get; set; }

        public GolfCourse()
        {
            
            holes = new List<Hole>();
            created = DateTime.Now;
            UId = new Guid();
            approved = false;
           
         
        }

        public virtual void AddHole(Hole hole)
        {
            if (holes.Count <= 18)
            {
                hole.GolfCourse = this;
                if (hole.holeNumber == 0)
                {
                    hole.holeNumber = holes.Count + 1;
                }
                this.holes.Add(hole);
            }
            
        }
    
    }
}
