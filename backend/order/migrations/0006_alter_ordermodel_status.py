# Generated by Django 4.0.4 on 2022-06-28 14:06

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('order', '0005_alter_ordermodel_picture'),
    ]

    operations = [
        migrations.AlterField(
            model_name='ordermodel',
            name='status',
            field=models.CharField(choices=[('0', 'CREATED'), ('1', 'IN_PROGRESS'), ('2', 'COMPLETED')], max_length=11),
        ),
    ]