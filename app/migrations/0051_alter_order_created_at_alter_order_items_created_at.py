# Generated by Django 4.1.4 on 2024-01-02 07:06

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0050_address_info_phone'),
    ]

    operations = [
        migrations.AlterField(
            model_name='order',
            name='created_at',
            field=models.DateTimeField(auto_now_add=True),
        ),
        migrations.AlterField(
            model_name='order_items',
            name='created_at',
            field=models.DateTimeField(auto_now_add=True),
        ),
    ]
