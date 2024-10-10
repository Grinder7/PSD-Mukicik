using Mukicik.Models;
using System.Collections.Generic;
using System.Linq;

namespace Mukicik.Repositories.CategoryRepository
{
    public class CategoryRepository : ICategoryRepository
    {
        private readonly DatabaseEntities _databaseEntities = DatabaseSingleton.GetInstance();
        public List<Category> GetAllCategories()
        {
            return _databaseEntities.Categories.ToList();
        }

        public Category GetCategoryByName(string categoryName) {
            return _databaseEntities.Categories.Where(x => x.CategoryName == categoryName).FirstOrDefault();
        }

    }
}