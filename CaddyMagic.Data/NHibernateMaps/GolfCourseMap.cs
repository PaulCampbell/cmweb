using FluentNHibernate.Automapping;
using CaddyMagic.Domain;
using FluentNHibernate.Automapping.Alterations;
using FluentNHibernate.Mapping;
using CaddyMagic.Data.Repository;

namespace CaddyMagic.Data.NHibernateMappings
{
    public class GolfCourseMap : ClassMap<GolfCourse>
{
  public GolfCourseMap()
  {
    Id(x => x.Id, "Id")
          .UnsavedValue(0)
          .GeneratedBy.Identity();
    Map(x => x.altitude, "Height");
    Map(x => x.approved, "Approved");
   Map(x => x.area, "Area");
   Map(x => x.created, "Created");
    Map(x => x.description, "Description");
    Map(x => x.latitude, "Latitude");
    Map(x => x.longitude, "Longitude");
    Map(x => x.name, "Name");
   Map(x => x.phoneID, "PhoneID");
    HasMany(x => x.holes).Inverse().Cascade.All();
    this.ImportType<CourseDTO>();
  }
   
        
        }
    }
