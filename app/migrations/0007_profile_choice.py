# Generated by Django 4.1.4 on 2023-11-01 08:47

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0006_alter_profile_created_at'),
    ]

    operations = [
        migrations.AddField(
            model_name='profile',
            name='choice',
            field=models.CharField(choices=[('yes', 'Yes'), ('no', 'No')], default='no', max_length=3),
        ),
    ]
