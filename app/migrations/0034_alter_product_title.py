# Generated by Django 4.1.4 on 2023-11-09 12:23

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0033_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='product',
            name='title',
            field=models.CharField(max_length=50),
        ),
    ]
