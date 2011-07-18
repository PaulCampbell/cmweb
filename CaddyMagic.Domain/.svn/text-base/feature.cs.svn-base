using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SharpArch.Core.DomainModel;

namespace CaddyMagic.Domain
{
    public class Feature 
    {
        public virtual int Id { get; set; }
        public virtual FeatureType featuretype { get; set; }
        public virtual Hole hole { get; set; }
        public virtual decimal longitude { get; set; }
        public virtual decimal latitude { get; set; }
        public virtual decimal height { get; set; }
        public virtual int featuretypeID { get; set; }
        public Feature()
        {
           
            featuretype = new FeatureType();
        }
    }
}
