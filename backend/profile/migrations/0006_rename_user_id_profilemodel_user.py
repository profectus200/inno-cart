# Generated by Django 4.0.4 on 2022-06-28 15:18

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('profile', '0005_rename_user_profilemodel_user_id'),
    ]

    operations = [
        migrations.RenameField(
            model_name='profilemodel',
            old_name='user_id',
            new_name='user',
        ),
    ]
