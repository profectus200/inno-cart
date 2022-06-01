from django.db import models


# Create your models here.
class OrderModel(models.Model):
    product_name = models.CharField(max_length=100)
    weight = models.CharField(max_length=100)
    location = models.CharField(max_length=100)
    price = models.IntegerField()
    reward = models.IntegerField()
    shopper = models.EmailField()
    angel = models.EmailField()

    class Meta:
        db_table = "Orders"
