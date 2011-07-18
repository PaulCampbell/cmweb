using FluentNHibernate.Automapping;
using CaddyMagic.Domain;
using FluentNHibernate.Automapping.Alterations;
using FluentNHibernate.Mapping;

namespace CaddyMagic.Data.NHibernateMappings
{
    public class HoleMap : ClassMap<Hole>
{
        public HoleMap()
  {
    Id(x => x.Id, "Id")
          .UnsavedValue(0)
          .GeneratedBy.Identity();
    Map(x => x.holeNumber, "holeNumber");
    Map(x => x.par, "par");
    Map(x => x.strokeIndex, "strokeIndex");
    HasMany(x => x.features).Inverse().Cascade.All();
    References<GolfCourse>(x => x.GolfCourse);
  }
   
        
        }
    }
