using FluentNHibernate.Conventions;
using FluentNHibernate.Mapping;

namespace CaddyMagic.Data.NHibernateMaps.Conventions
{
    public class PrimaryKeyConvention : IIdConvention
    {
        public void Apply(FluentNHibernate.Conventions.Instances.IIdentityInstance instance)
        {
            instance.Column("Id");
            instance.UnsavedValue("0");
            instance.GeneratedBy.Native();
        }
    }
}
