using FluentNHibernate.Automapping;
using CaddyMagic.Domain;
using FluentNHibernate.Automapping.Alterations;
using FluentNHibernate.Mapping;

namespace CaddyMagic.Data.NHibernateMappings
{
    public class FeatureMapType : ClassMap<FeatureType>
{
        public FeatureMapType()
  {
    Id(x => x.Id, "Id")
          .UnsavedValue(0)
          .GeneratedBy.Identity();
    Map(x => x.Name, "Name");
   
  }
   
        
        }
    }
