# Generated by Django 4.0.4 on 2022-06-28 15:00

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('profile', '0002_profilemodel_person_id_profilemodel_telegram_alias_and_more'),
    ]

    operations = [
        migrations.RenameField(
            model_name='profilemodel',
            old_name='dealsCompleted',
            new_name='deals_completed',
        ),
    ]
