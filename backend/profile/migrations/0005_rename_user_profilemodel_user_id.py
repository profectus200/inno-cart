# Generated by Django 4.0.4 on 2022-06-28 15:16

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('profile', '0004_remove_profilemodel_person_id'),
    ]

    operations = [
        migrations.RenameField(
            model_name='profilemodel',
            old_name='user',
            new_name='user_id',
        ),
    ]