using Mukicik.Models;
using Mukicik.Repositories.ProductRepository;

namespace Mukicik.Factories
{
    public class ProductFactory
    {
        readonly static IProductRepository _productRepository = new ProductRepository();
        public static Product Create(string productName, int productPrice, string productImage, double productRating, int categoryId)
        {
            return new Product()
            {
                ProductId = _productRepository.GetNextValidId(),
                ProductName = productName,
                ProductPrice = productPrice,
                ProductImage = productImage,
                ProductRating = productRating,
                CategoryId = categoryId
            };
        }

        public static Product Create(int productId, string productName, int productPrice, string productImage, double productRating, int categoryId)
        {
            return new Product()
            {
                ProductId = productId,
                ProductName = productName,
                ProductPrice = productPrice,
                ProductImage = productImage,
                ProductRating = productRating,
                CategoryId = categoryId
            };
        }
    }
}