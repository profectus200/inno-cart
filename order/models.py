from django.contrib.auth.models import User
from django.db import models


# Create your models here..


class OrderModel(models.Model):
    id = models.AutoField(primary_key=True)
    productName = models.CharField(max_length=100)
    weight = models.FloatField()
    description = models.CharField(max_length=10)
    price = models.FloatField()
    reward = models.FloatField()
    contacts = models.CharField(max_length=100)
    user = models.ForeignKey(User, verbose_name='User', on_delete=models.CASCADE)

    class Meta:
        db_table = "Orders"
