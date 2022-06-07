from django.db import models


# Create your models here.
class OrderModel(models.Model):
    id = models.AutoField(primary_key=True)
    productName = models.CharField(max_length=100)
    weight = models.IntegerField()
    size = models.CharField(max_length=10)
    price = models.FloatField()
    reward = models.FloatField()
    contacts = models.CharField(max_length=100)

    class Meta:
        db_table = "Orders"
