from django import forms
from .models import Product_multi_image
# from django.contrib.auth.forms import UserCreationForm
# from django.contrib.auth.models import User
# appname/forms.py

# class UserRegistration(forms.Form):
#     username = forms.CharField(max_length=150)
#     email = forms.EmailField()
#     password = forms.CharField(widget=forms.PasswordInput)



class MultipleImageUploadForm(forms.ModelForm):
    class Meta:
        model = Product_multi_image
        fields = ['image']
