# Generated by Django 4.1.4 on 2023-11-14 06:23

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0035_job_application'),
    ]

    operations = [
        migrations.AddField(
            model_name='job_application',
            name='job_id',
            field=models.IntegerField(default=0),
            preserve_default=False,
        ),
    ]