using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ZardabRestaurant
{
    public partial class RestaurantHomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void btn_search_ServerClick(object sender, EventArgs e)
        {
            string input_value = search.Value.Trim();

            if (input_value != null && !input_value.Equals(""))
            {
                Response.Redirect("RestaurantHomePage.aspx?search=" + input_value);
            }else
            {
                Response.Redirect("RestaurantHomePage.aspx");
            }

        }
    }
}