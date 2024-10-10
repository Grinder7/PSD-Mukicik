using Mukicik.Factories;
using Mukicik.Models;
using Mukicik.Repositories.CategoryRepository;
using Mukicik.Repositories.ProductRepository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mukicik.Views.Pages.Admin
{
    public partial class Modify : System.Web.UI.Page
    {
        // todo change gridview select and delete to commandfiled
        readonly IProductRepository _productRepository = new ProductRepository();
        readonly ICategoryRepository _categoryRepository = new CategoryRepository();
        public List<Product> Products { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            Products = _productRepository.GetAllProducts().ToList();

            ProductGridView.DataSource = Products;
            ProductGridView.DataBind();
            if (!Page.IsPostBack)
            {
                ProductCategoryDropDownList.DataSource = _categoryRepository.GetAllCategories().ToArray();
                ProductCategoryDropDownList.DataTextField = "CategoryName";
                ProductCategoryDropDownList.DataValueField = "CategoryId";
                ProductCategoryDropDownList.DataBind();
            }
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

        private void RerenderGridView()
        {
            ProductGridView.DataSource = _productRepository.GetAllProducts().ToList();
            ProductGridView.DataBind();
        }

        protected void UpdateButton_Click(object sender, EventArgs e)
        {
            try
            {
                ValidateInput();
                Product product = ProductFactory.Create(int.Parse(ProductIdInput.Text), ProductNameInput.Text, int.Parse(ProductPriceInput.Text), ProductImageInput.Text, Double.Parse(ProductRatingInput.Text), int.Parse(ProductCategoryDropDownList.SelectedItem.Value));
                _productRepository.UpdateProduct(product);
                _productRepository.SaveChanges();
                RerenderGridView();
            }
            catch (Exception ex)
            {
                MessagePlaceHolder.Controls.Add(new LiteralControl($"<div class='alert alert-danger row' role='alert'>{ex.Message}</div>"));
            }
        }

        /*        protected void ProductGridView_RowCommand(object sender, GridViewCommandEventArgs e)
                {
                    GridViewRow row = ProductGridView.Rows[Convert.ToInt32(e.CommandArgument)];
                    ProductIdInput.Text = row.Cells[1].Text;
                    ProductNameInput.Text = row.Cells[2].Text;
                    ProductPriceInput.Text = row.Cells[3].Text;
                    ProductImageInput.Text = row.Cells[4].Text;
                    ProductRatingInput.Text = row.Cells[5].Text;
                    ProductCategoryDropDownList.SelectedValue = row.Cells[6].Text;
                }*/

        protected void ProductGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int productId = int.Parse(ProductGridView.Rows[e.RowIndex].Cells[1].Text);
            _productRepository.DeleteProduct(productId);
            _productRepository.SaveChanges();
            RerenderGridView();
        }

        protected void ProductGridView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewRow row = ProductGridView.Rows[Convert.ToInt32(e.NewEditIndex)];
            ProductIdInput.Text = row.Cells[1].Text;
            ProductNameInput.Text = row.Cells[2].Text;
            ProductPriceInput.Text = row.Cells[3].Text;
            ProductImageInput.Text = row.Cells[4].Text;
            ProductRatingInput.Text = row.Cells[5].Text;
            ProductCategoryDropDownList.SelectedValue = ((HiddenField)row.FindControl("CategoryIdField")).Value;
            e.Cancel = true;
        }
    }
}