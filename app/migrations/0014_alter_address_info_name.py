# Generated by Django 4.1.4 on 2023-11-02 08:59

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0013_rename_product_category_id_product_product_category'),
    ]

    operations = [
        migrations.AlterField(
            model_name='address_info',
            name='name',
            field=models.CharField(max_length=50),
        ),
    ]
