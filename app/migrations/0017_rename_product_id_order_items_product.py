# Generated by Django 4.1.4 on 2023-11-03 05:13

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0016_rename_product_order_items_product_id'),
    ]

    operations = [
        migrations.RenameField(
            model_name='order_items',
            old_name='product_id',
            new_name='product',
        ),
    ]