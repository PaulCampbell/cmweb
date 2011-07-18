using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SharpArch.Data.NHibernate;
using CaddyMagic.Domain;
using NHibernate;
using NHibernate.Criterion;

namespace CaddyMagic.Data.Repository
{
    public class GolfCourseRepository : Repository<GolfCourse>
    {
        public int CourseCount()
        {

            IQuery query = Session.CreateQuery("select count(*) as n from GolfCourse golfCourse where approved = true");
            int result = int.Parse(query.List()[0].ToString());

            return result;

        }

        public List<CourseDTO> FindCourse(string searchterm)
        {


            IQuery query = Session.CreateQuery("select new CourseDTO (gc.Id, gc.name, gc.latitude, gc.longitude, gc.area) from GolfCourse gc where (name like :searchterm or area like :searchterm) and Approved = true order by gc.Id desc").SetMaxResults(10);
            query.SetParameter("searchterm", "%" + searchterm + "%");

           

            return query.List<CourseDTO>().ToList();
        
        }

        public List<GolfCourse> AllCourses(int page, int resultsPerPage)
        {

            int firstResult= (page - 1) * resultsPerPage;


            ICriteria criteria = Session.CreateCriteria(typeof(GolfCourse));
            criteria.Add(Expression.Eq("approved", true));
            criteria.AddOrder(new Order("Id", false));
            criteria.SetFirstResult(firstResult).SetMaxResults( resultsPerPage);
           
            return criteria.List<GolfCourse>().ToList();

        }

    }

    public class CourseDTO
    {
        public int Id { get; set; }
        public string name { get; set; }
        public Decimal latitude { get; set; }
        public Decimal longitude { get; set; }
        public string area { get; set; }


        public CourseDTO(int id, string Name, Decimal Latitude, Decimal Longitude, String Area)
        {
            Id = id; name = Name; latitude = Latitude; longitude = Longitude; area = Area;
        }
    }
  
}
