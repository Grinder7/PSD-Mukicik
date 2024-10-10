using Mukicik.Factories;
using Mukicik.Models;
using Mukicik.Repositories.CategoryRepository;
using Mukicik.Repositories.ProductRepository;
using System;
using System.Web.UI;

namespace Mukicik.Views.Pages.Admin
{
    public partial class Insert : System.Web.UI.Page
    {
        private readonly IProductRepository _productRepository = new ProductRepository();
        private readonly CategoryRepository _categoryRepository = new CategoryRepository();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Session["user"] == null)
                {
                    Response.Redirect("~/Views/Pages/Auth/Login.aspx");
                }
                ProductCategoryDropDownList.DataSource = _categoryRepository.GetAllCategories();
                ProductCategoryDropDownList.DataTextField = "CategoryName";
                ProductCategoryDropDownList.DataValueField = "CategoryId";
                ProductCategoryDropDownList.DataBind();
            }
        }

        protected void InsertButton_Click(object sender, EventArgs e)
        {
            try
            {
                ValidateInput();
                Product product = ProductFactory.Create(ProductNameInput.Text, int.Parse(ProductPriceInput.Text), ProductImageInput.Text, Double.Parse(ProductRatingInput.Text), int.Parse(ProductCategoryDropDownList.SelectedItem.Value));
                _productRepository.InsertProduct(product);
                _productRepository.SaveChanges();
                ClearInput();
                MessagePlaceHolder.Controls.Add(new LiteralControl("<div class='alert alert-success row' role='alert'>Data inserted</div>"));

            }
            catch (Exception ex)
            {
                MessagePlaceHolder.Controls.Add(new LiteralControl($"<div class='alert alert-danger row' role='alert'>{ex.Message}</div>"));
            }

        }

        private void ClearInput()
        {
            ProductNameInput.Text = "";
            ProductPriceInput.Text = "";
            ProductImageInput.Text = "";
            ProductRatingInput.Text = "";
        }

        private void ValidateInput()
        {
            if (ProductNameInput.Text == "" || ProductPriceInput.Text == "" || ProductImageInput.Text == "" || ProductRatingInput.Text == "")
            {
                throw new Exception("Field must be filled");
            }

            if (!(int.TryParse(ProductPriceInput.Text, out _) && Double.TryParse(ProductRatingInput.Text, out _)))
            {
                throw new Exception("Price or Rating must be a number");
            }
        }
    }
}