from django.contrib.auth.models import User
from django.db import models


class OrderModel(models.Model):
    id = models.AutoField(primary_key=True)
    user = models.ForeignKey(User, verbose_name='User', on_delete=models.CASCADE)
    product_name = models.CharField(max_length=100, null=False, blank=False)
    weight = models.FloatField(null=False, blank=False)
    description = models.CharField(max_length=500, null=False, blank=False)
    price = models.FloatField(null=False, blank=False)
    reward = models.FloatField(null=False, blank=False)
    deliverer_id = models.IntegerField(null=True, blank=True, default=-1)
    status = models.CharField(max_length=11, null=False, blank=False)
    picture = models.CharField(max_length=3000, null=True, blank=True, default='')

    # contacts = models.CharField(max_length=50)

    class Meta:
        db_table = "Orders"
