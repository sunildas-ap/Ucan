# Generated by Django 4.1.4 on 2024-04-23 05:49

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0054_remove_profile_username'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='profile',
            name='email',
        ),
        migrations.RemoveField(
            model_name='profile',
            name='password',
        ),
    ]