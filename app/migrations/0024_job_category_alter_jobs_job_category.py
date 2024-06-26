# Generated by Django 4.1.4 on 2023-11-06 10:04

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0023_rename_job_category_id_post_post_category_id'),
    ]

    operations = [
        migrations.CreateModel(
            name='Job_category',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=50)),
                ('created_at', models.TimeField(auto_now_add=True)),
            ],
        ),
        migrations.AlterField(
            model_name='jobs',
            name='job_category',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='app.job_category'),
        ),
    ]
