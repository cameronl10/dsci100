library(testthat)
library(digest)
library(rlang)

# Round double to precise integer
#
# `int_round` works to create an integer corresponding to a number that is 
# tested up to a particular decimal point of precision. This is useful when 
# there is a need to compare a numeric value using hashes.
#
# @param x Double vector of length one.
# @param digits Double vector of length one to specify decimal point of precision. Negative numbers can be used to specifying significant digits > 0.1.
#
# @return Integer vector of length one corresponding to a particular decimal point of precision.
#
# @examples
# # to get an integer up to two decimals of precision from 234.56789
# int_round(234.56789, 2)
#
# to get an integer rounded to the hundred digit from 234.56789
# int_round(234.56789, -2)
int_round <- function(x, digits = 2){
    x = x*10^digits
    xint = as.integer(x)
    xint1 = xint + 1L
    if (abs(xint - x) < abs(xint1 - x)){
        return(xint)
    }
    else {
        return(xint1)
    }
}
# -

test_0.1 <- function(){
test_that('Solution is incorrect', {
    expect_true(exists('answer0.1'))
    expect_equal(digest(answer0.1), '475bf9280aab63a82af60791302736f6') # we hid the answer to the test here so you can't see it, but we can still run the test

})
print("Success!")
    }

test_1.0 <- function(){
test_that('Did not create an object named fruit_data', {
    expect_true(exists("fruit_data")) 
})
test_that('fruit_data does not contain the correct number of rows and/or columns.', {
    expect_equal(dim(fruit_data), c(59, 7))
})
test_that('The fruit_name column in fruit_data should be of class factor.', {
    expect_true(is.factor(fruit_data$fruit_name))
})
test_that('Columns in fruit_data contain incorrect values.', {
    expect_equal(digest(int_round(sum(fruit_data$mass, na.rm = TRUE), 2)), '8c7433f4d278ef1e1e0f8d0ccb217614') # we hid the answer to the test here so you can't see it, but we can still run the test  

})
test_that('as_factor() function not used.',{
      expect_equal(c(levels(fruit_data$fruit_name)), c("apple", "mandarin", "orange", "lemon"))
})
print("Success!")
    }

test_1.1 <- function(){
test_that('Solution is incorrect', {
    expect_true(exists('answer1.1'))
    expect_equal(digest(answer1.1), '75f1160e72554f4270c809f041c7a776') # we hid the answer to the test here so you can't see it, but we can still run the test

})
print("Success!")
    }

test_1.0.1 <- function(){
test_that('Solution is incorrect', {
    expect_equal(digest(answer1.0.1), '475bf9280aab63a82af60791302736f6') # we hid the answer to the test here so you can't see it, but we can still run the test
})
print("Success!")
    }

test_1.2 <- function(){
test_that('Did not create an object named fruit_dist_2', {
    expect_true(exists("fruit_dist_2")) 
})
test_that('fruit_dist_2 is incorrect.', {
    expect_equal(digest(int_round(fruit_dist_2)), 'd8ba459e9b95d6bb43cdcb8acd275179')
    })
print("Success!")
    }

test_1.3 <- function(){
test_that('Did not create an object named fruit_dist_44', {
    expect_true(exists("fruit_dist_44")) 
})
test_that('fruit_dist_44 is incorrect.', {
    expect_equal(digest(int_round(fruit_dist_44)), 'ea07cf8b74030ff04b56ac69dd094adc')
    })
print("Success!")
    }

test_1.4 <- function(){
test_that('Solution is incorrect', {
    expect_true(exists('answer1.4'))
    expect_equal(digest(answer1.4), 'c1f86f7430df7ddb256980ea6a3b57a4') # we hid the answer to the test here so you can't see it, but we can still run the test
})
print("Success!")
    }

