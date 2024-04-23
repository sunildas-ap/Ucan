from django.shortcuts import render,redirect,get_object_or_404
from .models import *
from django.contrib.auth.decorators import login_required
from django.views.decorators.csrf import csrf_protect  
from django.http import HttpResponse
from django.contrib.auth.models import User
from django.http import JsonResponse
from django.contrib.auth import authenticate,logout,login,update_session_auth_hash
from django.contrib.auth import get_user_model
from decimal import Decimal
from .forms import MultipleImageUploadForm
from django.http import HttpResponseBadRequest, JsonResponse
from django.views.decorators.http import require_POST
from django.http import HttpResponseRedirect
from django.db.models import Q
import re
def index(request):
    return render(request,'index.html')
def base(request):
    user_id=request.user.id
    roll=Profile.objects.filter(user_id=user_id).values_list('roll', flat=True).first()
    choice=Profile.objects.filter(user_id=user_id).values_list('choice', flat=True).first()
    data={
        'roll':roll,
        'choice':choice,
    }
    return render(request,'base.html',data)
def index2(request):
    user_id=request.user.id
    roll=Profile.objects.filter(user_id=user_id).values_list('roll', flat=True).first()
    choice=Profile.objects.filter(user_id=user_id).values_list('choice', flat=True).first()
    slider=Post.objects.filter(Post_category_id=1)
    banner1=Post.objects.get(Post_category_id=2)
    banner2=Post.objects.get(Post_category_id=3)
    banner3=Post.objects.get(Post_category_id=4)
    products=Product.objects.all()
    catagorey=Post.objects.get(Post_category_id=5)
    bag=Post.objects.get(Post_category_id=8)
    deal=Post.objects.get(Post_category_id=7)
    insta=Post.objects.get(Post_category_id=9)
    instagram_pic=Post.objects.filter(Post_category_id=22)
    news=Post.objects.get(Post_category_id=10)
    newsimg=Post.objects.filter(Post_category_id=11)
    data={
        'slider':slider,
        'banner1':banner1,
        'banner2':banner2,
        'banner3':banner3,
        'products':products,
        'catagorey':catagorey,
        'bag':bag,
        'deal':deal,
        'insta':insta,
        'news':news,
        'newsimg':newsimg,
        'roll':roll,
        'choice':choice,
        'instagram_pic':instagram_pic
    }
    return render(request,'index-2.html',data)
def about(request):
    user_id=request.user.id
    roll=Profile.objects.filter(user_id=user_id).values_list('roll', flat=True).first()
    choice=Profile.objects.filter(user_id=user_id).values_list('choice', flat=True).first()
    abouthead=Post.objects.get(Post_category_id=12)
    question=Post.objects.filter(Post_category_id=13)
    testimonial=Post.objects.filter(Post_category_id=14)
    sucess=Post.objects.filter(Post_category_id=15)
    team=Post.objects.filter(Post_category_id=16)
    members=Post.objects.filter(Post_category_id=17)
    partners=Post.objects.filter(Post_category_id=18)
    clients=Post.objects.filter(Post_category_id=19)
    imgabout=Post.objects.get(Post_category_id=23)
    data={
     'abouthead':abouthead,
     'question':question,
     'testimonial':testimonial,
     'sucess':sucess,
     'team':team,
     'members':members,
     'partners':partners,
     'clients':clients,
     'imgabout':imgabout,
     'roll':roll,
     'choice':choice,
     
         }
    return render(request,'about.html',data)
def contact(request):
    user_id=request.user.id
    roll=Profile.objects.filter(user_id=user_id).values_list('roll', flat=True).first()
    choice=Profile.objects.filter(user_id=user_id).values_list('choice', flat=True).first()
    contacthead=Post.objects.filter(Post_category_id=20)
    country=Post.objects.filter(Post_category_id=21)
    
    data={
        'contacthead':contacthead,
        'country':country,
        'roll':roll,
        'choice':choice,
        
     }
    return render(request,'contact.html',data)

def shop(request):
    user_id=request.user.id
    roll=Profile.objects.filter(user_id=user_id).values_list('roll', flat=True).first()
    choice=Profile.objects.filter(user_id=user_id).values_list('choice', flat=True).first()
    products=Product.objects.all()
    products_category=Product_category.objects.all()
    data={
        'products':products,
        'product_category':products_category,
        'roll':roll,
        'choice':choice,
    }
    return render(request,'product.html',data)

