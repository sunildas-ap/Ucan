# Generated by Django 4.1.4 on 2024-01-02 05:26

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0049_order_product'),
    ]

    operations = [
        migrations.AddField(
            model_name='address_info',
            name='phone',
            field=models.BigIntegerField(default=0),
            preserve_default=False,
        ),
    ]