<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RestaurantHomePage.aspx.cs" Inherits="ZardabRestaurant.RestaurantHomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Zardab Restaurant</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"/>
    <!--Google Font-->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet"/>
    <!--Stylesheet-->
    <link rel="stylesheet" href="home_page.css"/>
    
</head>
<body>

          <nav class="navbar navbar-light justify-content-between" style="background-color: #cb202d;">
              <div>
                  <img src="https://icones.pro/wp-content/uploads/2021/04/icone-de-nourriture-jaune-symbole-png.png" width="40" height="40" alt="">
                  <label class="txt_zardab">Zardab Restaurant</label>
              </div>
              
                <form class="form-inline">
                    <input class="form-control mr-sm-2" type="search" placeholder="Search a meal" aria-label="Search" id="search" runat="server"/>
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit" id="btn_search" style="background-color: forestgreen; color: white;" runat="server" onserverclick="btn_search_ServerClick">Search</button>
                </form>
            </nav>

            <div class="meals">

                <%ZardabRestaurant.RestaurantEntity db = new ZardabRestaurant.RestaurantEntity();
                    var data = new List<ZardabRestaurant.MEAL>();
                    if(Request.QueryString["search"] != null)
                    {
                        string search_query = Convert.ToString(Request.QueryString["search"]);
                        data = db.MEALS.Where(meal => meal.MEAL_NAME.Contains(search_query)).ToList();
                    }else
                    {
                        data = db.MEALS.ToList();
                    }

                    foreach (var item in data)
                    {
                %>

                <div class="meal_item_box">
                    <img src="<%: item.MEAL_IMAGE_URL%>">
                    <div class="details">
                        <div class="details-sub">
                            <h5><%: item.MEAL_NAME %></h5>
                            <h5 class="price"><%: item.MEAL_PRICE%></h5>
                        </div>
                        <p><%:item.MEAL_INGREDIENTS %></p>
                        <button><a class="go_to_detail" href="https://localhost:44378/MealDetail.aspx?more_item=<%:item.MEAL_NAME %>&id=<%:item.ID %>">Go to Detail</a></button>
                    </div>
                </div>

                <% } %>
            </div>
</body>
</html>
