from django.contrib import admin

# Register your models here.
from django.contrib import admin
from . models import *
# Register your models here.

class Post_categoryAdmin(admin.ModelAdmin):
    list_display=('title',)
    feilds=('title',)
admin.site.register(Post_category,Post_categoryAdmin)

class PostAdmin(admin.ModelAdmin):
    list_display=('title','job_title','description','description2','image','Post_category_id')
    feilds=('title','job_title','description','description2','image','Post_category_id')
admin.site.register(Post,PostAdmin)

class Address_infoAdmin(admin.ModelAdmin):
    list_display=('name','current_address','permenent_address','place','country','district','phone','pincode')
    feilds=('name','current_address','permenent_address','place','country','district','phone','pincode')
admin.site.register(Address_info,Address_infoAdmin)

class Product_categoryAdmin(admin.ModelAdmin):
    list_display=('title',)
    feilds=('title',)
admin.site.register(Product_category,Product_categoryAdmin)

class ProductAdmin(admin.ModelAdmin):
    list_display=('product_category','title','price','description','image')
    fields=('product_category','title','price','description','image')
admin.site.register(Product,ProductAdmin)

class Product_multi_imageAdmin(admin.ModelAdmin):
    list_display=('image',)
    feilds=('image',)
admin.site.register(Product_multi_image,Product_multi_imageAdmin)

class profileAdmin(admin.ModelAdmin):
    list_display=('name','address','place','country','district','image','certificate',)
    feilds=('name','address','place','country','district','image','certificate',)
admin.site.register(Profile,profileAdmin)

class OrderAdmin(admin.ModelAdmin):
    list_display=('user','subtotal','total_price')
    feilds=('user','subtotal','total_price',)
admin.site.register(Order,OrderAdmin)

class Order_itemsAdmin(admin.ModelAdmin):
    list_display=('order','product_id','quantity')
    feilds=('order','product_id','quantity',)
admin.site.register(Order_items,Order_itemsAdmin)


class JobsAdmin(admin.ModelAdmin):
    list_display=('title','job_category','description','image','salary','skills')
    fields=('title','job_category','description','image','salary','skills')
admin.site.register(Jobs,JobsAdmin)
    
class Job_categoryAdmin(admin.ModelAdmin):
    list_display=('title',)
    feilds=('title',)
admin.site.register(Job_category,Job_categoryAdmin)

class Job_applicationAdmin(admin.ModelAdmin):
    list_display=('job_title','job_id','name','email','phoneno','photo','resume')
    fields=('job_title','name','job_id','email','phoneno','photo','resume')
admin.site.register(Job_application,Job_applicationAdmin)

class user_detailsAdmin(admin.ModelAdmin):
    list_display=('block_status',)
    feilds=('block_status',)
admin.site.register(user_details,user_detailsAdmin)

admin.site.register(Room)
admin.site.register(Message)