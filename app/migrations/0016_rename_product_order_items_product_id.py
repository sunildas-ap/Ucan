# Generated by Django 4.1.4 on 2023-11-02 09:09

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0015_rename_product_id_order_items_product'),
    ]

    operations = [
        migrations.RenameField(
            model_name='order_items',
            old_name='product',
            new_name='product_id',
        ),
    ]