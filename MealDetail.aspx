<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MealDetail.aspx.cs" Inherits="ZardabRestaurant.MealDetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Zardab Restaurant • Detail</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"/>
    <link rel="stylesheet" href="detail_style.css" />
</head>
<body>

    <nav class="navbar navbar-light justify-content-between" style="background-color: #cb202d;">
        <div>
            <img src="https://icones.pro/wp-content/uploads/2021/04/icone-de-nourriture-jaune-symbole-png.png" class="icon">
            <label class="txt_zardab">Zardab Restaurant</label>
        </div>
    </nav>

    <%ZardabRestaurant.RestaurantEntity db = new ZardabRestaurant.RestaurantEntity();
        var data = new ZardabRestaurant.MEAL_DETAIL();
        if (Request.QueryString["id"] != null)
        {
            int meal_id = Int32.Parse(Request.QueryString["id"]);
            data = db.MEAL_DETAIL.Where(meal => meal.ID == meal_id).FirstOrDefault();

                %>

    <div class="whole">
        <div class="split left">
            <img class="img_base" src="<%:data.MEAL_IMAGE_URL %>" />
        </div>
        <div class="split right">

            <div class="first_line">
                <h1 class="meal_name"><%:data.MEAL_NAME %></h1>
                <h2 class="meal_price">AZN <%:data.MEAL_PRICE %></h2>
            </div>
            <p class="meal_ingredients"><%:data.MEAL_INGREDIENTS %></p>
            <p class="preparation_time">Hazır olma vaxtı: <%:data.MEAL_PREPARATION_TIME %> dəqiqə</p>

        </div>
    </div>

    <%}
        else
        {
            Response.Redirect("RestaurantHomePage.aspx");
        }%>
</body>
</html>
