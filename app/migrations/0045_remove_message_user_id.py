# Generated by Django 4.1.4 on 2023-12-02 11:54

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0044_message_user_id'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='message',
            name='user_id',
        ),
    ]
