from django.urls import path
from . import views
from django.contrib import admin


urlpatterns = [
    path('index',views.index,name='home'),
    path('about/',views.about,name='about'),
    path('',views.index2,name='index2'),
    path('contact',views.contact,name='contact'),
    path('checkout',views.checkout,name="checkout"),
    path('shop',views.shop,name="shop"),
    path('register',views.register,name='register'), 
    # path('user_status',views.user_status,name="user_status"),
    path('user_login',views.user_login,name='user_login'),
    path('profile',views.profile,name='profile'),
    path('logout/',views.logout_view, name='logout'),
    path('update',views.update,name='update'),
    path('add_to_cart/', views.add_to_cart, name='add_to_cart'),
    path('view_cart/', views.view_cart, name='view_cart'),
    path('edit_cart_items',views.edit_cart_items,name="edit_cart_items"),
    path('remove_from_cart/', views.remove_from_cart, name='remove_from_cart'),
    path('checkout_form',views.checkout_form,name="checkout_form"),
    path('ordersuccess',views.ordersuccess,name="ordersucess"),
    path('order-history',views.order_history,name="order_history"),
    path('vieworderdetails',views.vieworderdetails,name="vieworderdetails"),
    path('addproduct_data',views.addproduct_data,name='addproduct_data'),
    path('addproduct/',views.addproduct,name='addproduct'),
    path('product/<int:product_id>/', views.single_product, name='single_product'),
    path('delete_product/<int:product_id>/',views.delete_product,name='delete_product'),
    # path('edit_upload_image/', views.edit_upload_image, name='edit_upload_image'),
    path('addproduct_upload_images/', views.addproduct_upload_images, name='addproduct_upload_images'),
    path('jobpost', views.jobpost, name='jobpost'),
    path('myproducts', views.myproducts, name='myproducts'),
    path('job', views.job, name='job'),
    path('editjob<int:job_id>', views.editjob, name='editjob'),
    path('myjob', views.myjob, name='myjob'),
    path('job_application<int:job_id>', views.job_application, name='job_application'),
    path('job_applying', views.job_applying, name='job_applying'),
    path('job<int:job_id>', views.singlejob, name='singlejob'),
    path('delete_jobs/<int:job_id>/',views.delete_jobs,name='delete_jobs'),
    path('people_applied', views.people_applied, name='people_applied'),
    path('editproduct<int:product_id>/', views.editproducts, name='editproduct'),
    path('editproductform', views.editproductform, name='editproductform'),
    path('password/<int:user_id>',views.password,name='password'),
    path('change_password/',views.change_password, name='change_password'),
    path('single_category/<int:category_id>',views.single_category, name='single_category'),
    path('delete_image/',views.delete_image_view,name='delete_image/'),
    path('editimg_delete_image/',views.editimg_delete_image,name='editimg_delete_image/'),
    path('product_search_ajax',views.product_search_ajax,name='product_search_ajax'),
    path('job_search_ajax',views.job_search_ajax,name='job_search_ajax'),
    path('upload_image/', views.upload_image, name='upload_image'),
    path('userproduct/',views.userproduct,name="userproduct"),
    #----------------chat system urls-----------------------------#
    path('admin/', admin.site.urls),  
    path('home', views.home, name='home'),
    path('sunil/', views.room, name='sunil_room'),
    path('checkview/<int:uid>/', views.checkview, name='checkview'),
    path('send', views.send, name='send'),
    path('getMessages', views.getMessages, name='getMessages'),
    path('chat_users', views.chat_users ,name='chat_users'),
    path('user-search/',views.user_search, name='user_search'),
    
    
]

