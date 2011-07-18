using FluentNHibernate.Automapping;
using CaddyMagic.Domain;
using FluentNHibernate.Automapping.Alterations;
using FluentNHibernate.Mapping;

namespace CaddyMagic.Data.NHibernateMappings
{
    public class FeatureMap : ClassMap<Feature>
{
        public FeatureMap()
  {
    Id(x => x.Id, "Id")
          .UnsavedValue(0)
          .GeneratedBy.Identity();
    Map(x => x.height, "Height");
    Map(x => x.latitude, "Latitude");
    Map(x => x.longitude, "Longitude");
    References<Hole>(x => x.hole);
    References<FeatureType>(x => x.featuretype);
  }
   
        
        }
    }
