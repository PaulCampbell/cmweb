using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SharpArch.Core.DomainModel;
using System.Runtime.Serialization;

namespace CaddyMagic.Domain
{
 
    public class Hole 
    {
       
        public virtual int Id { get; set; }
        
      
        public virtual int holeNumber { get; set; }
       
        public virtual int strokeIndex { get; set; }
       
        public virtual int par { get; set; }
        public virtual GolfCourse GolfCourse { get; set; }
        public virtual IList<Feature> features { get; set; }
        public Hole()
        {
            GolfCourse = new GolfCourse();
            features = new List<Feature>();
            Id = 0;
        }

    }
}
