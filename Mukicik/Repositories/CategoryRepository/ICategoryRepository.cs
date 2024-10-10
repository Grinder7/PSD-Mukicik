using Mukicik.Models;
using System.Collections.Generic;

namespace Mukicik.Repositories.CategoryRepository
{
    internal interface ICategoryRepository
    {
        List<Category> GetAllCategories();

        Category GetCategoryByName(string categoryName);
    }
}
