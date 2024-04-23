from django.db import models
from django.contrib.auth.models import User

# Create your models here.
class Post_category(models.Model):
    title = models.CharField(max_length=50)
    created_at = models.TimeField(auto_now_add=True)
    def __str__(self):
        return self.title

class Post(models.Model):
    title = models.CharField(max_length=50)
    job_title = models.CharField(max_length=50)
    description = models.TextField()
    description2 = models.TextField()
    image = models.ImageField(upload_to='static/img')
    Post_category_id = models.ForeignKey(Post_category,on_delete=models.CASCADE)
    created_at = models.TimeField(auto_now_add=True)
    def __str__(self):
        return self.title

class Address_info(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    name = models.CharField(max_length=50)
    current_address = models.TextField()
    permenent_address = models.TextField()
    place = models.CharField(max_length=50)
    country = models.CharField(max_length=50)
    district = models.CharField(max_length=50)
    phone=models.BigIntegerField()
    pincode = models.IntegerField()
    created_at = models.TimeField(auto_now_add=True)

class Product_category(models.Model):
    title = models.CharField(max_length=50)
    created_at = models.TimeField(auto_now_add=True)
    def __str__(self):
        return self.title

class Product(models.Model):
    title = models.CharField(max_length=50)
    product_category = models.ForeignKey(Product_category,on_delete=models.CASCADE)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    price = models.FloatField()
    description = models.TextField()
    image = models.ImageField(upload_to='product')
    created_at = models.TimeField(auto_now_add=True)
    def __str__(self):
        return self.title

class Product_multi_image(models.Model):
    image = models.ImageField(upload_to='product_multi_image',null=True,blank=True)
    product_id = models.ForeignKey(Product,on_delete=models.CASCADE,null=True, default=None)
    created_at = models.TimeField(auto_now_add=True)
    def __str__(self):
      return str(self.image)


class Profile(models.Model):
    name = models.CharField(max_length=50)
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    choice = models.CharField(max_length=3, choices=[('yes', 'Yes'), ('no', 'No')], default='no')
    certificate=models.FileField(upload_to='disabled_certificate')
    roll = models.CharField(max_length=7, choices=[('seller', 'seller'), ('company', 'company')], default='user')
    address = models.TextField()
    place = models.CharField(max_length=50)
    country = models.CharField(max_length=50)
    district = models.CharField(max_length=50)
    image = models.ImageField(upload_to='user',default=0)
    created_at = models.TimeField(auto_now_add=True)

class Order(models.Model):
    user = models.ForeignKey(User,on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    subtotal= models.DecimalField(max_digits=13, decimal_places=2)
    total_price=models.DecimalField(max_digits=13, decimal_places=2)
    created_at = models.DateTimeField(auto_now_add=True)

class Order_items(models.Model):
    order = models.ForeignKey(Order,on_delete=models.CASCADE)
    product_id= models.ForeignKey(Product,on_delete=models.CASCADE)
    quantity = models.IntegerField()
    created_at = models.DateTimeField(auto_now_add=True)


class Job_category(models.Model):
    title = models.CharField(max_length=50)
    created_at = models.TimeField(auto_now_add=True)
    def __str__(self):
        return self.title
    
class Jobs(models.Model):
    title=models.CharField(max_length=50)
    job_category=models.ForeignKey(Job_category,on_delete=models.CASCADE)
    user_id = models.ForeignKey(User, on_delete=models.CASCADE)
    description=models.TextField()
    salary=models.BigIntegerField()
    skills=models.TextField()
    image=models.ImageField(upload_to='jobs')
    def __str__(self):
        return self.title

class Job_application(models.Model):
    job_title=models.CharField(max_length=100)
    job_id=models.ForeignKey(Jobs, on_delete=models.CASCADE)
    user_id = models.ForeignKey(User, on_delete=models.CASCADE)
    name=models.CharField(max_length=100)
    email=models.EmailField()
    phoneno=models.BigIntegerField()
    photo=models.ImageField(upload_to='job_applicants')
    resume=models.FileField(upload_to='files')
    def __str__(self):
        return self.job_title
    
class user_details(models.Model):
    block_status=models.BooleanField(default=True)
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    
class Room(models.Model):#chatroom
    name=models.CharField(max_length=1000,unique=True)
    def __str__(self):
       return self.name
    
class Message(models.Model):
    value=models.TextField()#value is the message the user wants to send ,message
    date = models.TimeField(auto_now_add=True)#which date was this donne
    user=models.TextField()#which user send the particular message
    room=models.TextField()#which room is the project message is sent 
    uid=models.IntegerField()
    receiver_id = models.IntegerField()
    def __str__(self):
       return self.value   