# # +
test_1.5 <- function(){
    test_that('Did not create an object named fruit_data_scaled', {
    expect_true(exists("fruit_data_scaled")) 
})
test_that('fruit_data_scaled does not contain the correct number of rows and/or columns.', {
    expect_equal(dim(fruit_data_scaled), c(59, 5))
})
test_that('The fruit_name column in fruit_data_scaled should be of class factor.', {
    expect_true(is.factor(fruit_data_scaled$fruit_name)) 
})
test_that('Columns in fruit_data_scaled are not centered.', {
    expect_equal(digest(int_round(mean(fruit_data_scaled$mass, na.rm = TRUE))), '1473d70e5646a26de3c52aa1abd85b1f') # we hid the answer to the test here so you can't see it, but we can still run the test  
    expect_equal(digest(int_round(mean(fruit_data_scaled$height, na.rm = TRUE))), '1473d70e5646a26de3c52aa1abd85b1f') # we hid the answer to the test here so you can't see it, but we can still run the test  
    expect_equal(digest(int_round(mean(fruit_data_scaled$width, na.rm = TRUE))), '1473d70e5646a26de3c52aa1abd85b1f') # we hid the answer to the test here so you can't see it, but we can still run the test  
    expect_equal(digest(int_round(mean(fruit_data_scaled$color_score, na.rm = TRUE))), '1473d70e5646a26de3c52aa1abd85b1f') # we hid the answer to the test here so you can't see it, but we can still run the test  

})
test_that('Columns in fruit_data_scaled are not scaled.', {
    expect_equal(digest(int_round(sd(fruit_data_scaled$mass, na.rm = TRUE))), '5d6e7fe43b3b73e5fd2961d5162486fa') # we hid the answer to the test here so you can't see it, but we can still run the test  
    expect_equal(digest(int_round(sd(fruit_data_scaled$height, na.rm = TRUE))), '5d6e7fe43b3b73e5fd2961d5162486fa') # we hid the answer to the test here so you can't see it, but we can still run the test  
    expect_equal(digest(int_round(sd(fruit_data_scaled$width, na.rm = TRUE))), '5d6e7fe43b3b73e5fd2961d5162486fa') # we hid the answer to the test here so you can't see it, but we can still run the test  
    expect_equal(digest(int_round(sd(fruit_data_scaled$color_score, na.rm = TRUE))), '5d6e7fe43b3b73e5fd2961d5162486fa') # we hid the answer to the test here so you can't see it, but we can still run the test  
})
test_that('Did not create an object named fruit_data_recipe',{
    expect_true(exists("fruit_data_recipe"))
})
test_that('fruit_data_recipe does not contain the correct predictors and outcome variables', {
    expect_true('color_score' %in% fruit_data_recipe$var_info$variable)
    expect_true('mass' %in% fruit_data_recipe$var_info$variable)
    expect_true('height' %in% fruit_data_recipe$var_info$variable)
    expect_equal(digest(as.character(fruit_data_recipe$var_info$variable[[5]])), '1298acdeb848b96767603d30382d6aff')
})
print("Success!")
    }
# -

test_1.6 <- function(){
test_that('Did not create an object named distance_44', {
    expect_true(exists("distance_44")) 
})
test_that('Did not create an object named distance_2', {
    expect_true(exists("distance_2")) 
})
test_that('distance_44 should be a distance.', {
    expect_true('dist' %in% class(distance_44))
})
test_that('distance_2 should be a distance.', {
    expect_true('dist' %in% class(distance_2))
})
test_that('distance_44 is incorrect.', {
    expect_equal(digest(int_round(distance_44)), '78f799aab6957dffdfd2bfb504f8cab5')
})
test_that('distance_2 is incorrect.', {
    expect_equal(digest(int_round(distance_2)), '192b298ed4661ab6d9a4a193b2e60b49')
})
print("Success!")
    }

