using Mukicik.Models;
using System.Collections.Generic;

namespace Mukicik.Repositories.ProductRepository
{
    internal interface IProductRepository
    {
        IEnumerable<Product> GetAllProducts();
        IEnumerable<Product> GetTopProducts(int count);
        Product GetProductById(int productId);
        void InsertProduct(Product product);
        void UpdateProduct(Product product);
        void DeleteProduct(int productId);
        void SaveChanges();
        int GetNextValidId();
    }
}
