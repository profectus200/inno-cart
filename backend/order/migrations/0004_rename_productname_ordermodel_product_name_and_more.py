# Generated by Django 4.0.4 on 2022-06-27 14:57

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('order', '0003_alter_ordermodel_contacts_and_more'),
    ]

    operations = [
        migrations.RenameField(
            model_name='ordermodel',
            old_name='productName',
            new_name='product_name',
        ),
        migrations.RemoveField(
            model_name='ordermodel',
            name='contacts',
        ),
        migrations.AddField(
            model_name='ordermodel',
            name='deliverer_id',
            field=models.IntegerField(blank=True, default=-1, null=True),
        ),
        migrations.AddField(
            model_name='ordermodel',
            name='picture',
            field=models.URLField(blank=True, default='', null=True),
        ),
        migrations.AddField(
            model_name='ordermodel',
            name='status',
            field=models.CharField(choices=[('0', 'CREATED'), ('1', 'IN_PROGRESS'), ('2', 'COMPLETED')], default='CREATED', max_length=1),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='ordermodel',
            name='description',
            field=models.CharField(max_length=500),
        ),
    ]
