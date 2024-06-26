# Generated by Django 4.1.4 on 2023-11-30 06:02

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0041_user_details'),
    ]

    operations = [
        migrations.CreateModel(
            name='Message',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('value', models.TextField()),
                ('date', models.TimeField(auto_now_add=True)),
                ('user', models.TextField()),
                ('room', models.TextField()),
            ],
        ),
        migrations.CreateModel(
            name='Room',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=1000)),
            ],
        ),
    ]
