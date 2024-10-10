using Mukicik.Models;
using Mukicik.Repositories.ProductRepository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;

namespace Mukicik.Views.Pages
{
    public partial class Home : System.Web.UI.Page
    {
        public List<Product> TopSixProducts { get; set; }

        readonly IProductRepository _productRepository = new ProductRepository();
        protected void Page_Load(object sender, EventArgs e)
        {
            TopSixProducts = _productRepository.GetTopProducts(6).ToList();
        }
    }
}