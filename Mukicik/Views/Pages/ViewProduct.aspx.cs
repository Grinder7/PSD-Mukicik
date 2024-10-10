using Mukicik.Models;
using Mukicik.Repositories.ProductRepository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;

namespace Mukicik.Views.Pages
{
    public partial class ViewProduct : System.Web.UI.Page
    {
        public List<Product> Products { get; set; }

        readonly IProductRepository _productRepository = new ProductRepository();
        protected void Page_Load(object sender, EventArgs e)
        {
            Products = _productRepository.GetAllProducts().ToList();
        }
    }
}