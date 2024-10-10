using Mukicik.Models;
using System.Collections.Generic;
using System.Linq;

namespace Mukicik.Repositories.ProductRepository
{
    public class ProductRepository : IProductRepository
    {
        private readonly DatabaseEntities _databaseEntities = DatabaseSingleton.GetInstance();

        public IEnumerable<Product> GetAllProducts()
        {
            return _databaseEntities.Products;
        }

        public IEnumerable<Product> GetTopProducts(int count)
        {
            return _databaseEntities.Products.OrderByDescending(p => p.ProductRating).Take(count);
        }

        public Product GetProductById(int productId)
        {
            return _databaseEntities.Products.Find(productId);
        }

        public void InsertProduct(Product product)
        {
            _databaseEntities.Products.Add(product);
        }

        public void UpdateProduct(Product product)
        {
            Product oldProduct = GetProductById(product.ProductId);
            _databaseEntities.Entry(oldProduct).CurrentValues.SetValues(product);
            //_databaseEntities.Database.ExecuteSqlCommand("UPDATE Products SET ProductName = {0}, ProductPrice = {1}, ProductImage = {2}, ProductRating = {3} WHERE ProductId = {4}", product.ProductName, product.ProductPrice, product.ProductImage, product.ProductRating, product.ProductId);
        }
        public void DeleteProduct(int productId)
        {
            Product product = GetProductById(productId);
            _databaseEntities.Products.Remove(product);
        }

        public void SaveChanges()
        {
            _databaseEntities.SaveChanges();
        }

        public int GetNextValidId()
        {
            if (_databaseEntities.Products.Count() == 0)
            {
                return 1;
            }
            else
            {
                return _databaseEntities.Products.Max(p => p.ProductId) + 1;
            }
        }
    }
}