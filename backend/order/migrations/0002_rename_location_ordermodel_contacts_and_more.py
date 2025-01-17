# Generated by Django 4.0.4 on 2022-06-25 15:59

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('order', '0001_initial'),
    ]

    operations = [
        migrations.RenameField(
            model_name='ordermodel',
            old_name='location',
            new_name='contacts',
        ),
        migrations.RenameField(
            model_name='ordermodel',
            old_name='product_name',
            new_name='productName',
        ),
        migrations.RemoveField(
            model_name='ordermodel',
            name='angel',
        ),
        migrations.RemoveField(
            model_name='ordermodel',
            name='shopper',
        ),
        migrations.AddField(
            model_name='ordermodel',
            name='description',
            field=models.CharField(default=10, max_length=10),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='ordermodel',
            name='user',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL, verbose_name='User'),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='ordermodel',
            name='id',
            field=models.AutoField(primary_key=True, serialize=False),
        ),
        migrations.AlterField(
            model_name='ordermodel',
            name='price',
            field=models.FloatField(),
        ),
        migrations.AlterField(
            model_name='ordermodel',
            name='reward',
            field=models.FloatField(),
        ),
        migrations.AlterField(
            model_name='ordermodel',
            name='weight',
            field=models.FloatField(),
        ),
    ]
