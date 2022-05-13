using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ZardabRestaurant.Models
{
    public class MealItem
    {
        private int ID { get; set; }
        private String MEAL_NAME { get; set; }
        private float MEAL_PRICE { get; set; }
        private String MEAL_INGREDIENTS { get; set; }
        private int MEAL_IMAGE_URL { get; set; }

    }
}