def register(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        name = request.POST.get('name')
        choice = request.POST.get('choice')
        roll = request.POST.get('roll') 
        address = request.POST.get('address')
        place = request.POST.get('place')
        image = request.FILES.get('image')
        country = request.POST.get('country')
        district = request.POST.get('district')
        image=request.FILES.get('image')
        
        if 'certificate' in request.FILES:
            certificate = request.FILES['certificate']
        else:
            certificate = None  
        
        email = request.POST.get('email')
       

        email_regex = r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$'
        if not re.match(email_regex, email):email_regex = r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$'
        if not re.match(email_regex, email):
          return JsonResponse({'error': 'Invalid email address format.'}, status=400)
        # Check for existing username or email
        if User.objects.filter(username=username).exists() or User.objects.filter(email=email).exists():
            return JsonResponse({'error': 'Username or email is already in use.'}, status=400)


        password = request.POST.get('password')
        if len(password) < 8:
            return JsonResponse({'error': 'Password must be at least 8 characters long.'}, status=400)
        elif not re.search(r'\d', password):
            return JsonResponse({'error': 'Password must contain at least one number.'}, status=400)
        elif not re.search(r'[!@#$%^&*(),.?":{}|<>]', password):
            return JsonResponse({'error': 'Password must contain at least one special character.'}, status=400)
        user = User(username=username, email=email)
        user.set_password(password)
        user.save()
        userid=user.id
        
        profile = Profile(
            user=user, name=name, address=address, image=image, place=place, country=country,
            district=district, choice=choice, roll=roll, certificate=certificate
        )
        profile.save()
  
        userdetails=user_details(user_id=userid)
        userdetails.save()
        return JsonResponse({'message': 'User registered successfully'})
    
    return render(request, 'register.html')


def user_login(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        user = authenticate(request, username=username, password=password)
        obj=user_details.objects.filter(user_id=user).values_list('block_status', flat=True).first()
        disabled=Profile.objects.filter(user_id=user).values_list('choice', flat=True).first()
        print(disabled)

        if user is not None:
          if disabled=='yes':
            if obj==False:
             login(request, user)
             return JsonResponse({'success': True, 'message': 'Login successful', 'redirect': '/profile'})
            else:
                return JsonResponse({'success':False,'message':'your request is still pending please come back after sometime'})
          else:
                login(request, user)
                return JsonResponse({'success': True, 'message': 'Login successful', 'redirect': '/profile'})
                
        else:
            return JsonResponse({'success': False, 'message': 'Invalid credentials. Username or password is incorrect.'})
    return render(request, 'login.html')


@login_required
def profile(request):
     user_id= request.user.id
     avatar=Post.objects.get(Post_category_id=24)
     roll=Profile.objects.filter(user_id=user_id).values_list('roll', flat=True).first()
     choice=Profile.objects.filter(user_id=user_id).values_list('choice', flat=True).first()
     try:
        user_profile=Profile.objects.get(user_id=user_id)
        data={
                'log_det1':request.user,
                'log_det2':user_profile,
                'roll':roll,
                'choice':choice,
                'avatar':avatar
                }
     except:
         data={
             'log_det1':request.user,
             'log_det2':None,
         }
     return render(request, 'profile.html', data)
 
def logout_view(request):
    logout(request)
    return redirect('user_login')

def update(request):
    user_id= request.user.id
    roll=Profile.objects.filter(user_id=user_id).values_list('roll', flat=True).first()
    choice=Profile.objects.filter(user_id=user_id).values_list('choice', flat=True).first()
    try:
        user_profile=Profile.objects.get(user_id=user_id)
        data={
                'log_det1':request.user,
                'log_det2':user_profile,
                'roll':roll,
                'choice':choice,
                }
    except:
         data={
             'log_det1':request.user,
             'log_det2':None,
         }
    if request.method == 'POST':
            username = request.POST.get('username')
            email = request.POST.get('email')
            name=request.POST.get('name')
            address = request.POST.get('address')
            address=request.POST.get('address')
            place=request.POST.get('place')
            country=request.POST.get('country')
            district=request.POST.get('district')
            user_id= request.user.id
            profile = Profile.objects.get(user_id=user_id)
            user = profile.user
            user.username = username
            user.email = email
            user.save()

            profile.name = name
            profile.address = address
            profile.place = place
            profile.country = country
            profile.district = district
            
            if 'image' in request.FILES:
              profile.image = request.FILES['image']

            profile.save()
            return redirect('profile')
    return render(request, 'update.html',data)

def add_to_cart(request):
    if request.method == "POST":
        item_id = request.POST.get('item_id')
        quantity = int(request.POST.get('quantity', 1))

        # Add to the cart in session
        cart = request.session.get('cart', {})
        if item_id in cart:
            cart[item_id] += quantity
        else:
            cart[item_id] = quantity

        request.session['cart'] = cart
 
        # Calculate the total cart count
        cart_count = sum(cart.values())

        return JsonResponse({
            'success': True,
            'cart_count': cart_count
        })

    return JsonResponse({'success': False, 'error': 'Invalid method'})

def get_cart_count(request):
    cart = request.session.get('cart', {})
    return sum(cart.values())


def view_cart(request):
    user_id= request.user.id
    roll=Profile.objects.filter(user_id=user_id).values_list('roll', flat=True).first()
    choice=Profile.objects.filter(user_id=user_id).values_list('choice', flat=True).first()
    cart = request.session.get('cart', {})
    cart_items = [{'id': key, 'quantity': value} for key, value in cart.items() if key.isdigit()]  # Filter out non-integer IDs
    product_ids = [item['id'] for item in cart_items]
    products = Product.objects.filter(id__in=product_ids)
    cart_count = get_cart_count(request)
    


    for item in cart_items:
        product = products.get(id=item['id'])
        item['product'] = product
        item['total_price'] = product.price * item['quantity']

    subtotal = sum(item['total_price'] for item in cart_items)
    subtotal_formatted = "{:.2f}".format(subtotal)
    tax = 10.00 #taxes.objects.get(id=1)
    tax_formatted = "{:.2f}".format(tax)
    grand_total = subtotal + tax
    grand_total_formatted="{:.2f}".format(grand_total)
    
    

    context = {
        'cart_items': cart_items,
        'cart_count':cart_count,
        'subtotal': subtotal_formatted,
        'tax':tax_formatted,
        'grand_total':grand_total_formatted,
        'roll':roll,
        'choice':choice,
        
    }
    return render(request, 'shopping-cart.html', context)

def edit_cart_items(request):  
     request.session['cart'] = {}  
     if request.method == 'POST':
            cart = {}  # Initialize an empty cart dictionary

            # Get the lists of 'pid' and 'quantity' from the request
            pid_list = request.POST.getlist('pid[]')
            quantity_list = request.POST.getlist('quantity[]')

            # Loop through the lists and populate the cart dictionary
            for pid, quantity in zip(pid_list, quantity_list):
                cart[int(pid)] = int(quantity)

            # You now have a cart dictionary with 'pid' as keys and 'quantity' as values
            
            request.session['cart'] = cart
            # You can return a JSON response or perform any other action
            return JsonResponse({'message': 'Cart updated successfully'})

  
def remove_from_cart(request):
    if request.method == "POST":
        item_id = request.POST.get('item_id')
        cart = request.session.get('cart', {})

        if item_id in cart:
            del cart[item_id]
            request.session['cart'] = cart
            return JsonResponse({'success': True, 'message': 'Item removed successfully!'})

        return JsonResponse({'success': False, 'message': 'Item not found in cart!'})

    return JsonResponse({'success': False, 'message': 'Invalid method'})
def checkout(request):
    user_id= request.user.id
    roll=Profile.objects.filter(user_id=user_id).values_list('roll', flat=True).first()
    choice=Profile.objects.filter(user_id=user_id).values_list('choice', flat=True).first()
    cart = request.session.get('cart', {})
    cart_items = [{'id': key, 'quantity': value} for key, value in cart.items() if key.isdigit()]  # Filter out non-integer IDs
    product_ids = [item['id'] for item in cart_items]
    products = Product.objects.filter(id__in=product_ids)
    cart_count = get_cart_count(request)
    
    for item in cart_items:
        product = products.get(id=item['id'])
        item['product'] = product
        item['total_price'] = product.price * item['quantity']

    subtotal = sum(item['total_price'] for item in cart_items)
    subtotal_formatted = "{:.2f}".format(subtotal)
    tax = float(10.00)# taxes.objects.get(id=1)
    tax_formatted = "{:.2f}".format(tax)
    grand_total = subtotal + tax
    grand_total_formatted="{:.2f}".format(grand_total)
    context = {
        'cart_items': cart_items,
        'cart_count':cart_count,
        'subtotal': subtotal_formatted,
        'tax':tax_formatted,
        'grand_total':grand_total_formatted,
        'roll':roll,
        'choice':choice,
         }
        
    return render(request,'checkout.html',context)



def ordersuccess(request):
    user_id= request.user.id
    roll=Profile.objects.filter(user_id=user_id).values_list('roll', flat=True).first()
    data={
        'roll':roll,
        }
    return render(request,'ordersucess.html',data)

def checkout_form(request):
    if request.method=='POST':
      name=request.POST.get('name')
      current_address = request.POST.get('current_address')
      permenent_address = request.POST.get('permenent_address')
      place=request.POST.get('place')
      country=request.POST.get('country')
      district=request.POST.get('district')
      pincode=request.POST.get('pin_code')
      phone=request.POST.get('phone')
      subtotal = request.POST.get('subtotal')
      grand_total = request.POST.get('grand_total')
      product_id=request.POST.get('pid[]')
      user_id = request.user.id
      if len(phone) != 10:
           return JsonResponse({'error': 'Exactly 10 digits are required'})
      if len(pincode) != 6:
           return JsonResponse({'error': 'Exactly 6 digits are required'})
      adress= Address_info(user_id=user_id,name=name,current_address=current_address,permenent_address=permenent_address,place=place,country=country,district=district,phone=phone,pincode=pincode)
      adress.save()
      order = Order(
            user_id=user_id,
            product_id=product_id,
            subtotal=subtotal,
            total_price=grand_total,
        )
    order.save()
    
    pid_list = request.POST.getlist('pid[]')
    quantity_list = request.POST.getlist('quantity[]')
    
    print(order.id)
    print(pid_list)
    
            # Loop through the lists and populate the cart dictionary
    for pid, quantity in zip(pid_list, quantity_list):
        product = Product.objects.get(id=int(pid)) 
    #  #cart[int(pid)] = int(quantity)
        order_item = Order_items(
            quantity=int(quantity),
            order_id=order.id,
            product_id=product,
        )
        order_item.save()
    
      
    return JsonResponse({'status': 1})
    return render(request,'ordersucess.html',data)
def vieworderdetails(request):
    user_id= request.user.id
    roll=Profile.objects.filter(user_id=user_id).values_list('roll', flat=True).first()
    id = request.GET.get('id')
    order = get_object_or_404(Order, pk=id)
    order_items_list = Order_items.objects.filter(order=order.id)
    tax = float(10.00)# taxes.objects.get(id=1)
    tax_formatted = "{:.2f}".format(tax)
    # You can now use the 'order' object in your view
    context = {
        'order': order,
        'order_items_list':order_items_list,
        'roll':roll,
        'tax_formatted':tax_formatted
    }
    return render(request, 'order_details.html',context)



def order_history(request):  
    user_id=request.user
    user = request.user
    roll=Profile.objects.filter(user_id=user_id).values_list('roll', flat=True).first()
    choice=Profile.objects.filter(user_id=user_id).values_list('choice', flat=True).first()
    user_orders = Order.objects.filter(user=request.user).order_by('-created_at')
    # Fetch all orders for the logged-in user
    user_orders = Order.objects.filter(user=user)


    # You can now use the 'user_orders' queryset in your view
    context = {
        'user_orders': user_orders,
        'roll':roll,
        'choice':choice,
        'user_orders': user_orders
    }
    return render(request, 'order_history.html',context)

def single_product(request, product_id):
    user_id= request.user.id
    roll=Profile.objects.filter(user_id=user_id).values_list('roll', flat=True).first()  
    choice=Profile.objects.filter(user_id=user_id).values_list('choice', flat=True).first()  
    product = get_object_or_404(Product, id=product_id)
    product_categories = Product_category.objects.filter(product=product)
    category_ids = [category.id for category in product_categories]
    related = Product.objects.filter(product_category__in=category_ids).exclude(id=product_id)
    multi_image=Product_multi_image.objects.filter(product_id_id=product_id)
    data={
                'product':product,
                'productlist': product_categories,
                'related':related,
                'multi_image':multi_image,
                'roll':roll,
                'choice':choice,
         }
    return render(request, 'single_product.html',data)


def addproduct_data(request):
     all_product = Product_category.objects.all()
     user_id= request.user.id
     roll=Profile.objects.filter(user_id=user_id).values_list('roll', flat=True).first()  
     choice=Profile.objects.filter(user_id=user_id).values_list('choice', flat=True).first() 
     data={
            'all_product':all_product,
            'roll':roll,
            'choice':choice,        
     }
     return render(request,'addproduct.html',data)

def addproduct(request):
    multi_images = Product_multi_image.objects.all()
    all_product = Product_category.objects.all()  

    if request.method == 'POST':
        product_category_id = request.POST.get('product_category')  
        selected_product_category = get_object_or_404(Product_category, id=product_category_id)
        if selected_product_category is None:
            return JsonResponse({'error': 'Invalid product category'})
        title = request.POST.get('title')
        price = request.POST.get('price')
        description = request.POST.get('description')
        image = request.FILES['images']  
        multi_images = request.POST.getlist('newsfeedsmultipleimg[]')
        
        product = Product(
            product_category=selected_product_category, 
            user =request.user,
            title=title,
            price=price,
            description=description,
            image=image,
        )
        product.save()
        
        product_id = product.id
        print(product_id)
        print(multi_images)

        for multimage in multi_images:
            product_multi_image = Product_multi_image(image=multimage,product_id_id=product_id)
            product_multi_image.save()  
            Product_multi_image.objects.filter(product_id_id__isnull=True).delete()
        return JsonResponse({'message': 'Product added'})
    
    return render(request, 'addproduct.html', {'all_product':all_product })  

def addproduct_upload_images(request):
       if request.method == 'POST':
           form = MultipleImageUploadForm(request.POST, request.FILES)
           if form.is_valid():
                uploaded_image = form.save(commit=False)
                image_id = request.POST.get('image')
                uploaded_image.product_id_id=image_id  
                uploaded_image.save()  

                return JsonResponse({'success': True, 'url': uploaded_image.image.url,'image_id':uploaded_image.id, 'name':uploaded_image.image.name })
           else:
               return JsonResponse({'success': False, 'errors': form.errors})
       return JsonResponse({'success': False, 'errors': 'Invalid request method'})
   
def editproducts(request,product_id):
    user_id = request.user.id
    roll = Profile.objects.filter(user_id=user_id).values_list('roll', flat=True).first()
    choice=Profile.objects.filter(user_id=user_id).values_list('choice', flat=True).first()
    product = get_object_or_404(Product, id=product_id)
    all_product = Product_category.objects.all()
    product_value = Product.objects.get(id=product_id)
    product_category_id = product_value.product_category_id
    multi_img = Product_multi_image.objects.filter(product_id_id=product_id)
    
    data = {
        'product': product,
        'all_product': all_product,
        'product_value': product_value,
        'multi_img': multi_img,
        'roll': roll,
        'choice':choice,
        'product_category_id':product_category_id
    }
    return render(request,'editproducts.html',data)


def editproductform(request):  
    if request.method == 'POST':
        product_category_id = request.POST.get('product_category')
        product_category = get_object_or_404(Product_category, id=product_category_id)
        title = request.POST.get('title')
        price = request.POST.get('price')
        description = request.POST.get('description')
        multi_images = request.FILES.getlist('newsfeedsmultipleimg[]') 
        product_id=request.POST.get('pid')

        product_value = get_object_or_404(Product, id=product_id)

        product_value.product_category = product_category
        product_value.title = title
        product_value.price = price
        product_value.description = description
        
        if 'image' in request.FILES:
            product_value.image = request.FILES['image']

        product_value.save()
        prd=product_value.id

        for multimage in multi_images:
            new_multi_img = Product_multi_image(image=multimage, product_id_id=prd) 
            new_multi_img.save()

        multi_img = Product_multi_image.objects.filter(product_id_id=product_id)
        return redirect('myproducts')

        
def upload_image(request):
    if request.method == 'POST':
        product_id = request.POST.get('product_id')
        images = request.FILES.getlist('newsfeedsmultipleimg[]')

        for img in images:
            new_image = Product_multi_image(image=img, product_id_id=product_id)
            new_image.save()

        return JsonResponse({'success': True, 'message': 'Images uploaded successfully'})

    return JsonResponse({'success': False, 'errors': 'Invalid request method'})
                        


@require_POST
def delete_image_view(request):
    try:
        image_id = request.POST.get('image_id')
        
        image = Product_multi_image.objects.filter(id=image_id).first()
        if image:
            image.delete() 
            return JsonResponse({'success': True})
        else:
            return JsonResponse({'success': False, 'error_message': 'Image does not exist or has already been deleted'})

    except Exception as e:
        return JsonResponse({'success': False, 'error_message': str(e)})

def editimg_delete_image(request):
    try:
        image_id = request.POST.get('image_id')
        
        image = Product_multi_image.objects.filter(id=image_id).first()
        if image:
            image.delete()
            return JsonResponse({'success': True})
        else:
            return JsonResponse({'success': False, 'error_message': 'Image does not exist or has already been deleted'})

    except Exception as e:
        return JsonResponse({'success': False, 'error_message': str(e)})   

def jobpost(request):
    user_id= request.user.id
    roll=Profile.objects.filter(user_id=user_id).values_list('roll', flat=True).first()
    if request.method=='POST':
        job_category_id=request.POST.get('job_category')
        job_category= get_object_or_404(Job_category, id=job_category_id)
        title=request.POST.get('title')
        salary=request.POST.get('salary')
        description=request.POST.get('description')
        skills=request.POST.get('skills')
        image=request.FILES['image']
        user=Jobs(job_category=job_category,user_id=request.user,title=title,salary=salary,description=description,image=image,skills=skills)
        user.save()
        return JsonResponse({'message': 'Job added'})
    jobs=Job_category.objects.all()
    return render(request,'jobposting.html',{'jobs':jobs,'roll':roll})


def job(request):
    user_id= request.user.id
    roll=Profile.objects.filter(user_id=user_id).values_list('roll', flat=True).first()
    choice=Profile.objects.filter(user_id=user_id).values_list('choice', flat=True).first()
    all_jobs=Jobs.objects.all()
    return render(request,'jobs.html',{'all_jobs':all_jobs,'roll':roll,'choice':choice,})

def singlejob(request,job_id):
    user_id= request.user.id
    roll=Profile.objects.filter(user_id=user_id).values_list('roll', flat=True).first()
    choice=Profile.objects.filter(user_id=user_id).values_list('choice', flat=True).first()
    job = get_object_or_404(Jobs, id=job_id)
    job_categories = Job_category.objects.filter(jobs=job)
    category_ids = [category.id for category in job_categories]
    related_jobs= Jobs.objects.filter(job_category__in=category_ids).exclude(id=job_id)
    data={
                'job':job,
                'joblist': job_categories,
                'related_jobs':related_jobs,
                'roll':roll,
                'choice':choice,
         }
    return render(request, 'singlejob.html',data)
    
def myjob(request):
    user_id= request.user.id
    roll=Profile.objects.filter(user_id=user_id).values_list('roll', flat=True).first()
    user_ids=request.user.id
    job=Jobs.objects.filter(user_id=user_ids).all()
    return render(request,'myjobs.html',{'job':job,'roll':roll})
def myproducts(request):
    user_id= request.user.id
    roll=Profile.objects.filter(user_id=user_id).values_list('roll', flat=True).first()
    choice=Profile.objects.filter(user_id=user_id).values_list('choice', flat=True).first()
    user_ids=request.user.id
    products=Product.objects.filter(user_id=user_ids).all()
    return render(request,'myproducts.html',{'products':products,'roll':roll,'choice':choice})

def editjob(request,job_id):
    user_id= request.user.id
    roll=Profile.objects.filter(user_id=user_id).values_list('roll', flat=True).first()  
    job = get_object_or_404(Jobs, id=job_id)
    all_jobs = Job_category.objects.all()
    job_value=Jobs.objects.get(id=job_id)
    data={
        'job':job,
        'all_jobs':all_jobs,
        'job_value':job_value,
        'roll':roll,
    }
    if request.method=='POST':
        job_category_id=request.POST.get('job_category')
        job_category= get_object_or_404(Job_category, id=job_category_id)
        title=request.POST.get('title')
        salary=request.POST.get('salary')
        description=request.POST.get('description')
        skills=request.POST.get('skills')
        
        
        job_value.job_category=job_category
        job_value.title=title
        job_value.salary=salary
        job_value.description=description
        job_value.skills=skills
        
        if 'image' in request.FILES:
            job_value.image = request.FILES['image']
            
        job_value.save()
        return redirect('myjob')
    return render(request,'editjob.html',data)




def password(request,user_id):
    user_id= request.user.id
    roll=Profile.objects.filter(user_id=user_id).values_list('roll', flat=True).first()
    choice=Profile.objects.filter(user_id=user_id).values_list('choice', flat=True).first()
    ids=user_id
    user = User.objects.get(id=ids)
    data = {
        'users': user,
        'roll':roll,
        'choice':choice,
    }
    return render(request, 'changepassword.html',data)


def change_password(request):
    if request.method == 'POST':
        user = request.user
        old_password = request.POST.get('old_password', '')
        new_password = request.POST.get('new_password', '')
        confirm_password = request.POST.get('confirm_password', '')

        if not user.check_password(old_password):
            return JsonResponse({'success': False, 'message': 'Incorrect old password'})
        
        if new_password == old_password :
            return JsonResponse({'success': False, 'message': 'New password and old password are same '})

        if new_password != confirm_password:
            return JsonResponse({'success': False, 'message': 'New password and confirm password do not match'})
        
        if not new_password:
            return JsonResponse({'success': False, 'message': 'New password cannot be empty'})
        if len(new_password) < 8:
            return JsonResponse({'success': False, 'message': 'Password must be at least 8 characters long.'})
        elif not re.search(r'\d', new_password):
            return JsonResponse({'success': False, 'message':'Password must contain at least one number.'})
        elif not re.search(r'[!@#$%^&*(),.?":{}|<>]',new_password):
            return JsonResponse({'success': False, 'message':'Password must contain at least one special character.'})

        user.set_password(new_password)
        user.save()
        
        update_session_auth_hash(request, user)

        return JsonResponse({'success': True, 'message': 'Password changed successfully'})

    return JsonResponse({'success': False, 'message': 'Invalid request'})
    
def single_category(request,category_id):
    user_id= request.user.id
    roll=Profile.objects.filter(user_id=user_id).values_list('roll', flat=True).first()
    choice=Profile.objects.filter(user_id=user_id).values_list('choice', flat=True).first()
    item_catagory=Product_category.objects.get(id=category_id)
    products_categories=Product.objects.filter(product_category=item_catagory)
    products_category=Product_category.objects.all()
    data={
        'products_category':products_category,
        'item_catagory':item_catagory,
        'products_categories':products_categories,
        'roll':roll,
        'choice':choice,
    }
    return render(request,'single_category.html',data)

def job_application(request,job_id):
     user_id= request.user.id
     roll=Profile.objects.filter(user_id=user_id).values_list('roll', flat=True).first()
     choice=Profile.objects.filter(user_id=user_id).values_list('choice', flat=True).first()
     job = get_object_or_404(Jobs, id=job_id)
     try:
        selected_job=Jobs.objects.get(id=job_id)
        print(selected_job)
        data={
                'jobs':selected_job,
                'roll':roll,
                'choice':choice,
                }
     except:
         data={
             'jobs':None,
           }
     return render(request,'job_application.html',data)
 

def job_applying(request):
    if request.method == 'POST':
        job_id = request.POST.get('job_id') 
        job_title = request.POST.get('job_name')
        name = request.POST.get('name')
        email = request.POST.get('email')
        phoneno = request.POST.get('phonenumber')
        print(phoneno)
        photo = request.FILES.get('photo')
        resume = request.FILES.get('resume')

        job = get_object_or_404(Jobs, id=job_id)
        email_regex = r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$'
        if not re.match(email_regex, email):email_regex = r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$'
        if not re.match(email_regex, email):
          return JsonResponse({'error': 'Invalid email address format.'})
        if len(phoneno) != 10:
           return JsonResponse({'error': 'Exactly 10 digits are required'})
        else:
            user = Job_application(
                job_title=job_title,
                job_id=job,  
                user_id=request.user,
                name=name,
                email=email,
                phoneno=phoneno,
                photo=photo,
                resume=resume
            )
            user.save()
            return JsonResponse({'message': 'Job applied'})
    else:
        return JsonResponse({'error': 'Invalid request method'}, status=405)
    
def people_applied(request):
    user_id= request.user.id
    roll=Profile.objects.filter(user_id=user_id).values_list('roll', flat=True).first()
    job = Jobs.objects.filter(user_id=user_id).first()  # Fetching the job posted by the user

    if job:
        job_applications = Job_application.objects.filter(job_id=job)
        data={
            'job': job, 
            'job_applications': job_applications,
            'roll':roll,
        }
        return render(request, 'people_applied.html', data)
    else:
        return HttpResponse('sorry no one is applied for your job please comback again')
    
def delete_product(request,product_id):
    try:
       deleteproduct=Product.objects.get(id=product_id)
       deleteproduct.delete()
       return JsonResponse({'message': 'Product deleted successfully'}, status=200)
    except Jobs.DoesNotExist:
        return JsonResponse({'message': 'Product not found'}, status=404)
    except Exception as e:
        return JsonResponse({'message': 'Error deleting product'}, status=500)

def product_search_ajax(request):
    search_str = request.GET.get('productname', '')

    if search_str:
        products = Product.objects.filter(title__icontains=search_str)
    else:
        products = Product.objects.all()

    results = [
        {
            'title': product.title,
            'price':product.price,
            'description': product.description,  
            'image': product.image.url,
            'id': product.id
        }
        for product in products
    ]

    return JsonResponse({'results': results})

def job_search_ajax(request):
    search_str = request.GET.get('jobname', '')

    if search_str:
        jobs = Jobs.objects.filter(title__icontains=search_str)
    else:
        jobs = Jobs.objects.all()

    results = [
        {
            'title': job.title,
            'salary':job.salary,
            'skill':job.skills,
            'description': job.description,  
            'image':job.image.url,
            'id': job.id
        }
        for job in jobs
    ]

    return JsonResponse({'results': results})


def delete_jobs(request, job_id):
    try:
        delete_product = Jobs.objects.get(id=job_id)
        delete_product.delete()
        return JsonResponse({'message': 'Job deleted successfully'}, status=200)
    except Jobs.DoesNotExist:
        return JsonResponse({'message': 'Job not found'}, status=404)
    except Exception as e:
        return JsonResponse({'message': 'Error deleting job'}, status=500)
    
def userproduct(request):
    user_id = request.user.id
    products = Product.objects.filter(user_id=user_id)
    orders = Order.objects.filter(product__in=products)
    profile_ids = orders.values_list('user_id', flat=True)
    profiles = Profile.objects.filter(user_id__in=profile_ids)
    customer_data = {}
    
    for profile in profiles:
        address_info = Address_info.objects.filter(user=profile.user).first()
        customer_orders = orders.filter(user_id=profile.user_id)
        
        order_items = Order_items.objects.filter(order__in=customer_orders)
        
        for order in customer_orders:
            order_items_for_order = order_items.filter(order=order)
            purchased_products = [{
                'product': item.product_id,
                'order_item': item,
                'purchase_date': item.order.created_at  # Fetch the specific purchase date for each product order
            } for item in order_items_for_order]
            
            if profile not in customer_data:
                customer_data[profile] = []
            
            customer_data[profile].append({
                'purchased_products': purchased_products,
                'phone_number': address_info.phone,
                'current_address': address_info.current_address
            })
    
    return render(request, 'userproduct.html', {'customer_data': customer_data})


    #-----------------chat system begins from here----------------------------------#
def chat_users(request):
    user_id= request.user.id
    roll=Profile.objects.filter(user_id=user_id).values_list('roll', flat=True).first()  
    user=User.objects.all()  
    profiles=Profile.objects.all()
    avatar=Post.objects.get(Post_category_id=24)
    data={
        'user':user,
        'profiles':profiles,
        'avatar':avatar,
        'roll':roll,
    }
    return render(request,'users_chat.html',data)
    
def home(request):
    user_id=request.user.id
    print(user_id)
    details=User.objects.get(id=user_id)
    data={
        'details':details
    }
    print(details)
    return render(request, 'home.html',data)

def room(request):
    username = request.GET.get('username')
    room = 'sunil'
    room_details = Room.objects.get(name=room)
    selected_user_id = request.GET.get('selected_user_id')  # Retrieve selected user ID

    return render(request, 'room.html', {
        'username': username,
        'room': room,
        'room_details': room_details,
        'selected_user_id': selected_user_id,  # Pass selected user ID to the template
    })
def checkview(request, uid):
    user_id = request.user.id
    room = 'sunil'
    details = User.objects.filter(id=user_id).values_list('username', flat=True).first()
    username = details
    selected_user_id = request.GET.get('selected_user_id')
    if selected_user_id:
        return redirect(f'/{room}/?username={username}&selected_user_id={selected_user_id}')
    else:
        # Handle the case if selected_user_id is not present in the URL
        pass
        # new_room = Room.objects.create(name=room)
        # new_room.save()
        # return redirect('/'+room+'/?username='+username)


def send(request):
    if request.method == 'POST':
        message = request.POST.get('message')
        username = request.POST.get('username')
        room_id = request.POST.get('room_id')
        selected_user_id = request.POST.get('selected_user_id')

        if not (message and username and room_id and selected_user_id):
            return JsonResponse({'error': 'Missing parameters'}, status=400)

        try:
            new_message = Message.objects.create(
                value=message,
                user=username,
                room=room_id,
                uid=request.user.id,
                receiver_id=selected_user_id
            )
            new_message.save()
            return JsonResponse({'message': 'Message sent successfully'})
        except Exception as e:
            return JsonResponse({'error': str(e)}, status=500)

    return JsonResponse({'error': 'Invalid request method'}, status=405)

def getMessages(request):
    user_id = request.user.id
    room = 'sunil'
    room_details = Room.objects.get(name=room)
    selected_user_id = request.GET.get('selected_user_id')

    # Filter messages where the sender is the current user and the receiver is the selected user
    messages = Message.objects.filter(
        Q(uid=user_id, receiver_id=selected_user_id) | Q(uid=selected_user_id, receiver_id=user_id)
    )

    return JsonResponse({"messages": list(messages.values())})

def user_search(request):
    query = request.GET.get('username') 
    users = User.objects.filter(username__icontains=query).exclude(id=request.user.id)

    # Get profile images for the users found
    user_list = []
    for user in users:
        profile = Profile.objects.filter(user=user).first() 
        profile_image = profile.image.url if profile and profile.image else None
        user_data = {
            'username': user.username,
            'profile_image': profile_image,
            'uid': user.id  
        }
        user_list.append(user_data)
    return JsonResponse({'users': user_list},)

