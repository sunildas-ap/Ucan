# Generated by Django 4.1.4 on 2024-04-23 05:46

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0053_alter_address_info_user'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='profile',
            name='username',
        ),
    ]