test_1.7 <- function(){
    properties <- c(fruit_plot$layers[[1]]$mapping, fruit_plot$mapping)
    labels <- fruit_plot$labels
test_that('Did not create a plot named fruit_plot', {
    expect_true(exists("fruit_plot")) 
})
test_that('scaled_mass should be on the x-axis.', {
    expect_true("mass" == rlang::get_expr(properties$x))
})
test_that('scaled_color should be on the y-axis.', {
    expect_true("color_score" == rlang::get_expr(properties$y))
})
test_that('fruit_name should be mapped to colour', {
    expect_true("fruit_name" == rlang::get_expr(properties$colour))
})
test_that('fruit_plot should be a scatter plot.', {
    expect_true("GeomPoint" %in% c(class(fruit_plot$layers[[1]]$geom)))
})
test_that('Labels on the axes should be descriptive and human readable.', {
    expect_false((labels$y) == 'color_score')
    expect_false((labels$x) == 'mass')
    expect_false((labels$colour) == 'fruit_name')
})
print("Success!")
    }

test_1.9 <- function(){
test_that('Did not create an object named knn_spec', {
    expect_true(exists("knn_spec"))
    })
test_that('k is incorrect', {
    expect_equal(digest(int_round(get_expr(knn_spec$args$neighbors))), '75e76f8b41d0944779e119afd3513844')
    })
test_that('weight_func is incorrect', {
    expect_equal(digest(as.character(get_expr(knn_spec$args$weight_func))), '989de78e881829b4499af3610dfe54fd')
    })
test_that('set_engine is incorrect', {
    expect_equal(digest(as.character(knn_spec$engine)), '93fe1d3f0a1fa2e625af1e1eb51a5c33')
    })
test_that('mode is incorrect', {
    expect_equal(digest(as.character(knn_spec$mode)), 'f361ba6f6b32d068e56f61f53d35e26a')
    })
test_that('fruit_data_recipe_2 does not exist', {
    expect_true(exists('fruit_data_recipe_2'))
})
test_that('fruit_recipe_2 does not contain the correct predictors and outcome variables', {
    expect_true('color_score' %in% fruit_data_recipe_2$var_info$variable)
    expect_true('mass' %in% fruit_data_recipe_2$var_info$variable)
    expect_equal(digest(as.character(fruit_data_recipe_2$var_info$variable[[3]])), '1298acdeb848b96767603d30382d6aff')
})
test_that('Did not create an object named fruit_fit', {
    expect_true(exists("fruit_fit")) 
    })
test_that('fruit_fit should be a fit model.', {
    expect_true('workflow' %in% class(fruit_fit))
    })
test_that('fruit_fit does not contain knn_spec', {
    expect_equal(digest(int_round(get_expr(fruit_fit$fit$actions$model$spec$args$neighbors))), '75e76f8b41d0944779e119afd3513844')
    expect_equal(digest(as.character(get_expr(fruit_fit$fit$actions$model$spec$args$weight_func))), '989de78e881829b4499af3610dfe54fd')
    expect_equal(digest(fruit_fit$fit$actions$model$spec$mode), 'f361ba6f6b32d068e56f61f53d35e26a')
    })
print("Success!")
    }

test_1.10 <- function(){
test_that('Did not create an object called new_fruit', {
    expect_true(exists('new_fruit'))
})
test_that('new_fruit does not contain the correct data', {
    expect_equal(dim(new_fruit), c(1, 2))
    expect_equal(digest(int_round(new_fruit$mass, 2)), '829aba66b0d64feac09b067c4cce133c')
    expect_equal(digest(int_round(new_fruit$color_score, 2)), 'e15efc0db45ebdee4bebbca843987014')
})
test_that('Prediction is incorrect', {
    expect_equal(digest(as.character(fruit_predicted)), 'd19d62a873f08af0488f0df720cfd293')
})
print("Success!")
    }

test_1.12 <- function(){
test_that('fruit_all_predicted does not exist',{
    expect_true(exists("fruit_all_predicted"))
})
test_that('prediction is incorrect', {
     expect_equal(digest(as.character(fruit_all_predicted$.pred_class)), '5e55351cc3517b5b1031d95040455de5')   
})
print("Success!")
    }

test_2.1 <- function(){
test_that('answer2.1 does not exist',{
    expect_true(exists("answer2.1"))
})
test_that('Answer is incorrect', {
     expect_equal(digest(answer2.1), '475bf9280aab63a82af60791302736f6')   
})
print("Success!")
    }
