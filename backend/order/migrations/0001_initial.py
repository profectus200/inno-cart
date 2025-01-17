# Generated by Django 4.0.4 on 2022-05-31 14:14

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='OrderModel',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('product_name', models.CharField(max_length=100)),
                ('weight', models.CharField(max_length=100)),
                ('location', models.CharField(max_length=100)),
                ('price', models.IntegerField()),
                ('reward', models.IntegerField()),
                ('shopper', models.EmailField(max_length=254)),
                ('angel', models.EmailField(max_length=254)),
            ],
            options={
                'db_table': 'Orders',
            },
        ),
    ]
